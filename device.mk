#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Display
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2400

# Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayNX1

# Shipping API Level
BOARD_SHIPPING_API_LEVEL := 202404
PRODUCT_SHIPPING_API_LEVEL := 35

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# SPL
BOOT_SECURITY_PATCH := 2025-10-01
INIT_BOOT_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Inherit from common tree
$(call inherit-product, device/bluefox/NX1/mt6768.mk)

# Inherit the proprietary files
$(call inherit-product, vendor/bluefox/NX1/NX1-vendor.mk)
