import QtQuick
import QtQuick.Controls
import "../Conponents"

Item {
    id: homePage
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

    // 状态栏
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

    // Interface信号
    Connections {
        target: ui

        function onUpdateDateTime(date, time) {
            dateLabel.text = date
            timeLabel.text = time
        }
    }

    // 语音助手按钮
    Button {
        id: voiceAssistantButton
        width: 444
        height: 120
        anchors.left: parent.left
        anchors.leftMargin: 79
        anchors.top: parent.top
        anchors.topMargin: 67
        hoverEnabled: false

        background: Image {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "qrc:/Images/Home/voice_assistant_background.png"
            fillMode: Image.PreserveAspectFit
            opacity: parent.down ? 0.6 : 1

            Image {
                id: voiceAssistantImage
                width: 86
                height: 86
                anchors.left: parent.left
                anchors.leftMargin: 17
                anchors.top: parent.top
                anchors.topMargin: 20
                source: "qrc:/Images/Home/voice_assistant.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        Label {
            id: voiceTipsLabel
            width: 220
            height: 26
            anchors.left: parent.left
            anchors.leftMargin: 118
            anchors.top: parent.top
            anchors.topMargin: 30
            text: qsTr("你可以这样说：")
            color: "#9AFFFFFF"
            font.pixelSize: 16
        }

        Label {
            id: voiceAssitantLabel
            width: 220
            height: 26
            anchors.left: parent.left
            anchors.leftMargin: 118
            anchors.top: parent.top
            anchors.topMargin: 63
            text: qsTr("小迪去公司的路况怎么样？")
            color: "#FFFFFF"
            font.pixelSize: 18
        }
    }

    // 天气按钮
    Button {
        id: weatherButton
        width: 627
        height: 120
        anchors.left: parent.left
        anchors.leftMargin: 551
        anchors.top: parent.top
        anchors.topMargin: 67
        hoverEnabled: false

        background: Image {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "qrc:/Images/Home/weather_background.png"
            fillMode: Image.PreserveAspectFit
            opacity: parent.down ? 0.6 : 1

            Image {
                id: weatherImage
                width: 76
                height: 65
                anchors.left: parent.left
                anchors.leftMargin: 44
                anchors.top: parent.top
                anchors.topMargin: 28
                source: "qrc:/Images/Home/Weather/sun_clouds.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        // 区域
        Label {
            id: regionLabel
            width: 135
            height: 26
            anchors.left: parent.left
            anchors.leftMargin: 172
            anchors.top: parent.top
            anchors.topMargin: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("南京市 雨花台区")
            color: "#FFFFFF"
            font.pixelSize: 18
        }

        // 状态
        Label {
            id: weatherLabel
            width: 135
            height: 26
            anchors.left: parent.left
            anchors.leftMargin: 172
            anchors.top: parent.top
            anchors.topMargin: 64
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("晴转多云 32°")
            color: "#9AFFFFFF"
            font.pixelSize: 18
        }

        // 分割线
        Rectangle {
            width: 3
            height: 55
            anchors.left: parent.left
            anchors.leftMargin: 356
            anchors.top: parent.top
            anchors.topMargin: 31
            color: "#2C333E"
        }

        // 空气质量提示
        Label {
            id: airQualityTipsLabel
            anchors.left: parent.left
            anchors.leftMargin: 412
            anchors.top: parent.top
            anchors.topMargin: 30
            text: qsTr("空气质量")
            color: "#FFFFFF"
            font.pixelSize: 18
        }

        // 空气质量
        Label {
            id: airQualityLabel
            anchors.left: parent.left
            anchors.leftMargin: 494
            anchors.top: parent.top
            anchors.topMargin: 30
            text: qsTr("优")
            color: "#2D7B87"
            font.pixelSize: 18
        }

        // 温度
        Label {
            id: temperatureLabel
            anchors.left: parent.left
            anchors.leftMargin: 412
            anchors.top: parent.top
            anchors.topMargin: 64
            text: qsTr("车内 20  车外 120")
            color: "#9AFFFFFF"
            font.pixelSize: 18
        }
    }

    // 时间
    Label {
        id: timeLabel
        width: 162
        height: 91
        anchors.left: parent.left
        anchors.leftMargin: 1217
        anchors.top: parent.top
        anchors.topMargin: 61
        text: qsTr("")
        color: "#FFFFFF"
        font.pixelSize: 64

    }

    // 日期
    Label {
        id: dateLabel
        width: 162
        height: 26
        anchors.left: parent.left
        anchors.leftMargin: 1217
        anchors.top: parent.top
        anchors.topMargin: 146
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: qsTr("")
        color: "#9AFFFFFF"
        font.pixelSize: 18
    }

    // 地图按钮
    Button {
        id: mapButton
        width: 310
        height: 387
        anchors.left: parent.left
        anchors.leftMargin: 79
        anchors.top: parent.top
        anchors.topMargin: 235
        hoverEnabled: false

        background: Image {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "qrc:/Images/Home/map.png"
            fillMode: Image.PreserveAspectFit
            opacity: parent.down ? 0.6 : 1
            z: parent.z + 1

            Image {
                width: 279
                height: 97
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 266
                source: "qrc:/Images/Home/map_inner.png"
                fillMode: Image.PreserveAspectFit
                z: parent.z + 1

                // 回家
                Button {
                    id: mapHomeButton
                    width: 43
                    height: 55
                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                    hoverEnabled: false
                    z: parent.z + 1

                    background: Image {
                        width: 29
                        height: 54
                        anchors.centerIn: parent
                        source: "qrc:/Images/Home/map_home.png"
                        fillMode: Image.PreserveAspectFit
                        opacity: parent.down ? 0.6 : 1
                    }
                }

                // 去公司
                Button {
                    id: mapCompanyButton
                    width: 43
                    height: 55
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    hoverEnabled: false
                    z: parent.z + 1

                    background: Image {
                        width: 43
                        height: 55
                        anchors.centerIn: parent
                        source: "qrc:/Images/Home/map_company.png"
                        fillMode: Image.PreserveAspectFit
                        opacity: parent.down ? 0.6 : 1
                    }
                }

                // 充电站
                Button {
                    id: mapChargingStationButton
                    width: 43
                    height: 55
                    anchors.right: parent.right
                    anchors.rightMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                    hoverEnabled: false
                    z: parent.z + 1

                    background: Image {
                        width: 43
                        height: 55
                        anchors.centerIn: parent
                        source: "qrc:/Images/Home/map_charging_station.png"
                        fillMode: Image.PreserveAspectFit
                        opacity: parent.down ? 0.6 : 1
                    }
                }
            }
        }
    }

    // 音乐按钮
    Button {
        id: musicButton
        width: 310
        height: 387
        anchors.left: parent.left
        anchors.leftMargin: 417
        anchors.top: parent.top
        anchors.topMargin: 235
        hoverEnabled: false

        background: Image {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "qrc:/Images/Home/music.png"
            fillMode: Image.PreserveAspectFit
            opacity: parent.down ? 0.6 : 1
            z: parent.z + 1

            // 专辑图片
            Image {
                id: musicAlbumImage
                width: 104
                height: 104
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 74
                source: "qrc:/Images/Home/music_album.png"
                fillMode: Image.PreserveAspectFit
            }

            // 歌词
            Label {
                id: lyricLabel
                width: parent.width
                height: 26
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 197
                text: qsTr("Something Just Like This")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#FFFFFF"
                font.pixelSize: 18
                font.bold: true
            }

            // 艺术家
            Label {
                id: artistLabel
                width: parent.width
                height: 26
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 227
                text: qsTr("The Chainsmokers")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#9AFFFFFF"
                font.pixelSize: 16
            }


            // 播放控制背景
            Image {
                width: 279 * 1.15
                height: 97 * 1.15
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 266 - 15
                source: "qrc:/Images/Home/music_inner.png"
                fillMode: Image.PreserveAspectFit
                z: parent.z + 1

                // 上一曲
                Button {
                    id: musicPreviousButton
                    width: 43
                    height: 55
                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 7
                    hoverEnabled: false
                    z: parent.z + 1

                    background: Image {
                        width: 19
                        height: 20
                        anchors.centerIn: parent
                        source: "qrc:/Images/Home/music_previous.png"
                        fillMode: Image.PreserveAspectFit
                        opacity: parent.down ? 0.6 : 1
                    }
                }

                // 播放
                Button {
                    id: musicPlayButton
                    width: 43
                    height: 55
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 7
                    hoverEnabled: false
                    z: parent.z + 1

                    background: Image {
                        width: 19
                        height: 20
                        anchors.centerIn: parent
                        source: "qrc:/Images/Home/music_play.png"
                        fillMode: Image.PreserveAspectFit
                        opacity: parent.down ? 0.6 : 1
                    }
                }

                // 下一曲
                Button {
                    id: musicNextButton
                    width: 43
                    height: 55
                    anchors.right: parent.right
                    anchors.rightMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 7
                    hoverEnabled: false
                    z: parent.z + 1

                    background: Image {
                        width: 19
                        height: 20
                        anchors.centerIn: parent
                        source: "qrc:/Images/Home/music_next.png"
                        fillMode: Image.PreserveAspectFit
                        opacity: parent.down ? 0.6 : 1
                    }
                }
            }
        }
    }

    // 车况按钮
    Button {
        id: vehicleConditionButton
        width: 624
        height: 177
        anchors.left: parent.left
        anchors.leftMargin: 756
        anchors.top: parent.top
        anchors.topMargin: 235
        hoverEnabled: false

        background: Image {
            width: parent.width
            height: parent.height
            // anchors.centerIn: parent
            source: "qrc:/Images/Home/vehicle_condition.png"
            fillMode: Image.PreserveAspectFit
            opacity: parent.down ? 0.6 : 1
        }

        onClicked: {
            console.log("点击前pageindex:"+ui.pageIndex);
            ui.pageIndex = ui.PAGE_SETTINGS
            console.log("点击后pageindex:"+ui.pageIndex);
        }

        // 天数
        Label {
            id: daysLabel1
            width: 90
            height: 26
            anchors.left: parent.left
            anchors.leftMargin: 23
            anchors.top: parent.top
            anchors.topMargin: 18
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
            anchors.topMargin: 13
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
            anchors.topMargin: 18
            verticalAlignment: Text.AlignVCenter
            text: qsTr(" 天")
            color: "#9AFFFFFF"
            font.pixelSize: 16
        }


        // 车
        Image {
            width: 336
            height: 129
            anchors.left: parent.left
            anchors.leftMargin: 306
            anchors.top: parent.top
            anchors.topMargin: 40
            source: "qrc:/Images/Home/vehicle.png"
            fillMode: Image.PreserveAspectFit
        }

        // 车况
        Image {
            id: vehicleConditionImage
            width: 167
            height: 28
            anchors.left: parent.left
            anchors.leftMargin: 257
            anchors.top: parent.top
            anchors.topMargin: 21
            source: "qrc:/Images/Home/vehicle_condition_good.png"
            fillMode: Image.PreserveAspectFit
        }

        // 里程
        Image {
            id: mileageImage
            width: 149
            height: 73
            anchors.left: parent.left
            anchors.leftMargin: 23
            anchors.top: parent.top
            anchors.topMargin: 86
            source: "qrc:/Images/Home/vehicle_mileage.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    // 收音机按钮
    Button {
        id: radioButton
        width: 414
        height: 177
        anchors.left: parent.left
        anchors.leftMargin: 756
        anchors.top: parent.top
        anchors.topMargin: 446
        hoverEnabled: false

        background: Image {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "qrc:/Images/Home/radio_background.png"
            fillMode: Image.PreserveAspectFit
            opacity: parent.down ? 0.6 : 1

            // 收音机Logo
            Image {
                id: radioLogoImage
                width: 93
                height: 29
                anchors.left: parent.left
                anchors.leftMargin: 23
                anchors.top: parent.top
                anchors.topMargin: 20
                source: "qrc:/Images/Home/radio_logo.png"
                fillMode: Image.PreserveAspectFit
            }

            // 收音机Logo
            Image {
                id: radioSloganImage
                width: 131
                height: 59
                anchors.left: parent.left
                anchors.leftMargin: 23
                anchors.top: parent.top
                anchors.topMargin: 92
                source: "qrc:/Images/Home/radio_slogan.png"
                fillMode: Image.PreserveAspectFit
            }

            // 收音机
            Image {
                id: radioImage
                width: 120
                height: 120
                anchors.left: parent.left
                anchors.leftMargin: 271
                anchors.top: parent.top
                anchors.topMargin: 31
                source: "qrc:/Images/Home/radio.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    // 应用按钮
    Button {
        id: appButton
        width: 220
        height: 217
        anchors.left: parent.left
        anchors.leftMargin: 1159
        anchors.top: parent.top
        anchors.topMargin: 439
        hoverEnabled: false

        background: Image {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "qrc:/Images/Home/app.png"
            fillMode: Image.PreserveAspectFit
            opacity: parent.down ? 0.6 : 1
        }

        onClicked: {
            ui.pageIndex = ui.PAGE_APP
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
