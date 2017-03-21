/*
* Copyright (C) 2016 Jaguar LandRover
*/

#include <QtQml/qqmlextensionplugin.h>
#include <qqml.h>

#include <QtRviNode/QRviNode>
#include "rvitrafficservice.h"
#include "trafficevent.h"
#include "rvispeedservice.h"
#include "speedevent.h"

QT_BEGIN_NAMESPACE

static QObject * rviNodeSingletonFactory(QQmlEngine * engine, QJSEngine * scriptEngine)
{
    Q_UNUSED(scriptEngine)
    Q_UNUSED(engine)

    return QRviNode::getInstance();
}

class QRviPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface/1.0")
public:
    virtual void registerTypes(const char *uri)
    {
        Q_ASSERT(QLatin1String(uri) == QLatin1String("com.genivi.rvitrafficservice"));
        Q_UNUSED(uri);

        // must include this registration to connect to RviNode QML object
        qmlRegisterSingletonType<QRviNode>(uri, 1, 0, "RviNode", rviNodeSingletonFactory);

        qmlRegisterType<RviTrafficService>(uri, 1, 0, "RviTrafficService");
        qmlRegisterType<RviSpeedService>(uri, 1, 0, "RviSpeedService");
    }
};

QT_END_NAMESPACE

#include "plugin.moc"
