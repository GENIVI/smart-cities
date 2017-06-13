import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: disclaimer
    width: parent.width
    height: parent.height
    anchors.centerIn: parent

    color: colors.primaryBlue

    MouseArea {
        anchors.fill: parent
        onClicked: featureAreaInterface.showDisclaimer = false
    }

    Text {
        id: safetyTitle
        anchors.right: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * .15
        font.family: "Helvetica Neue LT Pro"
        font.bold: true
        font.pointSize: 28
        color: colors.lightGray
        text: "Safety "
    }
    Text {
        id: safetyDisclaimer
        anchors.left: parent.horizontalCenter
        anchors.top: safetyTitle.top
        font.family: "Helvetica Neue LT Pro"
        font.pointSize: 28
        color: colors.lightGray
        text: "Disclaimer"
    }

    Text {
        id: safetyExplanation
        anchors.top: safetyTitle.bottom
        anchors.topMargin: parent.height * .1
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * .75
        horizontalAlignment: Text.AlignHCenter
        font.family: "Helvetica Neue LT Pro"
        font.pointSize: 20
        wrapMode: Text.WordWrap
        color: colors.lightGray
        text: "Distractions may cause accidents. Never touch this unit while driving. Obey traffic regulations.\n \nCertain features of this unit may use your location.\n \nTouch the screen to continue."
    }
}
