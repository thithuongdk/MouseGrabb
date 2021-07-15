import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import com.mycompany.qmlcomponents 1.0


Item {
    id: appSlideBar

    property var draggedObj: null
    property string bgcolor: "#c4b580"
    property real valueSlide: 3
    property real valueSlidez: 3
    property bool slideVisible: false

    function getAreaSlide() {
        return sliderMouseArea
    }

    function callRelseAppSlideBar(){
    }

    function callAppSlideBar(){
        appSlideBar.visible = true
        if ( !draggedObj ) {
            draggedObj = appSlideBar.getAreaSlide()
            grabber.target = draggedObj; // grab the mouse
        }
        valueSlide = valueSlidez
        slideVisible = false
//        return !draggedObj
    }

    MouseGrabber {
        id: grabber
    }
    Item {
        id: iTemSlideFore
        width: 100
        height: parent.height
        Item {
            id: iTemSlide
            visible: slideVisible
            anchors.fill: parent
            Rectangle {
                id: recBgSlide
                width: 100
                height: parent.height
                color: "#474330"
            }

            Slider {
                id: slider
                x: 0
                width: 100
                height: parent.height
                orientation: Qt.Vertical
                maximumValue: 6
                minimumValue: 0
                value:valueSlide
            }
        }
        MouseArea{
            id: sliderMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onMouseYChanged: {
                valueSlide = (slider.height-mouseY) / (slider.height/6)
                if(slideVisible == false){
                    valueSlide = 3
                    slideVisible = true
                }
                valueSlidez = valueSlide
//                console.log("Move Y")
            }
            onReleased: {
                callRelseAppSlideBar()
                if (grabber.target === this)
                {
                    grabber.target = null  // ungrab the mouse
                    draggedObj = null
                }
                slideVisible = true
                appSlideBar.visible = false
                console.log("Release App")
            }
        }
    }
    Rectangle {
        id: recBg
        x: 110
        width: 100
        height: parent.height
        color: appSlideBar.bgcolor
        MouseArea {
            anchors.fill: parent
            onPressAndHold: {
                appSlideBar.visible = false
            }
        }
    }
    Column {
        x: recBg.x
        Image {
            id: alarms
            width: Math.round(valueSlide) == 6 ? 100 : 70
            height: Math.round(valueSlide) == 6 ? 100 : 70
            source: "//36x36/images/wearable/36x36/alarms.png"
        }
        Image {
            id: fitness
            width:Math.round(valueSlide) == 5 ? 100 : 70
            height: Math.round(valueSlide) == 5 ? 100 : 70
            source: "//36x36/images/wearable/36x36/fitness.png"
        }
        Image {
            id: navigation
            width: Math.round(valueSlide) == 4 ? 100 : 70
            height: Math.round(valueSlide) == 4 ? 100 : 70
            source: "//36x36/images/wearable/36x36/navigation.png"
        }
        Image {
            id: notifications
            width: Math.round(valueSlide) == 3 ? 100 : 70
            height: Math.round(valueSlide) == 3 ? 100 : 70
            source: "//36x36/images/wearable/36x36/notifications.png"
        }
        Image {
            id: settings
            width: Math.round(valueSlide) == 2 ? 100 : 70
            height: Math.round(valueSlide) == 2 ? 100 : 70
            source: "//36x36/images/wearable/36x36/settings.png"
        }
        Image {
            id: weather
            width: Math.round(valueSlide) == 1 ? 100 : 70
            height: Math.round(valueSlide) == 1 ? 100 : 70
            source: "//36x36/images/wearable/36x36/weather.png"
        }
        Image {
            id: worldclock
            width: Math.round(valueSlide) == 0 ? 100 : 70
            height: Math.round(valueSlide) == 0 ? 100 : 70
            source: "//36x36/images/wearable/36x36/worldclock.png"
        }
    }
}

