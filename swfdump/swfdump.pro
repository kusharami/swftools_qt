# SWF dump tool to be built with qmake
# Uses source code from www.github.com/matthiaskramm/swftools

QT -= gui

unix {
    QT -= core
}

TARGET = swfdump
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

include(../libs/swflibs_dep.pri)

QMAKE_LFLAGS -= -stdlib=libc++
unix|win32-g++ {
    QMAKE_LINK = $$QMAKE_CC
} else {
    win32 {
        LIBS += -lAdvapi32
    }
}

SOURCES += \
    $$SWFTOOLSROOT/src/swfdump.c
