import QtQuick
import QtQuick.Controls

import "./HMI"
import "./Conponents"

Window {
    width: 1520
    height: 856
    visible: true
    title: qsTr("BYD")

    //界面索引
    property int pageIndex: ui.pageIndex
    property int previousPageIndex: 0

    Component.onCompleted: {
        //pageIndex = ui.PAGE_HOME
    }

    //背景
    Image
    {
        id:backgroundImage
        anchors.fill: parent
        source: "qrc:/Images/Home/base.png"
        fillMode: Image.PreserveAspectCrop
    }


    //导航栏
    Navigation{
        id:navigation
        width: 108
        height:parent.height
        anchors.left: parent.left
        anchors.top: parent.top

        onBack: {

        }

        onHome: {

        }
    }

    //界面加载器
    Loader {
        id: pageLoader
        //anchors.fill: parent
        onStatusChanged: {
            if (status === Loader.Error)
                console.error("加载失败:", source, errorString())
            else if (status === Loader.Ready)
                console.log("加载成功:", source)
        }
    }


    // 控制界面
    ControCenter{
        id: controlCenterPage
        width: 1414
        height: 856
        x: 108
        y: -controlCenterPage.height
    }

    // 滑动区域
    Rectangle {
        width: 1292
        height: 60
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        color: "transparent"

        SwipeArea {
            id: controlSwipeArea
            anchors.fill: parent

            onSwipeDown: {
                downMoveAnimation.start()
                downOpacityAnimation.start()
            }
        }

        // 向下滑动透明度动画
        NumberAnimation {
            id: downOpacityAnimation
            target: controlCenterPage
            properties: "opacity"
            from: 0
            to: 1
            duration: 700
            easing {type: Easing.OutQuad}
        }

        // 向下显示动画
        NumberAnimation {
            id: downMoveAnimation
            target: controlCenterPage
            properties: "y"
            from: -controlCenterPage.height
            to: 0
            duration: 250
            easing {type: Easing.OutQuad}
        }
    }



    //界面切换
    onPageIndexChanged:{
        console.log("pageIndex:"+ui.pageIndex)
        console.log("previousPageIndex:"+previousPageIndex)
        switch(pageIndex)
        {
            case ui.PAGE_HOME:
            {
                pageLoader.source = "HMI/Home.qml"
            }break
            case ui.PAGE_AC:
            {
                pageLoader.source = "HMI/AC.qml"
            }break
            case ui.PAGE_APP:
            {
                pageLoader.source = "HMI/App.qml"
            }break
            case ui.PAGE_SETTINGS:
            {
                pageLoader.source = "HMI/Settings.qml"
            }break
            case ui.PAGE_CONTROL:
            {
                pageLoader.source = "HMI/ControCenter.qml"
            }break
        }

    }
}
