import QtQuick 2.0

Item {
    id:nbutt
    property string imgURL: ""
    property string name: ""
    signal press
    Image {
        id: img_back
        anchors.fill:parent
        source: imgURL
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
        text:nbutt.name
        font.pointSize: 12
        visible: false
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        Rectangle {
            id:back
            anchors.fill: parent
            border.color: "black"
            color: "white"
            opacity: 0.2
        }
        onEntered: {
            back.opacity = 0.5
            backh.opacity = 0.5
            htxt.visible = true
        }
        onExited: {
            back.opacity = 0.2
            backh.opacity = 0
            htxt.visible = false
        }
        onClicked: {
            back.opacity = 0.2
            back.opacity = 0.5
            nbutt.press()
        }
    }

}
