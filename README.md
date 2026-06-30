# LineageOS Device Tree for Infinix Hot 60 Pro Plus (X6886)

| Device | Infinix Hot 60 Pro Plus |
| :--- | :--- |
| Chipset | MediaTek Helio G200 (MT6789) |
| CPU | Octa-core (2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55) |
| GPU | Mali-G57 MC2 |
| RAM | 8 GB |
| Storage | 128/256 GB |
| Display | 6.78" IPS LCD, 1080x2460 |
| Android | 15 (SDK 35) |
| Branch | lineage-23.2 |

## Build

```bash
source build/envsetup.sh
lunch lineage_x6886-userdebug
mka bacon
```

## Device tree structure

```
device/infinix/x6886/
├── Android.mk
├── AndroidProducts.mk
├── BoardConfig.mk
├── device.mk                    # Main device makefile
├── lineage_x6886.mk            # LineageOS entry point
├── extract-files.py            # Blob extraction from device
├── setup-makefiles.py          # Makefile generator
├── proprietary-files.txt       # Full blob manifest (5273 entries)
├── system.prop                 # System properties from stock
├── system_ext.prop             # system_ext properties from stock
├── vendor.prop                 # Vendor properties from stock
├── product.prop                # Product properties from stock
├── odm.prop                    # ODM properties from stock
├── odm_dlkm.prop               # odm_dlkm properties from stock
├── vendor_dlkm.prop            # vendor_dlkm properties from stock
├── vendor_logtag.mk
├── configs/                    # Audio/media/wifi/vintf configs
├── overlay/                    # RRO overlays
├── overlay-lineage/            # Lineage-specific overlays
├── rootdir/                    # Init files, fstab, ueventd
│   ├── Android.bp              # Soong module definitions
│   ├── fstab.mt6789
│   ├── etc/
│   │   ├── init.mt6789.rc
│   │   ├── init.mt6789.usb.rc
│   │   ├── init.x6886.rc
│   │   └── ueventd.mt6789.rc
│   └── etc/init/hw/
│       ├── factory_init.rc
│       ├── factory_init.connectivity.rc
│       ├── factory_init.project.rc
│       ├── meta_init.rc
│       ├── meta_init.connectivity.rc
│       ├── meta_init.project.rc
│       ├── init.aee.rc
│       ├── init.cgroup.rc
│       ├── init.conninfra.rc
│       ├── init.mt6789.rc
│       ├── init.mt6789.power.rc
│       ├── init.mt6789.sensor_hal.rc
│       ├── init.mt6789.usb.rc
│       ├── init.mt6789_charging.rc
│       ├── init.project.rc
│       ├── init.sensor_hal.rc
│       ├── init_connectivity.rc
│       ├── multi_init.rc
│       ├── init.insmod.rc
│       ├── init.modem.rc
│       ├── init.c2k.rc
│       ├── init.ram_console.rc
│       ├── init.trustonic.rc
│       └── init.mobile_log_d.rc
├── sepolicy/                   # SELinux policies from stock
└── vndk/                       # VNDK configs
```

## Credits

- [Il103](https://github.com/Il103) - Original device tree and stock ROM dump
- LineageOS team
