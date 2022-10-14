import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import quran 1.0


Window {
    visible: true
    width: 1024
    height: 620
    title: qsTr("حول بیان النص")
    Image{
        anchors.fill:parent
        source:"qrc:/src/back2.jpg"
    }

    MyQuran{
        id:qr
    }

    ColumnLayout{
        anchors.fill: parent
        CBar{
            id:cbar
            property string ayeh1:""
            Layout.fillWidth: parent
            Layout.preferredHeight: 50
            lst_joze: qr.get_joze()
            onJoze_: {
                qr.update_sooreh(jdata)
                cbar.lst_sooreh = qr.get_sooreh()
            }
            onSooreh_: {
                qr.update_ayeh("'"+sdata+"'")
                cbar.lst_ayehNumber = qr.get_ayehNumbers_()
                ayeh_(lst_ayehNumber[0])
            }
            onAyeh_: {
                cbar.ayeh1 = adata
                qr.update_words(adata)
                var a = qr.get_words()
                body.context = a
            }
        }
        Body{
            id:body
            Layout.fillWidth: parent
            Layout.preferredHeight: parent.height - 200
            onSave: {
                qr.save_words(word1,mean1,key1);
            }
        }
        Footer{
            Layout.fillWidth: parent
            Layout.preferredHeight: 50
            onEdit:{
                body.flag = false
            }
            onDone: {
                body.flag = true
                body.save(body.word,body.mean,body.key)
            }
            onDelete_: {
                body.mean = "-"
                body.key = false
                body.save(body.word,body.mean,body.key)
                body.save_(body.word)
                body.flag = true
            }
        }
    }

}
