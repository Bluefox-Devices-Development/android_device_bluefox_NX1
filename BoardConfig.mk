#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/bluefox/NX1

# Partitions
BOARD_SUPER_PARTITION_SIZE := 8589934592

# Inherit from common tree
include $(DEVICE_PATH)/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 400

# Inherit the proprietary files
include vendor/bluefox/NX1/BoardConfigVendor.mk
