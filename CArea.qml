import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id:carea_
    property alias txt_con: txt_c.text
    signal press(string msg)
    width:100
    height: 40
    FontLoader{
        id:ft
        source:"qrc:/font/static/NotoKufiArabic-Black.ttf"
    }

    Text{
        id:txt_c
        anchors.centerIn: parent
        font.family: ft.name
        font.pointSize: 12
        font.bold: true
        color: "white"
    }
    MouseArea{
        anchors.fill:parent
        hoverEnabled: true
        Rectangle {
            id:back_C
            anchors.fill: parent
            border.color: "black"
            color: "white"
            opacity: 0.0
        }
        onEntered: back_C.opacity = 0.3
        onExited: back_C.opacity = 0.0
        onClicked:carea_.press(txt_c.text)
    }
}
