# infinity_x6886.mk - Project Infinity-X 3.12 for Infinix Hot 60 Pro Plus (X6886)

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/infinix/x6886/device.mk)

# Set INFINITY_BUILD from TARGET_PRODUCT (needed by vendor/infinity/config/version.mk)
INFINITY_BUILD := $(subst infinity_,,$(TARGET_PRODUCT))

$(call inherit-product, vendor/infinity/config/version.mk)
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

# InfinityX build flags
INFINITY_MAINTAINER := B E R U
TARGET_HAS_UDFPS := false
TARGET_USES_64_BIT_BINDER := true

PRODUCT_DEVICE := x6886
PRODUCT_NAME := infinity_x6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 60 Pro Plus
PRODUCT_MANUFACTURER := Infinix Mobility Limited
PRODUCT_RELEASE_NAME := Infinix Hot 60 Pro Plus

BUILD_FINGERPRINT := Infinix/X6886-OP/Infinix-X6886:15/AP3A.240905.015.A2/180004:user/release-keys
