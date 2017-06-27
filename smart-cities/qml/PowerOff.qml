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
            implicitWidth: 100
            implicitHeight: 100
            border.width: control.activeFocus ? 2 : 1
            border.color: colors.primaryRed
            color: colors.primaryRed
        }
    }

    Text {
        id: powerOffLabel
        height: 30
        width: 90
        text: "Power Off"
        color: colors.lightGray
        //anchors.bottom: modeIcon.verticalCenter
        //anchors.left: modeIcon.right
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
