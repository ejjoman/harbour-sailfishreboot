import QtQuick 2.0

Item {
    id: root

    property bool isHorizontal: false

    property double distance: .5

    property alias leftTopItem: leftTopPanel
    property alias leftTop: leftTopPanel.children

    property alias rightBottomItem: rightBottomPanel
    property alias rightBottom: rightBottomPanel.children

    Item {
        id: leftTopPanel
        anchors {
            left: root.left //root.isHoriszontal ? root.left : root.top
            top: root.top //root.isHoriszontal ? root.top :
            right: root.isHorizontal ? undefined : root.right
            bottom: root.isHorizontal ? root.bottom : undefined
        }

        height: root.isHorizontal ? undefined : root.height * distance
        width: root.isHorizontal ? root.width * distance : undefined
    }

    Item {
        id: rightBottomPanel

        anchors {
            left: root.isHorizontal ? leftTopPanel.right  : root.left
            top: root.isHorizontal ? root.top : leftTopPanel.bottom
            right: root.right
            bottom: root.bottom
        }

        height: root.isHoriszontal ? root.height : root.height - leftTopPanel.height
        width: root.isHoriszontal ? root.width * leftTopPanel.width : root.width
    }
}
