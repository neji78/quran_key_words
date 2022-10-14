import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id:footer_
    signal edit
    signal delete_
    signal done
    Item{
        width:200
        height:parent.height
        anchors.horizontalCenter: parent.horizontalCenter
    RowLayout{
        anchors.fill:parent
        spacing: 5
        NButton{
            Layout.fillHeight: parent
            Layout.preferredWidth: 50
            Layout.alignment: Qt.AlignCenter
            imgURL:"qrc:/src/done.svg"
            onPress: footer_.done()
            name: "تایید"

        }
        NButton{
            Layout.fillHeight: parent
            Layout.preferredWidth: 50
            Layout.alignment: Qt.AlignCenter
            imgURL:"qrc:/src/delete.svg"
            onPress:footer_.delete_()
            name: "حذف"
        }
        NButton{
            Layout.fillHeight: parent
            Layout.preferredWidth: 50
            Layout.alignment: Qt.AlignCenter
            imgURL:"qrc:/src/edit.svg"
            onPress:footer_.edit()
            name: "ویرایش"
        }
    }
    }

}
