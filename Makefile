export ARCHS = armv7 armv7s arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WrongAlert
WrongAlert_FILES = Tweak.xm
WrongAlert_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += wrongalert
include $(THEOS_MAKE_PATH)/aggregate.mk
