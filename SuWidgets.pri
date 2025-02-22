equals(QT_MAJOR_VERSION, 5):lessThan(QT_MINOR_VERSION, 9) {
  QMAKE_CXXFLAGS += -std=gnu++11
} else {
  CONFIG += c++14
}

greaterThan(QT_MAJOR_VERSION, 5): QT += openglwidgets

include(ctk.pri)
include(lcd.pri)
include(led.pri)
include(histogram.pri)
include(constellation.pri)
include(phaseview.pri)
include(polarizationview.pri)
include(qverticallabel.pri)
include(symview.pri)
include(transition.pri)
include(waveform.pri)
include(waterfall.pri)
include(colorchooserbutton.pri)
include(contextawarespinbox.pri)
include(scispinbox.pri)
include(frequencyspinbox.pri)
include(tvdisplay.pri)
include(timespinbox.pri)
include(multitoolbox.pri)
include(glwaterfall.pri)
include(abstractwaterfall.pri)

HEADERS += ThrottleableWidget.h \
    Version.h \
    SuWidgetsHelpers.h \
    WFHelpers.h

SOURCES += ThrottleableWidget.cpp \
    SuWidgetsHelpers.cpp \
    WFHelpers.cpp

WIDGET_HEADERS += ThrottleableWidget.h SuWidgetsHelpers.h Version.h WFHelpers.h

win32 {
include($$PWD/../sigutils/sigutils.pri)
include($$PWD/../libthirdparty/libsndfile-1.2.2.pri)
}

unix {
CONFIG += link_pkgconfig
PKGCONFIG += sigutils fftw3 sndfile volk
}
