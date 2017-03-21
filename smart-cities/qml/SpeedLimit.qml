import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: speedArea

    property bool speedAlertIsDisplayed: false
    property string speedLimit: "30"

    Rectangle {
        id: speedBorder

        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: colors.primaryBlue
        radius: 20

        border.width: 10
        border.color: colors.secondaryBlue
        visible: false
    }

    DropShadow {
        anchors.fill: speedBorder
        horizontalOffset: 0
        verticalOffset: 0
        radius: 8.0
        samples: 17
        color: colors.darkGray
        source: speedBorder
    }

    Rectangle {
        id: speedColorAlert

        width: parent.width - 10
        height: parent.height - 10
        anchors.centerIn: parent
        color: colors.primaryRed
        radius: 20

        visible: speedAlertIsDisplayed
    }

    Rectangle {
        id: speedAlertContrastTopLeftCorner

        width: parent.width * .05
        height: parent.height * .04

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 15

        anchors.top: parent.top
        anchors.topMargin: parent.height * .06
        anchors.left: parent.left
        anchors.leftMargin: parent.width * .06
    }

    Rectangle {
        id: speedAlertContrastTopLeftHorizontal

        width: parent.width * .375
        height: parent.height * .04

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 0

        anchors.verticalCenter: speedAlertContrastTopLeftCorner.verticalCenter
        anchors.left: speedAlertContrastTopLeftCorner.horizontalCenter
    }

    Rectangle {
        id: speedAlertContrastTopLeftVertical

        width: parent.width * .05
        height: parent.height * .4

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 0

        anchors.horizontalCenter: speedAlertContrastTopLeftCorner.horizontalCenter
        anchors.top: speedAlertContrastTopLeftCorner.verticalCenter
    }

    Rectangle {
        id: speedAlertContrastTopRightCorner

        width: parent.width * .05
        height: parent.height * .04

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 15

        anchors.top: parent.top
        anchors.topMargin: parent.height * .06
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .06
    }

    Rectangle {
        id: speedAlertContrastTopRightHorizontal

        width: parent.width * .375
        height: parent.height * .04

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 0

        anchors.verticalCenter: speedAlertContrastTopRightCorner.verticalCenter
        anchors.right: speedAlertContrastTopRightCorner.horizontalCenter
    }

    Rectangle {
        id: speedAlertContrastTopRightVertical

        width: parent.width * .05
        height: parent.height * .4

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 0

        anchors.horizontalCenter: speedAlertContrastTopRightCorner.horizontalCenter
        anchors.top: speedAlertContrastTopRightCorner.verticalCenter
    }

    Rectangle {
        id: speedAlertContrastBottomLeftCorner

        width: parent.width * .05
        height: parent.height * .04

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 15

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .06
        anchors.left: parent.left
        anchors.leftMargin: parent.width * .06
    }

    Rectangle {
        id: speedAlertContrastBottomLeftHorizontal

        width: parent.width * .375
        height: parent.height * .04

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 0

        anchors.verticalCenter: speedAlertContrastBottomLeftCorner.verticalCenter
        anchors.left: speedAlertContrastBottomLeftCorner.horizontalCenter
    }

    Rectangle {
        id: speedAlertContrastBottomLeftVertical

        width: parent.width * .05
        height: parent.height * .4

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 0

        anchors.horizontalCenter: speedAlertContrastBottomLeftCorner.horizontalCenter
        anchors.bottom: speedAlertContrastBottomLeftCorner.verticalCenter
    }

    Rectangle {
        id: speedAlertContrastBottomRightCorner

        width: parent.width * .05
        height: parent.height * .04

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 15

        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * .06
        anchors.right: parent.right
        anchors.rightMargin: parent.width * .06
    }

    Rectangle {
        id: speedAlertContrastBottomRightHorizontal

        width: parent.width * .375
        height: parent.height * .04

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 0

        anchors.verticalCenter: speedAlertContrastBottomRightCorner.verticalCenter
        anchors.right: speedAlertContrastBottomRightCorner.horizontalCenter
    }

    Rectangle {
        id: speedAlertContrastBottomRightVertical

        width: parent.width * .05
        height: parent.height * .4

        color: speedAlertIsDisplayed ? colors.alertTint : colors.secondaryTint

        z: 1
        radius: 0

        anchors.horizontalCenter: speedAlertContrastBottomRightCorner.horizontalCenter
        anchors.bottom: speedAlertContrastBottomRightCorner.verticalCenter
    }

    Rectangle {
        id: speedLimitSign
        width: (parent.width - 10) * .7
        height: (parent.height - 10) * .7
        anchors.centerIn: parent
        color: colors.whitish
        radius: 10

        border.width: 5
        border.color: "black"

        Text {
            id: title
            width: parent.width
            height: parent.height * .5
            anchors.top: parent.top
            anchors.topMargin: parent.height * .0125
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            lineHeight: .75
            font.family: "Helvetica"
            font.pixelSize: parent.height * .2
            font.weight: Font.DemiBold
            wrapMode: Text.WordWrap
            color: "black"
            text: "SPEED LIMIT"
        }


        Text {
            id: speed
            width: parent.width
            height: parent.height * .5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * .02
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Helvetica"
            font.pixelSize: parent.height * .6
            font.weight: Font.Bold
            color: "black"
            text: speedLimit
        }
    }

    onSpeedLimitChanged: console.log("Speed limit is now " + speedLimit)
    onSpeedAlertIsDisplayedChanged: console.log("Show the speed alert? " + speedAlertIsDisplayed)
}
