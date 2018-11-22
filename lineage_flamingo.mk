# Boot animation
TARGET_SCREEN_HEIGHT	:= 854
TARGET_SCREEN_WIDTH	:= 480

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/flamingo/device.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit LOS common Phone stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Fingerprint for flamingo (from stock)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=D2203
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Sony/D2203/D2203:4.4.4/18.5.C.0.19/7H9_bQ:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="D2203-user 4.4.4 18.5.C.0.19 7H9_bQ release-keys"

# Google Play Store identifier
PRODUCT_GMS_CLIENTID_BASE := android-sonyericsson

# Override Product Name for LineageOS
PRODUCT_NAME		:= lineage_flamingo
PRODUCT_DEVICE		:= flamingo
PRODUCT_MODEL		:= Xperia E3
PRODUCT_BRAND		:= Sony
PRODUCT_MANUFACTURER	:= Sony
