#ifndef RVITRAFFICSERVICE_H
#define RVITRAFFICSERVICE_H

#include <QObject>
#include <QtRviNode/QRviServiceObject>

class TrafficEvent;

class RviTrafficService : public QRviServiceObject
{
    Q_OBJECT
    Q_DISABLE_COPY(RviTrafficService)

public:
    RviTrafficService(QObject *parent = 0);
    ~RviTrafficService();

    void rviServiceCallback(int fd, void *serviceData, const char *parameters) override;

public Q_SLOTS:
    void trafficEventChanged();

Q_SIGNALS:
    void notifyHmi(const QString &eventType, const QString &eventId, const QString &eventTitle, const QString &eventExplanation);

private:
    TrafficEvent * _event;
};

#endif // RVITRAFFICSERVICE_H
