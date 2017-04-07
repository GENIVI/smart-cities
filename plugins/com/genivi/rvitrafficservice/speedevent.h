#ifndef SPEEDEVENT_H
#define SPEEDEVENT_H

#include <QString>
#include <QJsonObject>

class SpeedEvent
{
public:
    SpeedEvent();
    ~SpeedEvent();

    // setter
    void setEventObject(const QJsonObject &o);

    // property READs
    QString eventSpeedLimit();
    bool eventOverSpeed();

private:
    QString _eventSpeedLimit;
    bool _eventOverSpeed;

    void setEventSpeedLimit(const QString &eventSpeedLimit);
    void setEventOverSpeed(const bool eventOverSpeed);
};

#endif // SPEEDEVENT_H
