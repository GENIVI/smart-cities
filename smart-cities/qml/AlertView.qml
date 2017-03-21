import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: alertView

    property string alertName: "Caution"
    property url sourceIcon: "qrc:/assets/alert_ped.png"
    property string alertText: "Pedestrian Area"

    Rectangle {
        id: alertBanner
        width: parent.width
        height: parent.height * .6
        anchors.centerIn: parent
        opacity: 1.0
        color: colors.bgNeutral
    }

    Text {
        id: alertHeader
        width: alertBanner.width
        height: alertBanner.height * .5
        anchors.top: alertBanner.top
        anchors.topMargin: alertBanner.height * 0.05
        anchors.left: alertBanner.left
        anchors.leftMargin: alertBanner.width * 0.15
        horizontalAlignment: Text.AlignJustify
        verticalAlignment: Text.AlignVCenter
        font.family: "Helvetica Neue LT Pro"
        font.pixelSize: alertBanner.height * .45
        minimumPointSize: 48
        font.bold: true
        color: colors.primaryOrange
        text: alertName
    }

    Text {
        id: alertExplanation
        width: alertBanner.width
        height: alertBanner.height * .4
        anchors.top: alertHeader.bottom
        anchors.left: alertBanner.left
        anchors.leftMargin: alertBanner.width * 0.15
        horizontalAlignment: Text.AlignJustify
        verticalAlignment: Text.AlignVCenter
        font.family: "Helvetica Neue LT Pro"
        font.pixelSize: alertBanner.height * .3
        minimumPointSize: 36
        font.bold: true
        color: colors.secondaryTextColor
        text: alertText
    }

   Image {
        id: alertImage
        source: sourceIcon
        width: parent.height
        height: parent.height
        anchors.horizontalCenter: alertBanner.left
        anchors.verticalCenter: alertBanner.verticalCenter
        visible: false
    }

   DropShadow {
       anchors.fill: alertImage
       horizontalOffset: 3
       verticalOffset: 3
       radius: 8.0
       samples: 17
       color: colors.darkGray
       source: alertImage
   }
}
