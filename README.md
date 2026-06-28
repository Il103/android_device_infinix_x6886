# Device Tree - Infinix Hot 60 Pro Plus (X6886)

## Device Information

- **Device**: Infinix Hot 60 Pro Plus
- **Codename**: X6886
- **SoC**: MediaTek Helio G200 (MT6789)
- **CPU**: Octa-core (2x2.2 GHz Cortex-A76 + 6x2.0 GHz Cortex-A55)
- **GPU**: ARM Mali-G57 MC2 @1.1GHz
- **RAM**: 6/8GB LPDDR4X
- **Storage**: 128/256GB UFS 2.2
- **Display**: 6.78 AMOLED 1224x2720 @144Hz
- **Battery**: 5160 mAh Li-Polymer, 45W Fast Charging
- **Android**: 15 (LineageOS)

## Directory Structure

```
android_device_infinix_x6886/
    lineage_x6886.mk          <- Build entry point
    AndroidProducts.mk
    Android.mk
    BoardConfig.mk
    device.mk
    kernel.mk
    vendorsetup.sh
    system.prop
    vendor.prop
    mt6789.dtsi                <- SoC DTSI
    mt6789-X6886.dts           <- Device DTS
    rootdir/
        etc/
            init.x6886.rc
            init.mt6789.rc
            init.mt6789.usb.rc
            ueventd.mt6789.rc
        fstab.mt6789
    configs/
        media_codecs.xml
        media_profiles.xml
        audio_policy.xml
        wpa_supplicant.conf
        bt_vendor.conf
    overlay/
        framework/res/values/config.xml
    sepolicy/
        file_contexts
    prebuilt/
```

## Build

```
source build/envsetup.sh
lunch lineage_x6886-userdebug
make -j$(nproc)
```

## Credits

- **MediaTek** - SoC Platform
- **Infinix** - Device Manufacturer
- **LineageOS** - Custom ROM
- **Il103** - Device Tree Development

## License

GNU General Public License v3.0
