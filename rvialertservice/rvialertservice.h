#ifndef RVIALERTSERVICE_H
#define RVIALERTSERVICE_H

#include <QGenericPlugin>


class RviAlertService : public QGenericPlugin
{
    Q_OBJECT
#if QT_VERSION >= 0x050000
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QGenericPluginFactoryInterface" FILE "rvialertservice.json")
#endif // QT_VERSION >= 0x050000

public:
    RviAlertService(QObject *parent = 0);
};

#endif // RVIALERTSERVICE_H
