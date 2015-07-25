import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    allowedOrientations: Orientation.All

    SilicaFlickable {
        contentHeight: content.height
        anchors.fill: parent

        Column {
            id: content
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                id: header
                title: qsTr("Settings")
            }

//            TextSwitch {
//                text: qsTr("Custom colors")
//                description: qsTr("Use custom colors for reboot and shutdown actions")
//                checked: settings.useColoredActions

//                onCheckedChanged: {
//                    settings.useColoredActions = checked
//                }
//            }

            Slider {
                label: qsTr("Remorse timeout")
                maximumValue: 10
                minimumValue: 0
                value: settings.remorseTimeOut
                stepSize: 1.0

                width: parent.width

                valueText: {
                    if (value == 0)
                        return qsTr("Off")

                    return qsTr("%n second(s)", "", value);
                }

                onValueChanged: {
                    settings.remorseTimeOut = value
                }
            }
        }
    }
}
