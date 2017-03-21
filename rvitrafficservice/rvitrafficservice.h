#ifndef RVITRAFFICSERVICE_H
#define RVITRAFFICSERVICE_H

#include <QTextCodecPlugin>


class RviTrafficService : public QTextCodecPlugin
{
    Q_OBJECT

public:
    RviTrafficService(QObject *parent = 0);
};

#endif // RVITRAFFICSERVICE_H
