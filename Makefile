HOST ?= hugin
PROFILE ?= unstable

USER ?= $(shell whoami)

FLAKE_PATH ?= .

NIX_CMD ?= nixos-rebuild

NIX_FLAGS ?= 

.PHONY: help check-root gens status gens-clean clean-result \ 
	check-syntax build test switch update \
	home build home-switch

# ========== Helpers ==========
help:  ## Show this help
	@echo "Available targets:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

check-root:  ## Check sudo rights early
	@echo " Checking sudo permissions..."
	@sudo -v
	@echo " Sudo access confirmed"

gens:  ## List all system generations
	@echo " Listing all generations:"
	sudo nixos-rebuild list-generations

status:  ## Show system status information
	@echo "󱄅 System status:"
	@echo "Host: $(HOST)"
	@echo "NixOS version: $(shell nixos-version)"
	@echo "Current generation: $(shell nixos-rebuild list-generations | grep current | awk '{print $$1}')"

gens-clean: check-root  ## Remove all old generations except current and protected
	@echo "󱕖 Cleaning old generations..."
	sudo nix-collect-garbage --delete-old
	@echo " Cleanup completed"
gc: gens-clean  ## Alias for gens-clean

clean-result:  ## Remove result directory
	@if [ -L result ]; then \
		echo "󱕖 Cleaning result symlink..."; \
		rm -f result; \
	fi
	@echo " OK."
cr: clean-result  ## Alias for clean-result

# ========== System goals ==========
check-syntax:  ## Validate flake syntax and configuration
	@echo " Checking flake syntax..."
	@nix flake check --no-build
	@echo " Flake syntax is valid"
cs: check-syntax ## Alias for check-syntax

build: check-root check-syntax  ## Build the system configuration
	@echo "󱌢  Building system configuration for $(HOST)..."
	sudo nixos-rebuild build --flake .#$(HOST)-$(PROFILE)
	@echo " Build completed successfully"
b: build  ## Alias for build

test: check-root check-syntax  ## Test configuration without permanent switch
	@echo " Testing configuration for $(HOST)..."
	sudo nixos-rebuild test --flake .#$(HOST)-$(PROFILE)
	@echo " Test completed successfully"
t: test  ## Alias for test

switch: check-root check-syntax  ## Switch to new configuration
	@echo " Switching to new configuration for $(HOST)..."
	sudo nixos-rebuild switch --flake .#$(HOST)-$(PROFILE) --option keep-going true
	@echo " Switch completed successfully"
s: switch  ## Alias for switch

update:  ## Update all flake inputs
	@echo "󰏔 Updating all flake inputs..."
	nix flake update
	@echo " Flake inputs updated"
u: update  ## Alias for update

# ========== Home manager goals ==========
home-build: check-syntax  ## Build home-manager configuration
	@echo "󰟕 Building home-manager configuration for $(USER)@$(HOST)..."
	@home-manager build --flake .#$(USER)@$(HOST) --show-trace
	@echo " Home configuration build completed"
hb: home-build  ## Alias for home-build

home-switch: check-syntax  ## Build and switch to new home-manager configuration
	@echo "󰜏 Switching to new home-manager configuration..."
	@home-manager switch --flake .#$(USER)@$(HOST) --show-trace -b backup
	@echo " Home configuration switch completed"
hs: home-switch  ## Alias for home-switch