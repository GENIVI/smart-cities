#include "trafficevent.h"

#include <QDebug>

#include <QJsonValue>
#include <QJsonDocument>

TrafficEvent::TrafficEvent()
{
    qDebug() << "TrafficEvent constructor";
}

TrafficEvent::~TrafficEvent()
{
}

void TrafficEvent::setEventObject(const QJsonObject &o)
{
    setEventId(o["eventId"].toString());
    setEventTitle(o["eventTitle"].toString());
    setEventExplanation(o["eventExplanation"].toString());
}

QString TrafficEvent::eventId()
{
    return _eventId;
}

QString TrafficEvent::eventTitle()
{
    return _eventTitle;
}

QString TrafficEvent::eventExplanation()
{
    return _eventExplanation;
}

void TrafficEvent::setEventId(const QString &eventId = Q_NULLPTR)
{
    _eventId = eventId;
}

void TrafficEvent::setEventTitle(const QString &eventTitle = Q_NULLPTR)
{
    _eventTitle = eventTitle;
}

void TrafficEvent::setEventExplanation(const QString &eventExplanation = Q_NULLPTR)
{
    _eventExplanation = eventExplanation;
}


