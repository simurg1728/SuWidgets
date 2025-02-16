CONFIG      += plugin debug_and_release
TARGET      = $$qtLibraryTarget(suwidgetsplugin)
TEMPLATE    = lib
VERSION     = 0.1.0


CONFIG += plugin
QT +=  designer

include(SuWidgets.pri)

HEADERS     = WFHelpers.h ConstellationPlugin.h TransitionPlugin.h HistogramPlugin.h LCDPlugin.h WaveformPlugin.h SymViewPlugin.h SuWidgets.h \
    ContextAwareSpinBoxPlugin.h \
    FrequencySpinBoxPlugin.h \
    LEDPlugin.h \
    PhaseViewPlugin.h \
    PolarizationViewPlugin.h \
    QVerticalLabelPlugin.h \
    SciSpinBoxPlugin.h \
    TVDisplayPlugin.h \
    TimeSpinBoxPlugin.h \
    WaterfallPlugin.h ctkRangeSliderPlugin.h \
    ColorChooserButtonPlugin.h \
    MultiToolBoxPlugin.h
SOURCES     = ConstellationPlugin.cpp TransitionPlugin.cpp HistogramPlugin.cpp LCDPlugin.cpp WaveformPlugin.cpp SymViewPlugin.cpp SuWidgets.cpp \
    ContextAwareSpinBoxPlugin.cpp \
    FrequencySpinBoxPlugin.cpp \
    LEDPlugin.cpp \
    PhaseViewPlugin.cpp \
    PolarizationViewPlugin.cpp \
    QVerticalLabelPlugin.cpp \
    SciSpinBoxPlugin.cpp \
    TVDisplayPlugin.cpp \
    TimeSpinBoxPlugin.cpp \
    WaterfallPlugin.cpp ctkRangeSliderPlugin.cpp \
    ColorChooserButtonPlugin.cpp \
    MultiToolBoxPlugin.cpp
RESOURCES   = icons.qrc

unix: LIBS += -L. -lsuwidgets

win32 {
CONFIG(release, debug|release): BUILD_CONFIG = release
CONFIG(debug, debug|release): BUILD_CONFIG = debug
LIBS += -L$$PWD/../build/SuWidgets/$$BUILD_CONFIG/ -lsuwidgets
CONFIG += skip_target_version_ext
DEFINES += no_plugin_name_prefix
}

greaterThan(QT_MAJOR_VERSION, 4) {
CONFIG += plugin
TEMPLATE = lib
    QT += widgets
} else {
    CONFIG += designer
}

target.path = $$[QT_INSTALL_PLUGINS]/designer
INSTALLS    += target
