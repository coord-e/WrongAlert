export ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

BUNDLE_NAME = WrongAlert
WrongAlert_FILES = WrongAlert.mm
WrongAlert_INSTALL_PATH = /Library/PreferenceBundles
WrongAlert_FRAMEWORKS = UIKit
WrongAlert_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/WrongAlert.plist$(ECHO_END)
