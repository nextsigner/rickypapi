/*
Jaunary 2018
This file is created by nextsigner
This code is used for the unik qml engine system too created by nextsigner.
Please read the Readme.md from https://github.com/nextsigner/rickypapi.git
Contact
    email: nextsigner@gmail.com
    whatsapps: +54 11 3802 4370
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
    title: 'RickyPapi Navergador Web'
    color: '#333'
    property int fs: app.width*0.02
    property color c1: "#1fbc05"
    property color c2: "#4fec35"
    property color c3: "white"
    property color c4: "black"
    property color c5: "#333333"
    property string tool: ""
    property string urlYT: 'https://www.youtube.com/user/MatiasPonceOk'
    property string urlInst: 'https://www.instagram.com/matiasponce_10/'
    property string urlTT: 'https://twitter.com/MatiasPonceYT'
    property string urlFB: 'https://www.facebook.com/matiasponceoficial'

    property string colorBarra:'white'


    Settings{
        id: appSettings
        category: 'conf-rickypapi'
        property string bgColorEditor: 'black'
        property string txtColorEditor: 'white'
        property int pyLineRH1: 0
        property bool dlvVisible: false
        property string currentFolder
        property string uUrlYT: app.urlYT
        property string uUrlInst: app.urlInst
        property string uUrlTT: app.urlTT
        property string uUrlFB: app.urlFB
        property int red: 0
        property string uRS: ''
        property bool uRCRev: false
    }
    FontLoader {name: "FontAwesome";source: "qrc:/fontawesome-webfont.ttf";}
    Row{
        anchors.fill: parent
        Rectangle{
            id: xTools
            width: app.width*0.02
            height: app.height
            color: "#fff"
            z:container.z+99999
            Rectangle{
                width: 1
                height: parent.height
                color: "black"
                anchors.right: parent.right
            }
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
                    t: modwvyutun.url.indexOf(app.urlYT)===0?"\uf167":"\uf0ac"
                    d: 'El Canal de Yutun de Matias Ponce Pene de Once'

                    a: appSettings.red===0
                    c: a?'white':'red'
                    b: a?'red':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.red=0;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlYT = app.urlYT
                            modwvyutun.url=appSettings.uUrlYT
                            appSettings.red=0;
                            console.log('--->>>>>'+appSettings.uUrlYT)
                        }
                    }
                }
                Boton{
                    id: btnInstagram
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w

                    t: modwvig.url.indexOf(app.urlInst)===0?"\uf16d":"\uf0ac"
                    d: 'Instagram del Especialista en Misiones Secretas'

                    a: appSettings.red===1
                    c: a?'white':'blue'
                    b: a?'blue':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.red=1;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlInst = app.urlInst
                            modwvig.url=appSettings.uUrlInst
                            appSettings.red=1;
                        }
                    }
                }
                Boton{
                    id: btnTwitter
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    t: modwvtt.url.indexOf(app.urlTT)===0?"\uf099":"\uf0ac"
                    d: 'Twitter del Principal Acusado por el robo del Unicornio'

                    a: appSettings.red===2
                    c: a?'white':'#43b7f1'
                    b: a?'#43b7f1':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.red=2;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlTT = app.urlTT
                            modwvtt.url=appSettings.uUrlTT
                            appSettings.red=2;
                        }
                    }
                }
                Boton{
                    id: btnFacebook
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    t: modwvfb.url.indexOf(app.urlFB)===0?"\uf09a":"\uf0ac"
                    d: 'Facebook Oficial del que no se da cuenta que El Debon le come la novia'

                    a: appSettings.red===3
                    c: a?'white':'#117aca'
                    b: a?'#117aca':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.red=3;
                    }
                    onPChanged: {
                        if(p){
                            appSettings.uUrlFB = app.urlFB
                            modwvfb.url=appSettings.uUrlFB
                            appSettings.red=3;
                        }
                    }
                }
                Item{width: parent.width*0.9;height: width}
                Item{width: parent.width*0.9;height: width}


                Boton{
                    id: btnDLV
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    t: "\uf019"
                    d: 'Ver Descargas'

                    a: appSettings.dlvVisible
                    c: a?'white':'green'
                    b: a?'green':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        appSettings.dlvVisible = !appSettings.dlvVisible
                    }
                }

                Boton{
                    id: btnInfo
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    t: modwvtt.url.indexOf("https://twitter.com/hashtag/RickyPapiNavegadorWeb?src=hash")===0?"\uf086":"\uf0ac"
                    d: 'Leer todas las pelotudeces que dicen de este #RickyPapiNavegadorWeb'

                    a: appSettings.red===4
                    c: a?'white':'green'
                    b: a?'green':'white'
                    o: !a?0.0:1.0
                    r:app.fs*0.2

                    onClicking: {
                        modwvinfo.url = "https://twitter.com/hashtag/RickyPapiNavegadorWeb?src=hash"
                        appSettings.red=4;
                    }
                }
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
                    d: 'Actualizar este NaVergador'
                    o:1.0
                    r:app.fs*0.2
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
                    id: btnAUT
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    h: w
                    t: "\uf011"
                    d: 'Más aplicaciones Unik'
                    c: '#333'
                    b: '#fff'
                    o: 1.0
                    r:app.fs*0.2
                    onClicking:{
                        var c=''+appsDir+'/temp_config.json'
                        var d='{"mode":"-gir", "arg1":"https://github.com/nextsigner/unik-tools.git"}'
                        unik.setFile(c,d)
                        unik.restartApp()
                    }
                }
                Boton{
                    id: btnApagar
                    w:parent.width*0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: enabled ?1.0:0.5
                    h: w
                    t: "\uf011"
                    d: 'Apagar la Chota'

                    c: '#333'
                    b: '#fff'
                    o: 1.0
                    r:app.fs*0.2

                    onClicking:app.close()
                    onPChanged:{
                        if(p){
                            Qt.quit()
                        }
                    }

                }

            }
        }

        Rectangle{
            id:container
            width: parent.width
            height: parent.height
            color: '#333'

            ModWebView{id:modwvyutun;red:0;url:appSettings.uUrlYT;}
            ModWebView{id:modwvig;red:1;url:appSettings.uUrlInst;}
            ModWebView{id:modwvtt;red:2;url:appSettings.uUrlTT;}
            ModWebView{id:modwvfb;red:3;url:appSettings.uUrlFB;}
            ModWebView{id:modwvinfo;red:4;url:"https://twitter.com/hashtag/RickyPapiNavegadorWeb?src=hash";}
            LineResizeH{
                id:lineRH;
                y:visible?appSettings.pyLineRH1: parent.height;
                onLineReleased: appSettings.pyLineRH1 = y;
                visible: appSettings.dlvVisible;
                onYChanged: {
                    if(y<container.height/3){
                        y=container.height/3+2
                    }
                }
                Component.onCompleted: {
                    if(lineRH.y<container.height/3){
                        lineRH.y=container.height/3+2
                    }
                }
            }
            ModDLV{
                id: modDlv
                width: parent.width
                anchors.top: lineRH.bottom;
                anchors.bottom: parent.bottom;
                visible: appSettings.dlvVisible;
            }
        }
    }


    Timer{
        id:tu
        running: true
        repeat: false
        interval: 1000*5
        property int v: 0
        onTriggered: {
            tu.v++
            var d = new Date(Date.now())
            unik.setDebugLog(false)
            var ur0 = ''+unik.getHttpFile('https://github.com/nextsigner/rickypapi/commits/master?r='+d.getTime())
            var m0=ur0.split("commit-title")
            var m1=(''+m0[1]).split('</p>')
            var m2=(''+m1[0]).split('\">')
            var m3=(''+m2[2]).split('<')
            var ur = ''+m3[0]
            if(appSettings.uRS===''){
                appSettings.uRS=ur
            }
            //unik.log("Update key control nª"+tu.v+": "+ur+" urs: "+appSettings.uRS)
            if(appSettings.uRS!==ur){
                unik.setDebugLog(true)
                unik.log("Updating unik-tools")
                appSettings.uRS = ur
                var fd=appsDir
                var downloaded = unik.downloadGit('https://github.com/nextsigner/rickypapi', fd)
                appSettings.uRS=''
                tu.stop()
                if(downloaded){
                    btnUpdate.up=true
                }else{
                    tu.start()
                }
            }
            unik.setDebugLog(true)
            tu.interval=1000*60*5
            tu.repeat=true
            tu.start()
        }
    }
    function onDLR(download) {
        appSettings.dlvVisible=true
        modDlv.append(download);
        download.accept();
    }

    Component.onCompleted:  {
        unik.debugLog = true
    }
}
