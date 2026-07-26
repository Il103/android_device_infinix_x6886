# lineage_x6886.mk - LineageOS 23.2 for Infinix Hot 60 Pro Plus (X6886)
# Auto-generated from stock ROM dump

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/infinix/x6886/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := x6886
PRODUCT_NAME := lineage_x6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 60 Pro Plus
PRODUCT_MANUFACTURER := Infinix Mobility Limited
PRODUCT_RELEASE_NAME := Infinix Hot 60 Pro Plus

BUILD_FINGERPRINT := Infinix/X6886-OP/Infinix-X6886:15/AP3A.240905.015.A2/180004:user/release-keys

