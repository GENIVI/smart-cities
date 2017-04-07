#include "trafficalertmodel.h"

/** This would be the model for a model-view implementation of the alert events */

//#include "trafficevent.h"

//TrafficAlertModel::TrafficAlertModel(QObject *parent)
//    : QAbstractListModel(parent)
//{ // FIXME: retrieve from persistent storage
//}

//void TrafficAlertModel::addEvent(const TrafficEvent &event)
//{
//    beginInsertRows(QModelIndex(), rowCount(), rowCount());
//    m_events << event;
//    endInsertRows();
//    // FIXME: Update persistent settings
//}

//QVariant TrafficAlertModel::headerData(int section, Qt::Orientation orientation, int role) const
//{
//    // FIXME: Implement me!
//    // Optional - not really sure what header data is for?
//}

//int TrafficAlertModel::rowCount(const QModelIndex &parent) const
//{
//    // For list models only the root node (an invalid parent) should return the list's size. For all
//    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
//    if (parent.isValid())
//        return 0;

//    return m_events.count();
//}

//QVariant TrafficAlertModel::data(const QModelIndex &index, int role) const
//{
//    if (!index.isValid())
//        return QVariant();

//    const TrafficEvent &event = m_events[index.row()];
//    if (role == EventRole)
//        return event;
//    if (role == IdRole)
//        return event.eventId();
//    if (role == TitleRole)
//        return event.eventTitle();
//    if (role == ExplanationRole)
//        return event.eventExplanation();
//    if (role == IconRole)
//        return event.eventIcon();

//    return QVariant();
//}

//QHash<int, QByteArray> TrafficAlertModel::roleNames() const {
//    QHash<int, QByteArray> roles;
//    roles[EventRole] = "event";
//    roles[IdRole] = "eventId";
//    roles[TitleRole] = "eventTitle";
//    roles[ExplanationRole] = "eventExplanation";
//    roles[IconRole] = "eventIcon";
//    return roles;
//}
