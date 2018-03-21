import QtQuick 2.0

Item {
    id: raiz
    property int w: 10
    property int h: 10
    property alias t: txt.text
    property alias c: txt.color
    property alias b: bg.color
    property bool p: false
    property bool a: false
    property alias o: bg.opacity
    property alias r: rect.radius
    width: w
    height: h
    signal clicking
    signal dobleclicking
    Rectangle{
        id: rect
        width:  raiz.width
        height: width
        anchors.centerIn: raiz
        radius: raiz.h*0.05
        border.width: 1
        border.color: txt.color
        color: 'transparent'
        Rectangle{
            id:bg
            anchors.fill: parent

        }
        ParallelAnimation{
                id: an
                running: false
                NumberAnimation {
                    target: rect
                    property: "width"
                    from: rect.width*0.5
                    to: raiz.width
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
        }        
        MouseArea{
            id:ma
            property bool pre: false
            anchors.fill: parent
            onClicked: {
                ma.pre=false
                an.start()
                clicking()
            }
            onPressed: {ma.pre=true;tp.start()}
            onReleased: {ma.pre=false;tp.stop()}
            Timer{
                id: tp
                running: false
                repeat: false
                interval: 1500
                onTriggered: {
                        raiz.p = !raiz.p
                }
            }

        }

    }
    Text {
        id: txt
        font.pixelSize: parent.height*0.8
        anchors.centerIn: rect
        font.family: "FontAwesome"
    }

}
