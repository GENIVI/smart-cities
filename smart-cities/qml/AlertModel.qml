import QtQuick 2.0

ListModel {
    ListElement {
        eventId: "1" // Speeding warning, no associated icon/text
    }
    ListElement {
        eventId: "2" // High-risk pedestrian warning area
        eventTitle: "Caution"
        eventExplanation: "High Pedestrian Area"
        eventIcon: !colors.isNightMode ? "qrc:/assets/alert_ped.png" : "qrc:/assets/alert_night_pedestrian.png"
    }
    ListElement {
        eventId: "3" // Bus Stop Warning
        eventTitle: "Caution"
        eventExplanation: "Bus Stop Ahead"
        eventIcon: !colors.isNightMode ? "qrc:/assets/alert_bus.png" : "qrc:/assets/alert_night_bus.png"
    }
    ListElement {
        eventId: "4" // Traffic Jam
        eventTitle: "Traffic Jam"
        eventExplanation: "Major Delay"
        eventIcon: !colors.isNightMode ? "qrc:/assets/alert_traffic.png" : "qrc:/assets/alert_night_traffic.png"
    }
}
