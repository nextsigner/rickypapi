import QtQuick 2.7
import QtQuick.Controls 2.0
import QtWebEngine 1.4

Item {
    id: raiz
    width: parent.width-xTools.width
    height: parent.height
    property int red
    property string url
    visible: appSettings.red===raiz.red;
    onUrlChanged: wv.url=url
    Rectangle{
        id: xTiUrl
        width: raiz.width
        height: app.fs*0.6
        Row{
            anchors.centerIn: parent
            Text {
                id: labelUrl
                text: 'Url: '
                font.pixelSize: app.fs*0.5

            }
            Rectangle{
                width: xTiUrl.width-labelUrl.contentWidth
                height: xTiUrl.height
                border.width: 1
                clip: true
                TextInput{
                    id: tiUrl
                    width: parent.width*0.98
                    height: app.fs*0.5
                    text: wv.url
                    font.pixelSize: app.fs*0.5
                    anchors.centerIn: parent

                    Keys.onReturnPressed: wv.url=tiUrl.text
                }

            }
        }
    }


    WebEngineView{
        id: wv
        width: parent.width
        height: parent.height-xTiUrl.height
        anchors.top: xTiUrl.bottom
        url:raiz.url
        profile: defaultProfile
        focus: true
        visible: appSettings.red===raiz.red
        property string linkContextRequested
        property QtObject defaultProfile: WebEngineProfile {
            storageName: "Default"
            onDownloadRequested: {
                download.path = unik.getPath(3)+'/'+download.FileNoSpace
                console.log()
                //download.path=unik.getPath(2)+'/main.qml'
                download.accept();
            }
            onDownloadFinished: {

            }
        }
        settings.javascriptCanOpenWindows: true
        settings.allowRunningInsecureContent: false
        //settings.hyperlinkAuditingEnabled:  true
        settings.javascriptCanAccessClipboard: true
        settings.localStorageEnabled: true
        settings.javascriptEnabled: true
        onNewViewRequested: {
            request.openIn(wv)
            request.accepted = true;
        }
        onLoadProgressChanged: {
            /*if(loadProgress!==100){
                wv.opacity = 0.0
            }else{
                wv.opacity = 1.0
            }*/
        }
        onContextMenuRequested: function(request) {
            var lurl = ''+request.linkUrl
            if(lurl!==''){
                wvf.linkContextRequested = lurl
                menuLink.visible = true
            }
            request.accepted = true;
            contextMenu.x = request.x;
            contextMenu.y = request.y;
            contextMenu.visible = true
        }
        property int previsibility: 1
        onFullScreenRequested: {
            if(request.toggleOn){
                wv.previsibility=app.visibility
                app.visibility = "FullScreen"
                wv.state = "FullScreen"
                xTools.width=0
            }else{
                app.visibility = wv.previsibility
                wv.state = ""
                xTools.width=app.width*0.02
            }
            request.accept()
        }
        onUrlChanged: {
            raiz.url = url
            tiUrl.text=url
        }
        Shortcut {
            sequence: "Ctrl+Tab"
            onActivated: {
                clipboard.setText("     ")
                wv.focus = true
                wv.triggerWebAction(WebEngineView.Paste)
            }
        }
        Shortcut {
            sequence: "Ctrl+R"
            onActivated: {

            }
        }



    }

    MouseArea{
        id: ma
        width: raiz.width
        height: app.fs*0.25
        hoverEnabled: true
        onEntered: {
            xTiUrl.height=app.fs*0.5
            ma.height=app.fs
        }
        onExited: {
            xTiUrl.height=0;
            ma.height=app.fs*0.5
        }
    }
}
