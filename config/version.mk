# Copyright (C) 2017 AospExtended ROM
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#Extended Versioning
EXTENDED_VERSION = v2.0

ifndef EXTENDED_BUILD_TYPE
    EXTENDED_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(EXTENDED_BUILD_TYPE), OFFICIAL)

# AEXOTA
#$(call inherit-product-if-exists, vendor/aosp/config/ota.mk)

endif

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(CUSTOM_BUILD))

EXTENDED_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
EXTENDED_MOD_VERSION := aosep-$(EXTENDED_VERSION)-$(EXTENDED_BUILD_DATE)-$(EXTENDED_BUILD_TYPE)
EXTENDED_FINGERPRINT := aosep/$(EXTENDED_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(EXTENDED_BUILD_DATE)


PRODUCT_GENERIC_PROPERTIES += \
  ro.aosep.version=$(EXTENDED_VERSION) \
  ro.aosep.releasetype=$(EXTENDED_BUILD_TYPE) \
  ro.modversion=$(EXTENDED_MOD_VERSION)

EXTENDED_DISPLAY_VERSION := aosep-$(EXTENDED_VERSION)-$(EXTENDED_BUILD_TYPE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.aosep.display.version=$(EXTENDED_DISPLAY_VERSION) \
  ro.aosep.fingerprint=$(EXTENDED_FINGERPRINT)
