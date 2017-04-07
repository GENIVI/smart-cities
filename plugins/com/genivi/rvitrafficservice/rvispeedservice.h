#ifndef RVISPEEDSERVICE_H
#define RVISPEEDSERVICE_H

#include <QObject>
#include <QtRviNode/QRviServiceObject>

class SpeedEvent;

class RviSpeedService : public QRviServiceObject
{
    Q_OBJECT
    Q_DISABLE_COPY(RviSpeedService)

public:
    RviSpeedService(QObject *parent = Q_NULLPTR);
    ~RviSpeedService();

    void rviServiceCallback(int fd, void *serviceData, const char *parameters) override;

public Q_SLOTS:
    void speedEventChanged();

Q_SIGNALS:
    void notifyHmi(const QString &eventType, const QString &eventSpeedLimit = QString(), const bool eventOverSpeed = false);

private:
    SpeedEvent * _event;
};

#endif // RVISPEEDSERVICE_H
