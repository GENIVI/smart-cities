#ifndef TRAFFICALERTMODEL_H
#define TRAFFICALERTMODEL_H

/** This would be the model for a model-view implementation of the alert events */

//class TrafficEvent;

//class TrafficAlertModel : public QAbstractListModel
//{
//    Q_OBJECT

//public:
//    enum TrafficRoles {
//        EventRole = Qt::UserRole + 1,
//        IdRole,
//        TitleRole,
//        ExplanationRole//,
////        IconRole
//    };

//    explicit TrafficAlertModel(QObject *parent = 0);

//    void addEvent(const TrafficEvent &event);

//    // Header:
//    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

//    // Basic functionality:
//    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

//    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

//protected:
//    QHash<int, QByteArray> roleNames() const;

//private:
//    QList<TrafficEvent> m_events;
//};

#endif // TRAFFICALERTMODEL_H
