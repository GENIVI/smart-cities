#include "rvialertservice.h"


RviAlertService::RviAlertService(QObject *parent) :
    QGenericPlugin(parent)
{
}

#if QT_VERSION < 0x050000
Q_EXPORT_PLUGIN2(rvialertservice, RviAlertService)
#endif // QT_VERSION < 0x050000
