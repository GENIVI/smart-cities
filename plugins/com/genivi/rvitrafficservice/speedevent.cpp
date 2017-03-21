#include "speedevent.h"

#include <QDebug>

#include <QJsonValue>
#include <QJsonDocument>

SpeedEvent::SpeedEvent()
{
    qDebug() << "SpeedEvent constructor";
}

SpeedEvent::~SpeedEvent()
{
}

void SpeedEvent::setEventObject(const QJsonObject &o)
{
    setEventSpeedLimit(o["eventSpeedLimit"].toString());
    setEventLargeString(o["eventLargeString"].toString());
    setEventOverSpeed(o["eventOverSpeed"].toBool());
}

QString SpeedEvent::eventSpeedLimit()
{
    return _eventSpeedLimit;
}

QString SpeedEvent::eventLargeString()
{
    return _eventLargeString;
}

bool SpeedEvent::eventOverSpeed()
{
    return _eventOverSpeed;
}

void SpeedEvent::setEventSpeedLimit(const QString &eventSpeedLimit)
{
    _eventSpeedLimit = eventSpeedLimit;
}

void SpeedEvent::setEventLargeString(const QString &eventLargeString)
{
    _eventLargeString = eventLargeString;
}

void SpeedEvent::setEventOverSpeed(const bool eventOverSpeed)
{
    _eventOverSpeed = eventOverSpeed;
}
