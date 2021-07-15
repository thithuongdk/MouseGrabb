import QtQuick 2.2


Item {
    id: homeSlideBar
    property real valueSlide: 3
    function callAppSlideBar(){

    }
    function callAppHaf(){

    }
    function callHideAppHaf(){

    }

    Rectangle {
        anchors.fill: parent
        color: "#edd57e"
    }

    Item {
        x:10
        y: homeSlideBar.width*2
        width: 100
        height: 100
        Image {
            id: alarms
            visible: Math.round(valueSlide) == 6
            source: "//36x36/images/wearable/36x36@2/alarms.png"
        }
        Image {
            id: fitness
            visible: Math.round(valueSlide) == 5
            source: "//36x36/images/wearable/36x36@2/fitness.png"
        }
        Image {
            id: navigation
            visible: Math.round(valueSlide) == 4
            source: "//36x36/images/wearable/36x36@2/navigation.png"
        }
        Image {
            id: notifications
            visible: Math.round(valueSlide) == 3
            source: "//36x36/images/wearable/36x36@2/notifications.png"
        }
        Image {
            id: settings
            visible: Math.round(valueSlide) == 2
            source: "//36x36/images/wearable/36x36@2/settings.png"
        }
        Image {
            id: weather
            visible: Math.round(valueSlide) == 1
            source: "//36x36/images/wearable/36x36@2/weather.png"
        }
        Image {
            id: worldclock
            visible: Math.round(valueSlide) == 0
            source: "//36x36/images/wearable/36x36@2/worldclock.png"
        }
        MouseArea{
            anchors.fill: parent
            onPressAndHold: {
                callHideAppHaf()
                callAppSlideBar()
                console.log("onPressAndHold Home ")
            }
            onClicked: {
                callAppHaf()
                console.log("onClicked Home ")
            }
        }
    }
}




