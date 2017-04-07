TEMPLATE = lib
TARGET = rvitrafficservice
QT += qml quick rvinode
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.genivi.rvitrafficservice

# Input
SOURCES += \
    plugin.cpp \
    rvitrafficservice.cpp \
    trafficevent.cpp \
    rvispeedservice.cpp \
    speedevent.cpp \
    trafficalertmodel.cpp

HEADERS += \
    rvitrafficservice.h \
    trafficevent.h \
    rvispeedservice.h \
    speedevent.h \
    trafficalertmodel.h

OTHER_FILES += rvi_conf.json

DISTFILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

# TODO: why is this required when the QtRvi module should handle this?
!isEmpty($$(QNX_TARGET)) {
    message(QNX Target Build!!!)
    INCLUDEPATH += $$(QNX_TARGET)/x86/include
    LIBS += -L$$(QNX_TARGET)/x86/lib -lrvi
} else {
    INCLUDEPATH += /usr/local/include
    LIBS += -L/usr/local/lib -lrvi
}

# Avoid going to release/debug subdirectory
win32: DESTDIR = ./

qmldir.files = qmldir
installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
qmldir.path = $$installPath
target.path = $$installPath
INSTALLS += target qmldir
