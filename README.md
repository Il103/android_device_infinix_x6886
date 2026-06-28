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
├── system.prop                 # System properties from stock
├── vendor.prop                 # Vendor properties from stock
├── configs/                    # Audio/media/wifi configs
├── overlay/                    # RRO overlays
├── prebuilt/                   # Kernel, DTB, DTBO
├── rootdir/                    # Init files, fstab, ueventd
│   ├── fstab.mt6789
│   └── etc/
│       ├── init.mt6789.rc
│       ├── init.mt6789.usb.rc
│       ├── init.x6886.rc
│       └── ueventd.mt6789.rc
└── sepolicy/                   # SELinux policies from stock
```

## Credits

- [Il103](https://github.com/Il103) - Original device tree and stock ROM dump
- LineageOS team
