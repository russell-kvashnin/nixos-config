{config, ...}: {
  boot = {
    blacklistedKernelModules = ["rtsx_pci"];
    extraModulePackages = with config.boot.kernelPackages; [acpi_call];

    initrd = {
      kernelModules = [
        "dm-crypt"
        "aesni_intel"
        "cryptd"
      ];
      availableKernelModules = [
        "xhci_pci"
        "nvme"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
    };

    kernelModules = [
      "dell-wmi"
      "dell-smbios"

      "hidp"
      "hid_generic"

      "kvm-intel"

      "thunderbolt"
    ];

    kernelParams = [
      # ACPI
      "acpi_osi=Linux"

      "acpi_backlight=vendor"

      # NVMe
      "nvme_core.default_ps_max_latency_us=0"

      # Console
      "no_console_suspend"

      # Intel GPU
      "i915.enable_fbc=1"
      "i915.enable_psr=0"
      "i915.enable_guc=2"
      "i915.enable_dc=1"
      "i915.force_probe=*"
      "i915.fastboot=1"

      # DRM
      "drm.vblankoffdelay=1"

      # Audio
      "snd-intel-dspcfg.dsp_driver=3"

      # Security
      "intel_iommu=on"

      # Sleep
      "mem_sleep_default=s2idle"

      # Disable card reader pm
      "rtsx_pci.runtime_pm=0"
    ];

    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;

        consoleMode = "max";
      };
    };
  };
}
