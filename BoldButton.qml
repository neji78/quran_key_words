import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id:boldbutt
    property alias imgURL: img_back.source
    property alias name: htxt.text
    property alias color_: laycolor.color
    property alias flag: laycolor.visible
    signal press
    Image {
        id: img_back
        anchors.fill:parent
    }
    ColorOverlay {
        id:laycolor
        anchors.fill: img_back
        source: img_back
        visible: false
    }
    Text{
        id:htxt
        anchors.bottom:parent.top
        anchors.left: parent.left
        Rectangle {
            id:backh
            anchors.fill: parent
            border.color: "white"
            color: "yellow"
            opacity: 0
        }
        font.pointSize: 12
        visible: false
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            backh.opacity = 0.2
            htxt.visible = true
        }
        onExited: {
            backh.opacity = 0
            htxt.visible = false
        }
        onClicked: {
            laycolor.visible = !(laycolor.visible)
        }
    }
}
