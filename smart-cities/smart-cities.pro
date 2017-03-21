TEMPLATE = app

QT += qml quick
CONFIG += c++11

INCLUDEPATH += HmiController

SOURCES += main.cpp

desktop {
    DEFINES += DESKTOP_BUILD
}

RESOURCES += assets/assets.qrc \
	     qml/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    rvi-client/credentials/insecure_credential.json \
    rvi-client/rvi_conf.json \
    rvi-client/certificates/insecure_device_cert.crt \
    rvi-client/certificates/insecure_root_cert.crt \
    rvi-client/keys/insecure_device_key.pem \
    rvi-client/keys/insecure_root_key.pem \
    rvi-client/credentials/insecure_credential.jwt
