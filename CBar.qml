import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
Item {
    property alias lst_joze: joze.lst
    property alias lst_sooreh: sooreh.lst
    property alias lst_ayehNumber: ayehNumber.lst
    signal joze_(string jdata)
    signal sooreh_(string sdata)
    signal ayeh_(string adata)
    RowLayout{
        anchors.fill:parent
        layoutDirection: Qt.RightToLeft
        TCombo{
            id:joze
            Layout.fillHeight: parent
            Layout.preferredWidth: parent.width/3
            label: "جزء"
            flag:true
            onCurrent_index:joze_(data)
        }
        TCombo{
            id:sooreh
            Layout.fillHeight: parent
            Layout.preferredWidth: parent.width/3
            label: "سوره"
            flag:false
            onCurrent_index: sooreh_(data)
        }
        TCombo{
            id:ayehNumber
            Layout.fillHeight: parent
            Layout.preferredWidth: parent.width/3
            label: "آیه"
            flag:true
            onCurrent_index: ayeh_(data)
        }
    }
}
