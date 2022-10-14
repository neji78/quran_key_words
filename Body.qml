import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

Item {
    id:body_
    property var context: ""
    property alias word: wtxt.text
    property alias mean: mean_.text
    property alias key: boldb.flag
    property alias flag: mean_.readOnly
    signal save(string word1,string mean1,bool key1)
    onKeyChanged:{
        //save state
        body_.save(word,mean,key)
        body_.save_(body_.word)
    }
    function save_(word){
        for(var i =0 ; i < body_.context.length;i++){
            if(body_.context[i].word_ === word){
                body_.context[i].mean_ = body_.mean
                body_.context[i].key_ = body_.key
                break
            }
        }
    }

    onContextChanged: {
        if(body_.context[0]){
            body_.word = body_.context[0].word_
            body_.mean = body_.context[0].mean_
            body_.key = body_.context[0].key_
        }else{
            body_.word ="وجود ندارد"
            body_.mean = "-"
            body_.key = false
        }
    }
    FontLoader{
        id:ft
        source:"qrc:/font/static/NotoKufiArabic-Black.ttf"
    }
    ColumnLayout{
        anchors.fill:parent
        //context
        Item{
            Layout.fillWidth: parent
            Layout.preferredHeight: parent.height/3
            GridView{
                id:gview_
                anchors.fill:parent
                layoutDirection:Qt.RightToLeft

                model:body_.context
                delegate:CArea{
                    txt_con:body_.context[index].word_
                    onPress: {
                        body_.save(body_.word,body_.mean,body_.key)
                        body_.save_(body_.word)
                        body_.word = msg
                        body_.mean = body_.context[index].mean_
                        body_.key = body_.context[index].key_
                    }
                }
                cellWidth: 110
                cellHeight: 50
            }
        }
        //word
        Item{
            Layout.fillWidth: parent
            Layout.preferredHeight: parent.height/3
            Rectangle{
                width:parent.width
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                color:"white"
            }

            Text{
                id:wtxt
                anchors.centerIn: parent
                font.family: ft.name
                font.pointSize: 20
                font.bold: true
                color:"black"
            }
            BoldButton{
                id:boldb
                anchors.left:wtxt.right
                anchors.leftMargin: 200
                width: 50
                height: 50
                anchors.verticalCenter: wtxt.verticalCenter
                name:"کلیدی"
                imgURL:"qrc:/src/star.svg"
                color_: "yellow"
            }
        }
        //maen
        Item{
            Layout.fillWidth: parent
            Layout.preferredHeight: parent.height/3
            Rectangle{
                width:parent.width
                height: 50
                anchors.verticalCenter: parent.verticalCenter
                color:"white"
            }
            TextField{
                id:mean_
                anchors.centerIn: parent
                font.pointSize: 12
                readOnly: true
                color: "black"
            }

        }
    }

}
