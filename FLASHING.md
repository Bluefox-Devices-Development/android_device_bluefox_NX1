<!--
SPDX-FileCopyrightText: The LineageOS Project
SPDX-License-Identifier: CC-BY-SA-4.0
-->

Installing LineageOS on Bluefox NX1
===================================

These instructions apply to the Bluefox NX1 (`NX1` / `BF001`). The current
device tree has been validated against the B1USA Android 15 firmware identified
as `T69_S39_BLUEFOX_NX1_B1USA_20260427`.

## Before starting

* Back up all user data. The first installation requires formatting data.
* Use an actually unlocked bootloader. A displayed or reported `locked` state
  must not be treated as proof that flashing is permitted.
* Install recent `adb` and `fastboot` platform tools.
* Use a reliable USB cable and connect directly to the computer.
* Keep the matching stock firmware package and its `vendor_boot.img` available
  for recovery.
* Do not continue from another regional firmware until it has been validated.

In WSL, use `adb.exe` and `fastboot.exe` when the platform tools are provided by
Windows. The commands below use the platform-neutral names.

## Enter the bootloader

From a running Android system:

```sh
adb reboot bootloader
fastboot devices
fastboot getvar current-slot
```

Record the current slot before flashing anything.

## Install Lineage Recovery

NX1 has no standalone recovery partition. Its recovery ramdisk is stored in
`vendor_boot`; do not flash the recovery image to `boot` or `recovery`.

Flash the LineageOS `vendor_boot.img` to the slot reported above. Replace
`<slot>` with `a` or `b`:

```sh
fastboot flash vendor_boot_<slot> vendor_boot.img
fastboot reboot recovery
```

When the installed fastboot implementation resolves slot suffixes correctly,
`fastboot flash vendor_boot vendor_boot.img` is equivalent for the current
slot. The explicit command is preferred because it makes the target visible.

Do not manually flash `boot`, `dtbo`, `vbmeta`, `super`, firmware, or modem
partitions unless a release-specific migration notice explicitly requires it.

## First installation

1. In Lineage Recovery, select **Factory reset**.
2. Select **Format data / factory reset** and confirm.
3. Return to the main menu and select **Apply update**.
4. Select **Apply from ADB**.
5. On the computer, run:

```sh
adb sideload lineage-23.2-YYYYMMDD-UNOFFICIAL-NX1.zip
```

Some adb versions stop their progress display near 47 percent even though the
device completes the installation. Trust the final result shown by recovery.

If an add-on must be installed before first boot, reboot back into recovery
after the LineageOS package switches slots, then sideload the add-on. All
add-ons must explicitly support Android 16 and the installed architecture.

Select **Reboot system now** when installation is complete. The first boot can
take several minutes.

## Updating

Use the built-in updater for normal updates. A manual recovery update can also
be installed without formatting data:

```sh
adb reboot recovery
adb sideload lineage-23.2-YYYYMMDD-UNOFFICIAL-NX1.zip
```

The OTA package updates the target slot, including its `vendor_boot`; the
recovery image does not need to be flashed again for each update.

## Recovery-only testing

To test Lineage Recovery while retaining the installed system, flash only the
current slot's `vendor_boot` as described above. Restore the matching stock
image with:

```sh
fastboot flash vendor_boot_<slot> stock-vendor_boot.img
```

Do not boot the system with a random combination of slots or firmware images.

## Basic verification

After the first boot, verify the build and SELinux state:

```sh
adb shell getprop ro.lineage.version
adb shell getprop ro.boot.slot_suffix
adb shell getenforce
```

SELinux must report `Enforcing`. Test calls, mobile data, Wi-Fi, Bluetooth,
camera capture and video, charging, touch, sensors, infrared transmission, and
recovery sideload before treating a build as release-ready.

## Returning to stock

Use the complete matching stock firmware procedure. Switching to an old slot
is only safe when that slot is known to contain a complete, bootable build with
matching firmware. Restoring only one partition is not a general downgrade
method and can leave incompatible slot contents.

The current bring-up configuration enables insecure ADB for development. It
must be reviewed separately before distributing a public release.
