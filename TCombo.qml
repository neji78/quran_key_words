import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
Item {
    id:tcomb_
    property string label:""
    property alias flag: cb.editable
    property var lst:[]
    signal current_index(string data)
    FontLoader{
        id:ft
        source:"qrc:/font/static/NotoKufiArabic-Black.ttf"
    }
    RowLayout{
        anchors.fill:parent
        layoutDirection: Qt.RightToLeft
        Item {
            Layout.fillHeight: parent
            Layout.preferredWidth: parent.width/3
            Text{
                anchors.centerIn: parent
                text:tcomb_.label
                font.family: ft.name
                font.pointSize: 10
                color: "white"
            }
        }
        ComboBox{
            id:cb
            Layout.fillHeight: parent
            Layout.preferredWidth: parent.width/2
            model: tcomb_.lst
            font.family: ft.name
            font.pointSize: 10
            onCurrentTextChanged: tcomb_.current_index(currentText)
        }
    }

}
