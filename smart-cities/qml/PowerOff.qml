//import QtQuick 2.0
//
//Item {
//
//}

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import com.genivi.v2x 1.0

Button {
    property int defaultPowerOffTime: 2000

    signal notifyPowerOff
    //signal requestPowerOff(var time_ms)


    style: ButtonStyle {
        background: Rectangle {
            radius: 50
            anchors.fill: parent
            border.width: control.activeFocus ? 2 : 6
            border.color: control.activeFocus ? colors.lightGray : "#f00"
            gradient: Gradient {
                GradientStop { position: 0 ; color: control.pressed ? "#c00" : colors.lightGray }
                GradientStop { position: 1 ; color: control.pressed ? "#c00" : colors.lightGray }
            }
        }
        label: Text {
            id: powerOffLabel
            anchors.centerIn: parent
            font.family: "Helvetica Neue LT Pro"
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            text: "Power\nOff"
            color: colors.darkGray
        }
    }


    V2xControl {
        id: control
    }
        // onClicked: //v2x powerOff command
    onClicked: {
        console.log("CLICKED PowerOff")
        control.requestPowerOff(1000)
    }
    onNotifyPowerOff: console.log("QML got NOTIFY POWER OFF SIGNAL")
}
