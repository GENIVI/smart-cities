#include "rvitrafficservice.h"


RviTrafficService::RviTrafficService(QObject *parent) :
    QTextCodecPlugin(parent)
{
}

#if QT_VERSION < 0x050000
Q_EXPORT_PLUGIN2(rvitrafficservice, RviTrafficService)
#endif // QT_VERSION < 0x050000
