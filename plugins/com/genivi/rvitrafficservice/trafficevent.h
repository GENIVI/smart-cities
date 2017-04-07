#ifndef TRAFFICEVENT_H
#define TRAFFICEVENT_H

#include <QString>
#include <QJsonObject>
#include <QUrl>

/*
 * Note: This object is intended to be a property container for QML
 * bindings to JSON event structures.
 *
 */


class TrafficEvent
{
public:
    TrafficEvent();
    ~TrafficEvent();

    // setter
    void setEventObject(const QJsonObject &o);

    // property READs
    QString eventId();
    QString eventTitle();
    QString eventExplanation();

private:
    // QML properties require member variables
    // json members
    QString _eventId;
    QString _eventTitle;
    QString _eventExplanation;

    // TrafficEvent currently READ-ONLY
    // property setters
    void setEventId(const QString &eventId);
    void setEventTitle(const QString &eventTitle);
    void setEventExplanation(const QString &eventExplanation);
};

#endif // TRAFFICEVENT_H
