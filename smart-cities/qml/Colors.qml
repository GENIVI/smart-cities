import QtQuick 2.0

QtObject {
    property bool isNightMode

    property color primaryBlue: !isNightMode ? "#00627f" : "#00323d"
    property color secondaryBlue: "#1e9eb3"
    property color lightGray: "#cac8c8"
    property color darkGray: "#555759"
    property color primaryOrange: "#d87900"
    property color primaryBrown: "#873a1f"
    property color primaryGold: "#c9920e"
    property color primaryRed: "#c80014"

    property color bgNeutral: !isNightMode ? "white" : "#102528"
    property color secondaryTextColor: !isNightMode ? secondaryBlue : "#cccccc"
    property color whitish: !isNightMode ? "white" : "#cccccc"
    property color secondaryTint: "#187e8f"
    property color alertTint: "#e999a1"
}
