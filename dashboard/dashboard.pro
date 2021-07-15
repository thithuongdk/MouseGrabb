TEMPLATE = app
TARGET = dashboard
INCLUDEPATH += .
QT += quick

SOURCES += \
    main.cpp

RESOURCES += \
    dashboard.qrc

OTHER_FILES += \
    qml/dashboard.qml \
    qml/HomeSlideBar.qml \
    qml/AppSlideBar.qml \
    qml/AppHaf.qml

target.path = D:/WorkCpp/dashboard
INSTALLS += target

HEADERS += \
    mousegrabber.h

DISTFILES += \
    qml/TestMouseGrabber.qml

