#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/bluefox/NX1/device.mk)

# Keep ADB available while the bootloader reports a spoofed locked state.
WITH_ADB_INSECURE := true

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_NX1
PRODUCT_DEVICE := NX1
PRODUCT_MANUFACTURER := BLUEFOX
PRODUCT_BRAND := BLUEFOX
PRODUCT_MODEL := NX1

PRODUCT_GMS_CLIENTID_BASE := android-bluefox

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="sys_mssi_64_ww_armv82-user 15 AP3A.240905.015.A2 mp1rck6991v164P4 release-keys" \
    BuildFingerprint=BLUEFOX/BF001/BLUEFOX:15/AP3A.240905.015.A2/2025_20260427:user/release-keys \
    DeviceName=BLUEFOX \
    DeviceProduct=BF001 \
    SystemDevice=BLUEFOX \
    SystemName=BF001
