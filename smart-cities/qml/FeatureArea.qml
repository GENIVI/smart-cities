import QtQuick 2.0
import QtQml 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id: featureAreaInterface

    property bool showTrafficAlert: false
    property bool showSpeedAlert: false
    property bool showDisclaimer: true
    property string alertTitle
    property string alertExplanation
    property url alertIcon
    property alias speedLimit: speedDisplay.speedLimit
    property alias gpsActive: rviNotifications.gpsActive
    property alias rviConnected: rviNotifications.rviConnected
    property alias rviInitialized: rviNotifications.rviInitialized

    /* Application drawing space */
    Item {
        id: surfaceArea
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        Disclaimer {
            visible: showDisclaimer
        }

        Rectangle {
            id: background
            width: parent.width
            height: parent.height
            anchors.centerIn: parent

            color: colors.primaryBlue
            visible: !showDisclaimer
        }

        SoundSwitch {
            anchors.top: speedDisplay.top
            anchors.left: modeSwitch.left
            visible: !showDisclaimer
        }

        ModeSwitch {
            id: modeSwitch
            anchors.bottom: background.bottom
            anchors.bottomMargin: background.height * .225
            anchors.left: background.left
            anchors.leftMargin: background.width * .1
            color: background.color

            visible: !showDisclaimer
        }

        RviNotificationLayer {
            id: rviNotifications

            Timer {
                id: timeout
                interval: 4000; running: false; repeat: false; // one-shot timer for 4000ms / 4s
                onTriggered: featureAreaInterface.showTrafficAlert = false
            }

            onTrafficEvent:  {
                featureAreaInterface.alertTitle = title
                featureAreaInterface.alertExplanation = explanation
                featureAreaInterface.alertIcon = icon
                featureAreaInterface.showTrafficAlert = title ? true : false
                timeout.start()
                console.log("Service invoked!" + title + explanation)
            }

            onSpeedEvent: {
                console.log("NEW SPEED EVENT: Speed limit = ", speedLimit, " Speeding = ", speeding)
                featureAreaInterface.speedLimit = speedLimit
                featureAreaInterface.showSpeedAlert = speeding
            }
        }

        AlertView {
            id: alert
            width: parent.width * .65
            height: parent.height * .25

            anchors.topMargin: parent.height * .05
            anchors.top: surfaceArea.top
            anchors.horizontalCenter: parent.horizontalCenter

            visible: showTrafficAlert

            alertName: alertTitle
            alertText: alertExplanation
            sourceIcon: alertIcon
        }

        SpeedLimit {
            id: speedDisplay
            width: parent.width * .25
            height: parent.height * .5

            anchors.bottom: surfaceArea.bottom
            anchors.bottomMargin: parent.height * .05
            anchors.horizontalCenter: parent.horizontalCenter

            speedAlertIsDisplayed: showSpeedAlert

            visible: !showDisclaimer
        }
    }

    onShowTrafficAlertChanged: console.log("Time to show the traffic alert? " + showTrafficAlert)
}

