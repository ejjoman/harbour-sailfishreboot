import QtQuick 2.0
import Sailfish.Silica 1.0

BackgroundItem {
    width: parent.width
    height: Math.max(labelText.height, valueText.height) + Theme.paddingMedium * 2

    property alias label: labelText.text
    property alias value: valueText.text
    property alias _valueTextItem: valueText

    //height: contentItem.height
    //contentHeight: visible ? (titleText.height == flow.implicitHeight ? Theme.itemSizeSmall : Theme.itemSizeExtraLarge) : 0

    Text {
        id: labelText

        anchors {
            left: parent.left
            right: parent.horizontalCenter

            rightMargin: Theme.paddingSmall
            leftMargin: Theme.paddingLarge

            verticalCenter: parent.verticalCenter
        }

        horizontalAlignment: Text.AlignRight
        color: Theme.highlightColor
        opacity: 0.6
        font.pixelSize: Theme.fontSizeSmall
        wrapMode: Text.Wrap
    }

    Text {
        id: valueText

        anchors {
            left: parent.horizontalCenter
            right: parent.right

            leftMargin: Theme.paddingSmall
            rightMargin: Theme.paddingLarge

            verticalCenter: parent.verticalCenter
        }

        horizontalAlignment: Text.AlignLeft
        color: Theme.highlightColor
        font.pixelSize: Theme.fontSizeSmall
        wrapMode: Text.Wrap
    }
}
