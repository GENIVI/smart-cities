#include "rvispeedservice.h"

#include "speedevent.h"

#include <QDebug>

#include <QJsonObject>
#include <QJsonDocument>

RviSpeedService::RviSpeedService(QObject *parent) :
    QRviServiceObject(parent), _event(Q_NULLPTR)
{
    _event = new SpeedEvent();
}

RviSpeedService::~RviSpeedService()
{
    if (_event) {
        delete _event;
        _event = nullptr;
    }
}

void RviSpeedService::rviServiceCallback(int fd, void *serviceData, const char *parameters)
{
    Q_UNUSED(fd);
    Q_UNUSED(serviceData);
    QByteArray b(parameters, strlen(parameters));
    _event->setEventObject(QJsonDocument::fromJson(b).object());
    emit notifyHmi("Speed Event", _event->eventSpeedLimit(), _event->eventLargeString(), _event->eventOverSpeed());
}
