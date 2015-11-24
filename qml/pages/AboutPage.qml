import QtQuick 2.0
import Sailfish.Silica 1.0
import "../common"

Page {
    id: root

    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        anchors.fill: parent

        PullDownMenu {
            id: pullDownMenu

            MenuItem {
                text: qsTr("Settings")
                onClicked: pageStack.push(settingsPage)
            }
        }

        model: AboutModel {
            id: aboutModel
        }

        header:  PageHeader {
            title: qsTr("About SailfishReboot")
        }

        delegate: Loader {
            width: parent.width

            property QtObject m: model
            sourceComponent: model.list ? aboutListComponent : aboutItemComponent
        }

        section.property: "group"
        section.criteria: ViewSection.FullString
        section.delegate: SectionHeader { text: section }

        VerticalScrollDecorator {}
    }

    Component {
        id: settingsPage

        SettingsPage {
            parent: root
        }
    }

    Component {
        id: aboutItemComponent

        AboutItem {
            label: m.title
            value: m.subTitle

            function doAction() {
                if (!!model.pageFile)
                    pageStack.push(model.pageFile)
                else if(!!model.url)
                    Qt.openUrlExternally(model.url);
                else if(!!model.mail) {
                    var url = "mailto:" + model.mail.address + (model.mail.subject ? '?' + model.mail.subject : '')
                    Qt.openUrlExternally(url);
                }
            }

            function getRemorse() {
                if(!!model.url)
                    return qsTr('Link will open')

                if(!!model.mail)
                    return qsTr('Mail app will open')

                return ''
            }

            onClicked: {
                var remorse = getRemorse();

                if (remorse) {
                    remorseAction(remorse, function() {
                        doAction();
                    })
                } else {
                    doAction();
                }
            }
        }
    }

    Component {
        id: aboutListComponent

        Column {
            width: parent.width

            Repeater {
                model: m.list

                delegate: DetailItem {
                    label: model.name
                    value: model.value
                }
            }
        }


    }
}
