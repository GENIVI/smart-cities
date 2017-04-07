import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: disclaimer
    width: parent.width
    height: parent.height
    anchors.centerIn: parent

    color: colors.primaryBlue

    Text {
        id: safetyTitle
        anchors.right: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * .15
        font.family: "Helvetica Neue LT Pro"
        font.bold: true
        fontSizeMode: Text.FixedSize
        font.pointSize: 48
        color: colors.lightGray
        text: "Safety "
    }
    Text {
        id: safetyDisclaimer
        anchors.left: parent.horizontalCenter
        anchors.top: safetyTitle.top
        font.family: "Helvetica Neue LT Pro"
        fontSizeMode: Text.FixedSize
        font.pointSize: 48
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
        fontSizeMode: Text.FixedSize
        font.pointSize: 36
        wrapMode: Text.WordWrap
        color: colors.lightGray
        text: "Distractions may cause accidents.\nNever enter data while driving and obey traffic regulations.\n \nCertain in vehicle features and services where fitted may use your location."
    }

    Button {
        id: disclaimerButton
        width: safetyTitle.width + safetyDisclaimer.width
        height: parent.height * .1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: safetyExplanation.bottom
        anchors.topMargin: parent.height * .1
        onClicked: featureAreaInterface.showDisclaimer = false
        style: ButtonStyle {
            background: Rectangle {
                anchors.fill: parent
                color: colors.lightGray
            }
            label: Text {
                renderType: Text.NativeRendering
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("Continue")
                anchors.centerIn: parent
                height: parent.height
                width: parent.width
                color: "black"
                font.pointSize: 36
            }
        }
    }
}
