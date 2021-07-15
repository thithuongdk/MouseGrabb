import com.mycompany.qmlcomponents 1.0

Window {
    id: window
    width: 300
    height: 300

    Rectangle {
        id: base
        width: 20
        height: 20

        color: "red"

        MouseArea {
            anchors.fill: parent

            property var lastPoint
            property var draggedObj: null

            function vecLength( vec ) {
                return Math.abs( Math.sqrt( Math.pow( vec.x, 2 ) +
                                           Math.pow( vec.y, 2 ) ) );
            }

            onPressed: lastPoint = Qt.point( mouse.x, mouse.y )
            onPositionChanged: {
                if ( !draggedObj ) {
                    var diff = Qt.point( mouse.x - lastPoint.x,
                                        mouse.y - lastPoint.y );
                    if ( vecLength( diff ) > 4 ) {
                        draggedObj = dragObj.createObject( window );
                        grabber.target = draggedObj.dragArea; // grab the mouse
                    }
                }

                mouse.accepted = !draggedObj;
            }
        }
    }
    MouseGrabber {
        id: grabber
    }

    Component {
        id: dragObj

        Rectangle {
            property alias dragArea: dragArea
            width: 20
            height: 20

            color: "blue"

            Drag.active: dragArea.drag.active
            Drag.hotSpot.x: 10
            Drag.hotSpot.y: 10

            MouseArea {
                id: dragArea
                anchors.fill: parent
                drag.target: parent
                onReleased: {
                    if (grabber.target === this)
                        grabber.target = null; // ungrab the mouse
                }
            }
        }
    }
}
