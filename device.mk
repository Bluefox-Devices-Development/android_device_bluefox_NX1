#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Shipping API Level
BOARD_SHIPPING_API_LEVEL := 202404
PRODUCT_SHIPPING_API_LEVEL := 35

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from common tree
$(call inherit-product, device/bluefox/NX1/mt6768.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/bluefox/NX1/NX1-vendor.mk)
