# LineageOS Device Tree for Infinix Hot 60 Pro Plus (X6886)

| Device | Infinix Hot 60 Pro Plus |
| :--- | :--- |
| Chipset | MediaTek Helio G200 (MT6789) |
| CPU | Octa-core (2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55) |
| GPU | Mali-G57 MC2 |
| RAM | 8 GB |
| Storage | 128/256 GB UFS |
| Display | 6.78" AMOLED, 1224x2720, 144Hz, DPI 392 |
| Camera | 50MP (IMX882) + 13MP (GC13A0) |
| Fingerprint | Side-mounted (Goodix) |
| NFC | TMS-based |
| Android | 15 (XOS 15) |
| Kernel | Linux 5.10.198 |
| Branch | `Device.Lineage.23.2` |

## Device tree structure

```
device/infinix/x6886/
├── Android.bp / Android.mk
├── AndroidProducts.mk           # Points to lineage_x6886.mk
├── BoardConfig.mk               # Board config (MT6789, AVB, SEPolicy, etc.)
├── device.mk                    # Main device makefile (673 lines)
├── lineage_x6886.mk             # LineageOS product entry point
├── extract-files.py / setup-makefiles.py
├── proprietary-files.txt        # Full blob manifest (6405 entries)
├── *.prop                       # System/vendor/product/odm properties
├── configs/                     # 28 directories — 349 config files
│   ├── thermal/                 # 22 thermal zone configs
│   ├── nfc/                     # 8 NFC config files
│   ├── wifi/                    # 3 WiFi config files
│   ├── gnss/                    # 14 GNSS + carrier profiles
│   ├── dts/                     # 22 audio DTS configs
│   ├── performance/             # 21 performance configs
│   ├── esportspro/              # 11 esports configs
│   ├── smartpa_param/           # 3 SmartPA configs
│   ├── tranfac/                 # 7 TranFac configs
│   ├── gvoice/                  # 4 GVoice configs
│   ├── thermalEngine/           # 2 ThermalEngine configs
│   ├── memfusion2/              # 2 MemFusion configs
│   ├── predictor/               # 1 predictor config
│   ├── apdb/                    # 2 APDB configs
│   ├── aisupporter/             # 1 AISupporter config
│   ├── dar_thermal_core/        # 1 DAR thermal config
│   ├── sensors/                 # 1 sensors config
│   ├── ipsec/                   # 23 IPsec configs
│   ├── ecc/                     # 15 ECC list files
│   ├── permissions/             # 9 vendor permission XMLs
│   └── vintf/                   # 626-line VINTF manifest
├── overlay/                     # RRO overlays (Settings, SystemUI, Wifi, etc.)
├── overlay-lineage/             # Lineage-specific overlays
├── prebuilt/                    # dtbo.img (identical to stock)
├── rootdir/                     # Init RC files, fstab, ueventd, insmod
├── sepolicy/                    # 62 files — 53 .te — 39 permissive domains
└── vndk/                        # VNDK compatibility shims (v31, v32, v33, v34)
```

## Proprietary blobs coverage

| Category | Count | Stock match |
|----------|-------|-------------|
| vendor/ files | 5,275 | 100% |
| system_ext/ files | 1,234 | 100% |
| Total proprietary-files.txt | 6,405 | 99.96% |
| Kernel modules (ramdisk) | 189 | 100% identical |
| Kernel modules (vendor_dlkm) | 208 | 100% identical |
| Total vendor tree size | 3.0 GB | 6,439 files |

## VNDK compatibility shims

Vendor blobs from stock ROM were compiled against different VNDK versions. Versioned shim libraries are needed to bridge the gap:

| VNDK Version | Source | Libraries |
|:--- |:--- |:--- |
| v31 | Stock VNDK APEX (com.android.vndk.v31) | libbinder, libhidlbase, libutils, libalsautils |
| v32 | Copied from v31 (no v32 APEX in stock) | libbinder, libhidlbase, libutils |
| v33 | Stock VNDK APEX (com.android.vndk.v33) | libbinder, libhidlbase, libutils, libstagefright_foundation |
| v34 | Stock VNDK APEX (com.android.vndk.v34) | libbinder, libhidlbase, libutils, libtinyxml2 |

All shims include both arm (32-bit) and arm64 (64-bit) variants.

## Key configurations

- **SELinux**: Permissive (39 vendor domains) — safe first boot
- **DPI**: 392 (stock 480 → adjusted for user preference)
- **Thermal**: 22 zone configs from stock
- **NFC**: TMS-based (vendor.tms.*)
- **Charger**: Triple PMIC (sc8950 + sgm41516d + sc8548)
- **DTBO**: Prebuilt, identical to stock (MD5: 472d2edcc98fdb16bf14d2000f1ec3bd)

## Build

```bash
source build/envsetup.sh
lunch lineage_x6886-userdebug
mka bacon -j24
```

## Requirements

| Dependency | Repo | Branch |
|------------|------|--------|
| kernel/infinix/x6886 | Il103/kernel_infinix_x6886 | Kernel.Lineage.23.2 |
| vendor/infinix/x6886 | Il103/vendor_infinix_x6886 | Vendor.Lineage.23.2 |
| hardware/mediatek | LineageOS/android_hardware_mediatek | lineage-23.2 |
| device/mediatek/sepolicy_vndr | LineageOS/android_device_mediatek_sepolicy_vndr | lineage-23.2 |
| hardware/transsion | mt6789-transsion/hardware_transsion | lineage-23.0 |
| vendor/mediatek/ims | xiaomi-mediatek-devs/android_vendor_mediatek_ims | android-16 |

See [android_manifest_x6886](https://github.com/Il103/android_manifest_x6886) for the full local manifest.

## Credits

- Stock ROM dump by [Il103](https://github.com/Il103)
- LineageOS team
