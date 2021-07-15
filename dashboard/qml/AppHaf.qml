import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import com.mycompany.qmlcomponents 1.0


Item {
    id: appHaf

    property var draggedObj: null
    property string bgcolor: "#c4b580"
    property real valueSlide: 3
    property real valueSlidez: 3
    property bool slideVisible: false


    Rectangle {
        id: recBg
        x: 110
        width: 500
        height: parent.height
        color: appSlideBar.bgcolor
        Rectangle {
            x: 100
            width: 3
            height: parent.height
            color: "black"
        }
        Rectangle {
            x: 100
            y: parent.height/2
            width: 400
            height: 3
            color: "black"
        }
        Text {
            x:150
            y:10
            text: qsTr("X")
            font.pixelSize: 200
        }
        Text {
            x:150
            y:parent.height/2
            text: qsTr("X")
            font.pixelSize: 200
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

