#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/bluefox/NX1

# Inherit from common tree
include $(DEVICE_PATH)/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/bluefox/NX1/BoardConfigVendor.mk
