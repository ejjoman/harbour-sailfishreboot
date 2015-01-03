import QtQuick 2.0

ListModel {
    id: model

    Component.onCompleted: {
        var items = [
                    {
                        title: qsTr("Project Home"),
                        subTitle: qsTr("on GitHub"),
                        group: qsTr("Project"),
                        url: "https://github.com/ejjoman/harbour-sailfishreboot"
                    },
                    {
                        title: qsTr("License"),
                        subTitle: "GNU General Public License v3",
                        group: qsTr("Project"),
                        pageFile: Qt.resolvedUrl("../pages/LicensePage.qml")
                    },
                    {
                        title: qsTr("Report a bug or send a feature request"),
                        subTitle: qsTr("on GitHub Issues"),
                        group: qsTr("Project"),
                        url: "https://github.com/ejjoman/harbour-sailfishreboot/issues"
                    },
                    {
                        title: qsTr("Author"),
                        subTitle: "Michael Neufing <michael@neufing.org>",
                        group: qsTr("Author"),
                        mail: {
                            address: "michael@neufing.org",
                            subject: "SailfishReboot"
                        }
                    },
                    {
                        title: qsTr("Twitter"),
                        subTitle: "@ejjoman",
                        group: qsTr("Author"),
                        url: "https://twitter.com/ejjoman"
                    },
                    {
                        title: qsTr("Donate"),
                        subTitle: qsTr("via PayPal"),
                        group: qsTr("Author"),
                        url: "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=3KSKM9EACDQRS"
                    },
                    {
                        title: qsTr("Donate"),
                        subTitle: qsTr("via Flattr"),
                        group: qsTr("Author"),
                        url: "https://flattr.com/submit/auto?user_id=ejjoman&url=https%3A%2F%2Fgithub.com%2Fejjoman%2Fharbour-sailfishreboot"
                    },
                    {
                        title: qsTr("Translation provided by"),

                        //: Insert the Name(s) of the translator(s) here
                        subTitle: qsTrId("names-of-translators"), //("Michael Neufing"),
                        group: qsTr("Translation")
                    },
                    {
                        title: qsTr("Translate this app"),
                        subTitle: qsTr("on Transifex"),
                        group: qsTr("Translation"),
                        url: "https://www.transifex.com/projects/p/harbour-sailfishreboot/"
                    }
                ]

        for (var item in items) {
            model.append(items[item]);
        }
    }
}
