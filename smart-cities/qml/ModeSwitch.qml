import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {

    property string switchText: "Off"
    property int offset: 0

    Image {
        id: modeIcon
        source: "qrc:/assets/night_mode_moon.png"
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Text {
        id: modeLabel
        height: 30
        width: 90
        text: "Night mode"
        color: colors.lightGray
        anchors.bottom: modeIcon.verticalCenter
        anchors.left: modeIcon.right
    }

    Switch {
        anchors.top: modeIcon.verticalCenter
        anchors.left: modeIcon.right
        checked: false

        style: SwitchStyle {
            groove: Rectangle {
                implicitWidth: 90
                implicitHeight: 30
                radius: 10
                color: colors.darkGray
                Text {
                    text: switchText
                    anchors.left: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: offset
                    color: colors.lightGray
                }
            }

            handle: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                radius: 20
                color: colors.lightGray
            }
        }

        onCheckedChanged: {
            checked ? switchText = "On" : switchText = "Off"
            checked ? offset = -25 : offset = 0
            colors.isNightMode = checked
        }
    }
}
