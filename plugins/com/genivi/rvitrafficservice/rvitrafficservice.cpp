#include "rvitrafficservice.h"

#include "trafficevent.h"

#include <QDebug>

#include <QJsonObject>
#include <QJsonDocument>


RviTrafficService::RviTrafficService(QObject *parent) :
    QRviServiceObject(parent), _event(Q_NULLPTR)
{
    _event = new TrafficEvent();
}

RviTrafficService::~RviTrafficService()
{
    if (_event) {
        delete _event;
        _event = nullptr;
    }
}

void RviTrafficService::rviServiceCallback(int fd, void *serviceData, const char *parameters)
{
    Q_UNUSED(fd);
    Q_UNUSED(serviceData);
    QByteArray b(parameters, strlen(parameters));
    _event->setEventObject(QJsonDocument::fromJson(b).object());
    emit notifyHmi("Traffic Event", _event->eventId(), _event->eventTitle(), _event->eventExplanation());
}
