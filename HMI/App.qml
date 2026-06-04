import QtQuick
import QtQuick.Controls
import "../Conponents"


Item {

    width: 1414
    height: 856
    x: 108
    y: 0

    // 背景
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "qrc:/Images/Home/background.png"
        fillMode: Image.Stretch
        //horizontalAlignment: Image.AlignHCenter
        //verticalAlignment: Image.AlignVCenter
    }

    // 淡入动画效果
    PropertyAnimation {
        id: fadeInAnimation
        target: parent
        properties: "opacity"
        duration: 500
        from: 0
        to: 1
        easing.type: Easing.OutQuad
    }

    Component.onCompleted: fadeInAnimation.start()


    // 空调风量
    ACFan {
        id: acFan
        width: 723
        height: 71
        x: 323+108
        y: 617
    }

    // 空调控制栏
    ACBar {
        width: 1305
        height: 123
        anchors.left: parent.left
        anchors.leftMargin: 55
        anchors.top: parent.top
        anchors.topMargin: 707

        onFan: acFan.opened ? acFan.close() : acFan.open()
    }

    Row {
        id: row1
        width: 1281
        height: 141
        anchors.left: parent.left
        anchors.leftMargin: 60
        anchors.top: parent.top
        anchors.topMargin: 128
        spacing: 103

        IconButton {
            id: mimoButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Mimo.png"
            text: qsTr("Mimo")
            fontPixelSize: 22
            onClicked: {
                console.log("mimoButton Clicked")
            }
        }

        IconButton {
            id: messengerButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Messenger.png"
            text: qsTr("Messenger")
            fontPixelSize: 22
        }

        IconButton {
            id: duolinguoButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Duolinguo.png"
            text: qsTr("Duolinguo")
            fontPixelSize: 22
        }

        IconButton {
            id: caltulatorButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Caltulator.png"
            text: qsTr("Caltulator")
            fontPixelSize: 22
        }

        IconButton {
            id: spotifyButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Spotify.png"
            text: qsTr("Spotify")
            fontPixelSize: 22
        }

        IconButton {
            id: swiftButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Swift.png"
            text: qsTr("Swift")
            fontPixelSize: 22
        }

        IconButton {
            id: notabilityButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Notability.png"
            text: qsTr("Notability")
            fontPixelSize: 22
        }
    }

    Row {
        id: row2
        width: 1281
        height: 141
        anchors.left: parent.left
        anchors.leftMargin: 60
        anchors.top: parent.top
        anchors.topMargin: 311
        spacing: 103

        IconButton {
            id: mapsButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Maps.png"
            text: qsTr("Maps")
            fontPixelSize: 22
        }

        IconButton {
            id: picstartButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Picstart.png"
            text: qsTr("Picstart")
            fontPixelSize: 22
        }

        IconButton {
            id: dayOneButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/DayOne.png"
            text: qsTr("DayOne")
            fontPixelSize: 22
        }

        IconButton {
            id: podcastButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Podcast.png"
            text: qsTr("Podcast")
            fontPixelSize: 22
        }

        IconButton {
            id: vectornatorButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Vectornator.png"
            text: qsTr("Vectornator")
            fontPixelSize: 22
        }

        IconButton {
            id: musicButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Music.png"
            text: qsTr("Music")
            fontPixelSize: 22
        }

        IconButton {
            id: sparkButton
            width: 94
            height: sourceHeight + spacing + textHeight
            sourceWidth: width
            sourceHeight: 94
            textWidth: width
            textHeight: 31
            spacing: 16
            source: "qrc:/Images/App/Spark.png"
            text: qsTr("Spark")
            fontPixelSize: 22
        }
    }

}
