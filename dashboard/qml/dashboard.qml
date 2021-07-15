import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    id: root
    visible: true
    width: 1024
    height: 600
    color: "#C0C0C0"
//    TestMouseGrabber {
//        x: 300
//        y: 20
//    }

    property int valueSlide: 2
    HomeSlideBar {
        id: homeSlideBar
        x:20
        y:20
        z:5
        width: 100
        height: 500
        valueSlide: valueSlide
        function callAppSlideBar(){
            appSlideBar.callAppSlideBar()
        }
        function callAppHaf(){
            appHaf.visible = !appHaf.visible
        }
        function callHideAppHaf(){
            appHaf.visible = false
        }
    }

    AppSlideBar {
        id: appSlideBar
        x: homeSlideBar.x
        y:20
        z:10
        width: 200
        height: 500
        visible: false
        onValueSlideChanged: {
            valueSlide = appSlideBar.valueSlide
        }
    }

    AppHaf {
        id: appHaf
        x: homeSlideBar.x
        y:20
        z:10
        width: 700
        height: 500
        visible: false
        onValueSlideChanged: {
            valueSlide = appSlideBar.valueSlide
        }
    }
}
