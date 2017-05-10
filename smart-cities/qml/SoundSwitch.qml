import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    property bool soundIsOn: false
    onClicked:
        soundIsOn = !soundIsOn
    style: ButtonStyle {
        background: Image {
            id: soundIcon
            source: soundIsOn ? "qrc:/assets/sound_on.png" : "qrc:/assets/sound_off.png"
        }
    }
}
