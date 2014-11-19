/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: page

    Image {
        id: aboutCover
        fillMode: Image.PreserveAspectCrop
        source: "../images/SailfishRebootCover.png"
    }

    SilicaFlickable {
        clip: true
        contentHeight: column.height

        anchors {
            top: aboutCover.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingMedium

            Item {
                height: Theme.paddingMedium
                width: parent.width
            }

            AboutItem {
                label: qsTr("Project Home")
                value: "GitHub"

                onClicked: {
                    openUrlPopup.openUrl("http://ejjoman.github.io/SailfishReboot")
                }
            }

            AboutItem {
                label: qsTr("License")
                value: "GNU General Public License v3"

                onClicked: {
                    pageStack.push(Qt.resolvedUrl("LicensePage.qml"))
                }
            }

            AboutItem {
                label: qsTr("Author")
                value: "Michael Neufing <m.neufing@yahoo.de>"

                onClicked: {
                    openUrlPopup.openUrl("mailto:m.neufing@yahoo.de?subject=SailfishReboot", qsTr("Mail app will open"))
                }
            }

            AboutItem {
                label: qsTr("Twitter")
                value: "@ejjoman"

                onClicked: {
                    openUrlPopup.openUrl("https://twitter.com/ejjoman")
                }
            }

            AboutItem {
                label: qsTr("Donate")
                value: "via PayPal"

                onClicked: {
                    openUrlPopup.openUrl("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=RGXLVJKSJTFGA")
                }
            }

            Item {
                height: Theme.paddingMedium
                width: parent.width
            }
        }

        VerticalScrollDecorator {}
    }

    RemorsePopup {
        id: openUrlPopup

        function openUrl(url, title) {
            openUrlPopup.execute(title || qsTr("Link will open"), function() {
                Qt.openUrlExternally(url);
            })
        }
    }
}


