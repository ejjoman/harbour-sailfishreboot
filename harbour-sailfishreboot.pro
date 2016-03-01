# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed

TARGET = harbour-sailfishreboot
CONFIG += sailfishapp

QT += dbus

SOURCES += \
    src/systemboottime.cpp \
    src/dsmeqmladapter.cpp \
    src/harbour-sailfishreboot.cpp \
    src/qmlsettings.cpp

OTHER_FILES += \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    qml/Utils.js \
    qml/pages/AboutPage.qml \
    qml/common/AboutModel.qml \
    qml/common/AboutItem.qml \
    qml/images/GPLv3.png \
    qml/pages/LicensePage.qml \
    qml/harbour-sailfishreboot.qml \
    rpm/harbour-sailfishreboot.spec \
    rpm/harbour-sailfishreboot.yaml \
    harbour-sailfishreboot.desktop \
    qml/common/Settings.qml \
    qml/pages/SettingsPage.qml

HEADERS += \
    src/systemboottime.h \
    src/dsmeqmladapter.h \
    src/qmlsettings.h

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += \
    translations/harbour-sailfishreboot-en.ts \
    translations/harbour-sailfishreboot-de.ts \
    translations/harbour-sailfishreboot-ca.ts \
    translations/harbour-sailfishreboot-es.ts \
    translations/harbour-sailfishreboot-gl_ES.ts \
    translations/harbour-sailfishreboot-fi.ts \
    translations/harbour-sailfishreboot-da.ts \
    translations/harbour-sailfishreboot-nl.ts \
    translations/harbour-sailfishreboot-zh.ts \
    translations/harbour-sailfishreboot-zh_CN.ts
