import QtQuick
import QtQuick.Controls
import "../Conponents"


Item {

    width: 1414
    height: 856
    x: 108
    y: 0

    property int leftPercentX: 0
    property int leftPercentY: 100
    property int xStepSize: leftRect.width / 100
    property int yStepSize: leftRect.height / 100
    property var colorArray: ["#5055AAFF", "#5077BBF8", "#5088BBF0",
                                  "#5099CCEE", "#5099DDEE", "#50AAEEEE",
                                  "#50BBEEEE", "#50CCDDEE", "#50DDDDFF",
                                  "#50EEEEFF", "#50FFFFFF", "#50FFEEEE",
                                  "#50FFDDDD", "#50FFCCCC", "#50EEBBBB",
                                  "#50EEAAAA", "#50EE9999"]

    // 背景
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: "qrc:/Images/Home/background.png"
        fillMode: Image.Stretch


        //内饰
        Image{
            id:innerImage
            width: 1414
            height: 707
            x:0
            y:0
            source: "qrc:/Images/AC/inner.png"
            fillMode: Image.PreserveAspectFit

            //垂直遮罩
            Image {
                id: maskVImage
                anchors.fill: parent
                source: "qrc:/Images/AC/mask_v.png"
                fillMode: Image.PreserveAspectFit
            }

            //水平遮罩
            Image {
                id: maskHImage
                anchors.fill: parent
                source: "qrc:/Images/AC/mask_h.png"
                fillMode: Image.PreserveAspectFit
            }
        }

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



    //状态栏
    StatusBar {
        id: statusBar
        width: parent.width
        height: 46
        anchors.left: parent.left
        anchors.top: parent.top

        positionStatus: ui.controlCenterPositionStatus
        bluetoothStatus: ui.controlCenterBluetoothStatus
        signalStatus: ui.controlCenterWLANStatus

        onPositionStatusChanged: ui.controlCenterPositionStatus = positionStatus
        onBluetoothStatusChanged: ui.controlCenterBluetoothStatus = bluetoothStatus
        onSignalStatusChanged: ui.controlCenterWLANStatus = signalStatus
    }

    // 空调功能栏
    ACFunctionBar {
        width: 882
        height: 70
        anchors.left: parent.left
        anchors.leftMargin: 213
        anchors.top: parent.top
        anchors.topMargin: 57

        onFunctionValueChanged: {
            console.log("functionValue: " + functionValue)
        }
    }


    //左温度背景
    Image {
        id: leftTemperatureImage
        width: 270
        height: 511
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 158
        source: "qrc:/Images/AC/left_temperatur_background.png"
        fillMode: Image.PreserveAspectFit
    }

    //左温度列表
    QuickTemperatureList{
        id:leftTemperatureList
        width: 160
        height: 511
        anchors.left: parent.left
        anchors.leftMargin: 46
        anchors.top: parent.top
        anchors.topMargin: 158
        spacing: 10
        background: "transparent"
        currentIndexTextColor: "#04FAFB"
        otherIndexTextColor: "#DFDFDF"
        movingColor: "#DFDFDF"
        fontPixelSize: 38
        fontBold: true
        temperature: ui.acLeftTemperature
        direction: 0

        onMovementStarted: {

        }

        onMovementEnded: {

            ui.acLeftTemperature = temperatureValue
        }
    }

    //右温度背景
    Image {
        id: rightTemperatureImage
        width: 270
        height: 511
        anchors.left: parent.left
        anchors.leftMargin: 1047
        anchors.top: parent.top
        anchors.topMargin: 158
        source: "qrc:/Images/AC/right_temperatur_background.png"
        fillMode: Image.PreserveAspectFit
    }

    //右温度列表
    QuickTemperatureList{
        id:rightTemperatureList
        width: 160
        height: 511
        anchors.left: parent.left
        anchors.leftMargin: 1157
        anchors.top: parent.top
        anchors.topMargin: 158
        spacing: 10
        background: "transparent"
        currentIndexTextColor: "#04FAFB"
        otherIndexTextColor: "#DFDFDF"
        movingColor: "#DFDFDF"
        fontPixelSize: 38
        fontBold: true
        temperature: ui.acRightTemperature
        direction: 1

        onMovementStarted: {

        }

        onMovementEnded: {

            ui.acRightTemperature = temperatureValue
        }
    }


    // 负离子按钮
        Button {
            id: anionButton
            width: 97
            height: 97
            anchors.left: parent.left
            anchors.leftMargin: 266
            anchors.top: parent.top
            anchors.topMargin: 368
            hoverEnabled: false

            property bool switchStatus: true

            background: Image {
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                source: parent.switchStatus ?
                        "qrc:/Images/AC/function_on.png" :
                        "qrc:/Images/AC/function_off.png"
                fillMode: Image.PreserveAspectFit
                opacity: parent.down ? 0.6 : 1
            }

            Label {
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: qsTr("负离子")
                color: "#FFFFFF"
                font.pixelSize: 18
            }

            onClicked: {
                switchStatus = !switchStatus
            }
        }

        // 香薰按钮
        Button {
            id: fragranceButton
            width: 97
            height: 97
            anchors.left: parent.left
            anchors.leftMargin: 1009
            anchors.top: parent.top
            anchors.topMargin: 368
            hoverEnabled: false
            z: leftRect.z + 1

            property bool switchStatus: true

            background: Image {
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                source: parent.switchStatus ?
                        "qrc:/Images/AC/function_on.png" :
                        "qrc:/Images/AC/function_off.png"
                fillMode: Image.PreserveAspectFit
                opacity: parent.down ? 0.6 : 1
            }

            Label {
                width: parent.width
                height: parent.height
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: qsTr("香薰")
                color: "#FFFFFF"
                font.pixelSize: 18
            }

            onClicked: {
                switchStatus = !switchStatus
            }
        }


        Rectangle {
            id: leftRect
            width: 340
            height: 300
            x: 800
            y: 200
            z: backgroundImage.z + 1
            // color: "#2011AA11"
            color: "transparent"
            // visible: false

            MouseArea {
                id: leftMouseArea
                anchors.fill: parent

                onPositionChanged: {
                    if(mouse.x < 0)
                    {
                        leftPercentX = 0
                    }
                    else if(mouse.x > leftMouseArea.width)
                    {
                        leftPercentX = 100
                    }
                    else
                    {
                        leftPercentX = mouse.x / xStepSize
                    }

                    if(mouse.y < 0)
                    {
                        leftPercentY = 0
                    }
                    else if(mouse.y > leftMouseArea.height)
                    {
                        leftPercentY = 100
                    }
                    else
                    {
                        leftPercentY = mouse.y / yStepSize
                    }
                }
            }
        }


        //粒子風特效
        QuickWind {
            id: rightWind
            width: 240
            height: 200
            emitterWidth: 360
            emitterHeight: 30
            source: "qrc:/Images/AC/fog.png"
            x: 890
            y: 210
            z: leftRect.z + 1
            moveX: leftPercentX
            moveY: leftPercentY
            offsetX: 0
            offsetY: 100
            value: ui.acFanLevel
            color: getColor()

            function getColor()
            {
                switch(ui.acRightTemperature)
                {
                case 16: return colorArray[0]
                case 17: return colorArray[1]
                case 18: return colorArray[2]
                case 19: return colorArray[3]
                case 20: return colorArray[4]
                case 21: return colorArray[5]
                case 22: return colorArray[6]
                case 23: return colorArray[7]
                case 24: return colorArray[8]
                case 25: return colorArray[9]
                case 26: return colorArray[10]
                case 27: return colorArray[11]
                case 28: return colorArray[12]
                case 29: return colorArray[13]
                case 30: return colorArray[14]
                case 31: return colorArray[15]
                case 32: return colorArray[16]
                }
            }
        }

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
}
