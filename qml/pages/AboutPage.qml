import QtQuick 2.0
import Sailfish.Silica 1.0
import "../common"

Page {
    id: root

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

        delegate: AboutItem {
            label: model.title
            value: model.subTitle

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
}
