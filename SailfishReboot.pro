# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed

TARGET = harbour-sailfishreboot
QT += dbus
CONFIG += sailfishapp

SOURCES += \
    src/systemboottime.cpp \
    src/dsmeqmladapter.cpp \
    src/harbour-sailfishreboot.cpp

OTHER_FILES += \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    qml/Utils.js \
    qml/pages/AboutPage.qml \
    qml/components/AboutItem.qml \
    qml/images/SailfishRebootCover.png \
    qml/images/GPLv3.png \
    qml/pages/LicensePage.qml \
    qml/harbour-sailfishreboot.qml \
    rpm/harbour-sailfishreboot.spec \
    rpm/harbour-sailfishreboot.yaml \
    harbour-sailfishreboot.desktop

HEADERS += \
    src/systemboottime.h \
    src/dsmeqmladapter.h
