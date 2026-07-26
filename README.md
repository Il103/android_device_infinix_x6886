# InfinityX 3.12 Device Tree — Infinix Hot 60 Pro Plus (X6886)

Custom ROM device tree based on LineageOS 23.2 (Android 16).

| Device | Infinix Hot 60 Pro Plus |
| :--- | :--- |
| Codename | X6886 |
| Chipset | MediaTek Helio G200 (MT6789) |
| CPU | Octa-core (2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55) |
| GPU | Mali-G57 MC2 |
| RAM | 8 GB |
| Storage | 128/256 GB UFS |
| Display | 6.78" AMOLED, 1224x2720, 144Hz, DPI 392 |
| Camera | 50MP (IMX882) + 13MP (GC13A0) |
| Fingerprint | Side-mounted (Goodix) |
| NFC | TMS-based |
| Android | 16 (LineageOS 23.2 base) |
| Kernel | Linux 5.10.198 |
| Branch | `Device.InfinityX.3.12` |
| Maintainer | B E R U (@Il103) |

## What is this?

InfinityX 3.12 is a custom ROM for the Infinix Hot 60 Pro Plus, built on top of LineageOS 23.2 (Android 16). This device tree configures hardware support, board settings, and system properties for the X6886.

## Building

```bash
repo init -u https://github.com/LineageOS/android -b lineage-23.2
repo sync
# Add local manifest (x6886.xml) to .repo/local_manifests/
repo sync
source build/envsetup.sh
lunch lineage_x6886-ap4a-userdebug
mka bacon -j$(nproc)
```

## Credits

- LineageOS team for the base ROM
- Infinix for the stock firmware (X6886-H668L-G2954)
- MT6789/Transsion community for hardware tree
