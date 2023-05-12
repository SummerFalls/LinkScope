QT += core gui network serialport

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

DEFINES += APP_VERSION=\\\"1.3.0\\\"

TEMPLATE = app

CONFIG += c++11

CONFIG += precompile_header
PRECOMPILED_HEADER = pch.h

# 已经自定义生成路径，所以禁止再生成 debug 和 release 目录
CONFIG -= debug_and_release

contains(QT_ARCH, i386) {
    message("Target Arch: Win 32-bit")

    DEFINES += SOFTWARE_ARCH=32

    CONFIG(debug, debug|release) {
        CUSTOM_BUILD_DIR = $$PWD/build/x86_debug
    }

    CONFIG(release, debug|release) {
        CUSTOM_BUILD_DIR = $$PWD/build/x86_release
    }
} else {
    message("Target Arch: Win 64-bit")

    DEFINES += SOFTWARE_ARCH=64

    CONFIG(debug, debug|release) {
        CUSTOM_BUILD_DIR = $$PWD/build/x64_debug
    }

    CONFIG(release, debug|release) {
        CUSTOM_BUILD_DIR = $$PWD/build/x64_release
    }
}

DESTDIR += $${CUSTOM_BUILD_DIR}\BIN
UI_DIR  += $${CUSTOM_BUILD_DIR}\_UI_DIR
RCC_DIR += $${CUSTOM_BUILD_DIR}\_RCC_DIR
MOC_DIR += $${CUSTOM_BUILD_DIR}\_MOC_DIR
OBJECTS_DIR += $${CUSTOM_BUILD_DIR}\_OBJECTS_DIR

CONFIG(release, debug|release) {
    contains(QT_ARCH, i386) {
        QMAKE_POST_LINK += C:\Windows\System32\cmd.exe /A /Q /K $$PWD/QMAKE_POST_LINK_x86.bat
    } else {
        QMAKE_POST_LINK += C:\Windows\System32\cmd.exe /A /Q /K $$PWD/QMAKE_POST_LINK_x64.bat
    }
}

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += \
    $$UI_DIR

SOURCES += \
    aboutwindow.cpp \
    configwindow.cpp \
    gdbprocess.cpp \
    graphwindow.cpp \
    helpwindow.cpp \
    listwindow.cpp \
    logwindow.cpp \
    main.cpp \
    mainwindow.cpp \
    openocd.cpp \
    serialocd.cpp

HEADERS += \
    aboutwindow.h \
    configwindow.h \
    gdbprocess.h \
    graphwindow.h \
    helpwindow.h \
    listwindow.h \
    logwindow.h \
    mainwindow.h \
    openocd.h \
    serialocd.h \
    vartype.h \
    pch.h

FORMS += \
    aboutwindow.ui \
    configwindow.ui \
    graphwindow.ui \
    helpwindow.ui \
    listwindow.ui \
    logwindow.ui \
    mainwindow.ui

RC_ICONS = icon.ico

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    res.qrc
