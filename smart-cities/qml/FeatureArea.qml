import QtQuick 2.0
import QtQml 2.2

Item {
    id: featureAreaInterface

    property bool showTrafficAlert: false
    property bool showSpeedAlert: false
    property alias alertName: alert.alertName
    property alias alertText: alert.alertText
    property alias speedLimit: speedDisplay.speedLimit

    /* Application drawing space */
    Item {
        id: surfaceArea
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        Rectangle {
            id: background
            width: parent.width
            height: parent.height
            anchors.centerIn: parent

            color: colors.primaryBlue
        }

        Rectangle {
            id: stripe
            width: parent.width
            height: parent.height * .2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: surfaceArea.bottom
            anchors.bottomMargin: parent.height * .2
            color: colors.secondaryBlue
        }

        RviNotificationLayer {
            id: rviNotifications

            Timer {
                id: timeout
                interval: 4000; running: false; repeat: false; // one-shot timer for 4000ms / 4s
                onTriggered: featureAreaInterface.showTrafficAlert = false
            }

            onTrafficEvent:  {
                featureAreaInterface.alertName = eventTitle
                featureAreaInterface.alertText = eventExplanation
                featureAreaInterface.showTrafficAlert = true
                timeout.start()
                console.log("Service invoked!" + eventId + eventTitle + eventExplanation)
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
        }

        SpeedLimit {
            id: speedDisplay
            width: parent.width * .25
            height: parent.height * .5

            anchors.bottom: surfaceArea.bottom
            anchors.bottomMargin: parent.height * .05
            anchors.horizontalCenter: parent.horizontalCenter

            speedAlertIsDisplayed: showSpeedAlert
        }
    }

    onShowTrafficAlertChanged: console.log("Time to show the traffic alert? " + showTrafficAlert)
}

