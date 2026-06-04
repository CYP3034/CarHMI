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

    // 设置模式栏
    SettingsModeBar {
        id: leftBackgroundImage
        width: 240
        height: parent.height
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        onFunctionValueChanged: {
            console.log("functionValue: " + functionValue)
        }
    }

    // 设置功能栏
    SettingsFunctionBar {
        id: settingsFunctionBar
        width: 1099
        height: 69
        anchors.left: parent.left
        anchors.leftMargin: 276
        anchors.top: parent.top
        anchors.topMargin: 81
        functionValue: ui.settingsFunctionValue

        onFunctionValueChanged: {
            console.log("functionValue: " + functionValue)
        }
    }

    // 中间背景
    Image {
        id: centerBackgroundImage
        width: 1099
        height: 705
        anchors.left: parent.left
        anchors.leftMargin: 276
        anchors.top: parent.top
        anchors.topMargin: 151
        source: "qrc:/Images/Settings/center_background.png"
        fillMode: Image.PreserveAspectFit
    }

    // 设置列表
    SettingsList {
        id: settingsList
        width: 537
        height: 705
        contentWidth: 405
        contentHeight: 3200
        anchors.left: parent.left
        anchors.leftMargin: 276
        anchors.top: parent.top
        anchors.topMargin: 151

        onMoveStarted: {
            acBar.visible = false
        }

        onMoveEnded: {
            acBar.visible = true
        }
    }

    // 天数
    Label {
        id: daysLabel1
        width: 90
        height: 26
        anchors.left: parent.left
        anchors.leftMargin: 1168
        anchors.top: parent.top
        anchors.topMargin: 235
        verticalAlignment: Text.AlignVCenter
        text: qsTr("已安全陪伴您 ")
        color: "#9AFFFFFF"
        font.pixelSize: 16
    }
    Label {
        id: daysLabel
        width: 50
        height: 32
        anchors.left: daysLabel1.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 230
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: qsTr("267")
        color: "#FFFFFF"
        font.pixelSize: 24
        font.bold: true
    }
    Label {
        id: daysLabel2
        width: 32
        height: 26
        anchors.left: daysLabel.right
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 235
        verticalAlignment: Text.AlignVCenter
        text: qsTr(" 天")
        color: "#9AFFFFFF"
        font.pixelSize: 16
    }

    // 车
    Image {
        width: 472
        height: 182
        anchors.left: parent.left
        anchors.leftMargin:870
        anchors.top: parent.top
        anchors.topMargin: 417
        source: "qrc:/Images/Settings/vehicle.png"
        fillMode: Image.PreserveAspectFit
    }

    // 车况
    Image {
        id: vehicleConditionImage
        width: 167
        height: 28
        anchors.left: parent.left
        anchors.leftMargin: 1160
        anchors.top: parent.top
        anchors.topMargin: 637
        source: "qrc:/Images/Settings/vehicle_condition_good.png"
        fillMode: Image.PreserveAspectFit
    }


    // 里程
    Image {
        id: milesImage
        width: 149
        height: 74
        anchors.left: parent.left
        anchors.leftMargin: 1178
        anchors.top: parent.top
        anchors.topMargin: 294
        source: "qrc:/Images/Settings/miles.png"
        fillMode: Image.PreserveAspectFit
    }



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
