/*
Jaunary 2018
This file is created by nextsigner
This code is used for the unik qml engine system too created by nextsigner.
Please read the Readme.md from https://github.com/nextsigner/rickypapi.git
Contact
    email: nextsigner@gmail.com
    whatsapps: +541138024370
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import Qt.labs.settings 1.0
import QtWebEngine 1.4
ApplicationWindow {
    id:app
    visible: true
    width: 1400
    height: 600
    visibility:"Maximized"
    title: 'Los Ricky Papi de Matias Ponce'
    color: '#333'
    property int fs: app.width*0.02
    property color c1: "#1fbc05"
    property color c2: "#4fec35"
    property color c3: "white"
    property color c4: "black"
    property color c5: "#333333"
    property string tool: ""
    property string urlEditor: 'http://nsdocs.blogspot.com.ar/search?q=qml+unik'
    property var wvResult
    //property string uRSStandBy: 0

    Settings{
        id: appSettings
        category: 'Configuration'
        property string bgColorEditor: 'black'
        property string txtColorEditor: 'white'
        property int pyLineRH1: 0
        property bool logVisible: false
        property string currentFolder
        property string uUrlYT: 'https://www.youtube.com/user/MatiasPonceOk'
        property string uUrlInst: 'https://www.instagram.com/matiasponce_10/'
        property string uUrlTT: 'https://twitter.com/MatiasPonceYT'
        property string uUrlFB: 'https://www.facebook.com/matiasponceoficial'
        property int red: 0
        property string uRS: ''
        property bool uRCRev: false
    }
    FontLoader {name: "FontAwesome";source: "qrc:/fontawesome-webfont.ttf";}
    onClosing: Qt.quit()
    Row{
        anchors.fill: parent
        Rectangle{
            id: xTools
            width: app.width*0.02
            height: app.height
            color: "#fff"
            border.width: 1
            border.color: "black"
            Column{
                id: colTools
                width: parent.width
                spacing:  width*0.5
                anchors.verticalCenter: parent.verticalCenter
                Boton{
                    id: btnYutun
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    c: 'red'
                    t: "\uf167"
                    onClicking: {
                        appSettings.red=0;
                    }
                }
                Boton{
                    id: btnInstagram
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    c: 'blue'
                    t: "\uf16d"
                    onClicking: {
                        appSettings.red=1;
                    }
                }
                Boton{
                    id: btnTwitter
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    c: '#43b7f1'
                    t: "\uf099"
                    onClicking: {
                        appSettings.red=2;
                    }
                }
                Boton{
                    id: btnFacebook
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    c: '#117aca'
                    t: "\uf09a"
                    onClicking: {
                        appSettings.red=3;
                    }
                }
                Item{width: parent.width*0.9;height: width}
                Item{width: parent.width*0.9;height: width}
                Item{width: parent.width*0.9;height: width}

                Boton{
                    id: btnUpdate
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    b: up ? 'red':'#ccc'
                    c: up ? 'white':'#333'
                    t: "\uf021"
                    property bool up: false
                    onClicking: {
                        if(!btnUpdate.up){
                            btnUpdate.enabled=false
                            var fd=unik.getPath(3)+'/unik'
                            var downloaded = unik.downloadGit('https://github.com/nextsigner/rickypapi', fd)
                            btnUpdate.enabled=true;
                            if(downloaded){
                                unik.restartApp()
                            }
                        }else{
                            //appSettings.uRS=app.uRSStandBy
                            unik.restartApp()
                        }
                    }
                }
                Boton{
                    id: btnApagar
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    c: '#444'
                    t: "\uf011"
                    onClicking: {
                        Qt.quit()
                    }
                }

            }
        }

        Rectangle{
            id:container
            width: parent.width
            height: parent.height
            color: '#333'

            WebEngineView{
                id: wvyutun
                width: parent.width-xTools.width
                height: parent.height
                url:appSettings.uUrlYT
                profile: defaultProfile
                focus: true
                visible: appSettings.red===0
                property string linkContextRequested
                property QtObject defaultProfile: WebEngineProfile {
                    storageName: "Default"
                    onDownloadRequested: {
                        download.path=unik.getPath(2)+'/main.qml'
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
                        wvyutun.opacity = 0.0
                    }else{
                        wvyutun.opacity = 1.0
                    }*/
                }
                onContextMenuRequested: function(request) {
                    var lurl = ''+request.linkUrl
                    if(lurl!==''){
                        wvyutun.linkContextRequested = lurl
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
                        wvyutun.previsibility=app.visibility
                        app.visibility = "FullScreen"
                        wvyutun.state = "FullScreen"
                        xTools.width=0
                    }else{
                        app.visibility = wvyutun.previsibility
                        wvyutun.state = ""
                        xTools.width=app.width*0.02
                    }
                    request.accept()
                }
                onUrlChanged: {

                }
                Shortcut {
                    sequence: "Ctrl+Tab"
                    onActivated: {
                        clipboard.setText("     ")
                        wvyutun.focus = true
                        wvyutun.triggerWebAction(WebEngineView.Paste)
                    }
                }
                Shortcut {
                    sequence: "Ctrl+R"
                    onActivated: {

                    }
                }



            }

            WebEngineView{
                id: wvinstagram
                width: parent.width-xTools.width
                height: parent.height
                url:appSettings.uUrlInst
                profile: defaultProfile
                focus: true
                visible: appSettings.red===1
                property string linkContextRequested
                property QtObject defaultProfile: WebEngineProfile {
                    storageName: "Default"
                    onDownloadRequested: {
                        download.path=unik.getPath(2)+'/main.qml'
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
                        wvyutun.opacity = 0.0
                    }else{
                        wvyutun.opacity = 1.0
                    }*/
                }
                onContextMenuRequested: function(request) {
                    var lurl = ''+request.linkUrl
                    if(lurl!==''){
                        wvinstagram.linkContextRequested = lurl
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
                        wvinstagram.previsibility=app.visibility
                        app.visibility = "FullScreen"
                        wvinstagram.state = "FullScreen"
                        xTools.width=0
                    }else{
                        app.visibility = wvinstagram.previsibility
                        wvinstagram.state = ""
                        xTools.width=app.width*0.02
                    }
                    request.accept()
                }
                onUrlChanged: {

                }
                Shortcut {
                    sequence: "Ctrl+Tab"
                    onActivated: {
                        clipboard.setText("     ")
                        wvinstagram.focus = true
                        wvinstagram.triggerWebAction(WebEngineView.Paste)
                    }
                }
                Shortcut {
                    sequence: "Ctrl+R"
                    onActivated: {

                    }
                }



            }

            WebEngineView{
                id: wvtt
                width: parent.width-xTools.width
                height: parent.height
                url:appSettings.uUrlTT
                profile: defaultProfile
                focus: true
                visible: appSettings.red===2
                property string linkContextRequested
                property QtObject defaultProfile: WebEngineProfile {
                    storageName: "Default"
                    onDownloadRequested: {
                        download.path=unik.getPath(2)+'/main.qml'
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
                        wvyutun.opacity = 0.0
                    }else{
                        wvyutun.opacity = 1.0
                    }*/
                }
                onContextMenuRequested: function(request) {
                    var lurl = ''+request.linkUrl
                    if(lurl!==''){
                        wvtt.linkContextRequested = lurl
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
                        wvtt.previsibility=app.visibility
                        app.visibility = "FullScreen"
                        wvtt.state = "FullScreen"
                        xTools.width=0
                    }else{
                        app.visibility = wvtt.previsibility
                        wvtt.state = ""
                        xTools.width=app.width*0.02
                    }
                    request.accept()
                }
                onUrlChanged: {

                }
                Shortcut {
                    sequence: "Ctrl+Tab"
                    onActivated: {
                        clipboard.setText("     ")
                        wvtt.focus = true
                        wvtt.triggerWebAction(WebEngineView.Paste)
                    }
                }
                Shortcut {
                    sequence: "Ctrl+R"
                    onActivated: {

                    }
                }



            }

            WebEngineView{
                id: wvf
                width: parent.width-xTools.width
                height: parent.height
                url:appSettings.uUrlFB
                profile: defaultProfile
                focus: true
                visible: appSettings.red===3
                property string linkContextRequested
                property QtObject defaultProfile: WebEngineProfile {
                    storageName: "Default"
                    onDownloadRequested: {
                        download.path=unik.getPath(2)+'/main.qml'
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
                        wvyutun.opacity = 0.0
                    }else{
                        wvyutun.opacity = 1.0
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
                        wvf.previsibility=app.visibility
                        app.visibility = "FullScreen"
                        wvf.state = "FullScreen"
                        xTools.width=0
                    }else{
                        app.visibility = wvf.previsibility
                        wvf.state = ""
                        xTools.width=app.width*0.02
                    }
                    request.accept()
                }
                onUrlChanged: {

                }
                Shortcut {
                    sequence: "Ctrl+Tab"
                    onActivated: {
                        clipboard.setText("     ")
                        wvf.focus = true
                        wvf.triggerWebAction(WebEngineView.Paste)
                    }
                }
                Shortcut {
                    sequence: "Ctrl+R"
                    onActivated: {

                    }
                }



            }

            Menu {
                id: contextMenu
                onVisibleChanged: {
                    if(!visible){
                        menuLink.visible = false
                        ccs.visible = false
                    }
                }
                MenuItem { id: menuLink; text: "Copiar Url"
                    visible: false
                    enabled: visible
                    height: visible ? undefined : 0
                    onTriggered:{
                        clipboard.setText(wvinstagram.linkContextRequested)
                    }
                }

                MenuItem { text: "Atras"
                    onTriggered:{
                        wvinstagram.goBack()
                    }
                }
                MenuItem { text: "Adelante"
                    onTriggered:{
                        wvinstagram.goForward()
                    }
                }
                MenuItem { text: "Cortar"
                    onTriggered:{
                        wvinstagram.triggerWebAction(WebEngineView.Cut)
                    }
                }
                MenuItem { text: "Copiar"
                    onTriggered:{
                        wvinstagram.triggerWebAction(WebEngineView.Copy)
                        var js='\'\'+window.getSelection()'
                        wvinstagram.runJavaScript(js, function(result) {
                            logView.log(result);
                        });

                        //logView.log(wvyutun.ViewSource.toString())
                    }
                }
                MenuItem {
                    id: menuPegar
                    text: "Pegar"
                    onTriggered:{
                        wvinstagram.triggerWebAction(WebEngineView.Paste)
                    }
                }
                MenuItem {
                    id: menuSalir
                    text: "Apagar"
                    onTriggered:{
                        Qt.quit()
                    }
                }
            }
        }
    }

    Timer{
        id:tu
        running: true
        repeat: true
        interval: 3000
        onTriggered: {
            var d = new Date(Date.now())
            var ur0 = ''+unik.getHttpFile('https://github.com/nextsigner/rickypapi/commits/master?r='+d.getTime())
            var m0=ur0.split("commit-title")
            var m1=(''+m0[1]).split('</p>')
            var m2=(''+m1[0]).split('\">')
            var m3=(''+m2[1]).split('\"')
            var ur = ''+m3[1]            if(appSettings.uRS!==''&&appSettings.uRS!==ur){
                appSettings.uRS = ur
                var fd=unik.getPath(3)+'/unik'
                var downloaded = unik.downloadGit('https://github.com/nextsigner/rickypapi', fd)
                tu.stop()
                if(downloaded){
                    btnUpdate.up=true
                }else{
                    tu.start()
                }
            }else{
                appSettings.uRS=ur
            }
        }
    }
    Component.onCompleted:  {
        unik.debugLog = true
    }
}
