TEMPLATE = app

QT += qml quick widgets androidextras

SOURCES += main.cpp \
    qt_gstreamer_android-1.0.cpp \
    gstreamer_android-1.0.c

RESOURCES += qml.qrc

TARGET = gstandroid

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android_additions

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

GSTREAMER_ROOT=/home/matt/Projects/cerbero/build/dist/android_armv7
INCLUDEPATH += $${GSTREAMER_ROOT}/include/gstreamer-1.0 $${GSTREAMER_ROOT}/lib/gstreamer-1.0/include $${GSTREAMER_ROOT}/include/glib-2.0 $${GSTREAMER_ROOT}/lib/glib-2.0/include $${GSTREAMER_ROOT}/include
#DEPENDPATH += $${GSTREAMER_ROOT}/include

# !!!!! order of the LIBS matters !!!!!

#plugins
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstcoreelements.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgsttypefindfunctions.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstvideoconvert.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstvideorate.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstvideoscale.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstvideofilter.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstautodetect.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstvideotestsrc.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstplayback.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstx264.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstvideoparsersbad.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstandroidmedia.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstopengl.a
LIBS += $${GSTREAMER_ROOT}/lib/gstreamer-1.0/libgstqmlgl.a

#plugin libs
LIBS += $${GSTREAMER_ROOT}/lib/liborc-0.4.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstgl-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgraphene-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libpng16.a
LIBS += $${GSTREAMER_ROOT}/lib/libjpeg.a
LIBS += $${GSTREAMER_ROOT}/lib/libx264.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstvideo-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstbadbase-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstbadvideo-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstaudio-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstpbutils-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgsttag-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstphotography-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstcontroller-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstcodecparsers-1.0.a
LIBS += -lEGL -lGLESv2

#gstreamer libs
LIBS += $${GSTREAMER_ROOT}/lib/libgstbase-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgstreamer-1.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgmodule-2.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libgobject-2.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libglib-2.0.a
LIBS += $${GSTREAMER_ROOT}/lib/libffi.a
#LIBS += $${GSTREAMER_ROOT}/lib/libpcre.a
LIBS += $${GSTREAMER_ROOT}/lib/libiconv.a
LIBS += $${GSTREAMER_ROOT}/lib/libintl.a
LIBS += $${GSTREAMER_ROOT}/lib/libz.a

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    gstreamer_android.h
