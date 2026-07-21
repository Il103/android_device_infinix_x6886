# LineageOS Device Tree for Infinix Hot 60 Pro Plus (X6886)

| Device | Infinix Hot 60 Pro Plus |
| :--- | :--- |
| Chipset | MediaTek Helio G200 (MT6789) |
| CPU | Octa-core (2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55) |
| GPU | Mali-G57 MC2 |
| RAM | 8 GB |
| Storage | 128/256 GB |
| Display | 6.78" IPS LCD, 1080x2460 |
| Android | 15 ( XOS 15 ) |
| Kernel | Linux 5.10.237 |
| Branch | lineage-23.2 |

## Device tree structure

```
device/infinix/x6886/
├── Android.mk / Android.bp
├── AndroidProducts.mk           # Points to lineage_x6886.mk
├── BoardConfig.mk               # Board config (MT6789, AVB, SEPolicy, etc.)
├── device.mk                    # Main device makefile (all sections)
├── lineage_x6886.mk             # LineageOS product entry point
├── extract-files.py / setup-makefiles.py
├── proprietary-files.txt        # Full blob manifest (7074 entries)
├── *.prop                       # System/vendor/product/odm properties
├── configs/                     # Audio, media, power, sensors, thermal, vintf
├── overlay/                     # RRO overlays (Settings, SystemUI, Wifi, etc.)
├── overlay-lineage/             # Lineage-specific overlays
├── prebuilt/                    # dtb.img, dtbo.img, ramdisk.cpio
├── rootdir/                     # Init RC files, fstab, ueventd, insmod
├── sepolicy/                    # SELinux policies (private/public/vendor)
└── vndk/                        # VNDK libs (binder, hidlbase, utils)
```

## Build

```bash
# Setup
source build/envsetup.sh
lunch lineage_x6886-userdebug

# Build
mka bacon -j$(nproc)
```

## Requirements

| Dependency | Repo | Source |
|------------|------|--------|
| kernel/infinix/x6886 | kernel_infinix_x6886 | lineage-23.2 |
| vendor/infinix/x6886 | vendor_infinix_x6886 | lineage-23.2 (Git LFS) |
| hardware/mediatek | LineageOS/android_hardware_mediatek | lineage-23.2 |
| device/mediatek/sepolicy_vndr | LineageOS/android_device_mediatek_sepolicy_vndr | lineage-23.2 |
| hardware/transsion | mt6789-transsion/hardware_transsion | lineage-23.2 |
| vendor/mediatek/ims | xiaomi-mediatek-devs/android_vendor_mediatek_ims | android-16 |

See [android_manifest_x6886](https://github.com/Il103/android_manifest_x6886) for the full local manifest.

## Credits

- Stock ROM dump by [Il103](https://github.com/Il103)
- LineageOS team
