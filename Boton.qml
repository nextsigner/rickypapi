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
    property alias d: tip.text
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
            hoverEnabled: true
            onEntered:xTip.visible=true
            onExited: xTip.visible=false
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
    Rectangle{
        id:xTip
        width: tip.width+app.fs*0.5
        height: tip.height+app.fs*0.2
        anchors.left: raiz.right
        anchors.leftMargin: app.fs*0.2
        anchors.verticalCenter: raiz.verticalCenter
        visible:false
        border.width: 1
        radius: 6

        Text {
            id: tip
            width: contentWidth
            height: app.fs*0.5
            anchors.centerIn: parent
            text:"..."

        }
    }


}
