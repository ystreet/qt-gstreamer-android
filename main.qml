import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

import org.freedesktop.gstreamer.GLVideoItem 1.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    Item {
        anchors.fill: parent

        GstGLVideoItem {
            id: video
            objectName: "videoItem"
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
        }
    }
}
