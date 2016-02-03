#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from crackling device
$(call inherit-product, device/wileyfox/crackling/device.mk)

# Inherit from cm-b2g
$(call inherit-product-if-exists, vendor/cm/config/common_full.mk)

TARGET_DEVICE_BLOBS_LIST := true
TARGET_DEVICE_BLOBS_SRC_DIR := vendor/wileyfox/crackling/proprietary
TARGET_DEVICE_BLOBS := \
    device/wileyfox/crackling/proprietary-files.txt \
    device/wileyfox/crackling/proprietary-files-qc.txt

# Build gcko as 32bit on 64bit build target
BUILD_MULTILIB_GECKO_AS_2ND_ARCH := true

# for Gecko to use the correct resolution assets
# Valid options are: 1.5 | 2 | 2.25
GAIA_DEV_PIXELS_PER_PX := 2

# for Gecko to use the correct boot animation
# Valid options are: hvga | fwvga | qHD | 720p | 1080p
BOOTANIMATION_ASSET_SIZE := 720p

# for Gecko to support usb mass storage
# You may need to add mass_storage to init.oem.usb.rc
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage

# for Gecko to support virtual home button
PRODUCT_PROPERTY_OVERRIDES += \
    ro.moz.has_home_button=0

# for Gecko to support Dual SIM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds \
    ro.moz.ril.numclients=2 \
    ro.moz.ril.subscription_control=true

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := crackling
PRODUCT_NAME := full_crackling
PRODUCT_BRAND := Wileyfox
PRODUCT_MODEL := Wileyfox Swift
PRODUCT_MANUFACTURER := Wileyfox

