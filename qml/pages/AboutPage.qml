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

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors {
            top: aboutCover.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right

            topMargin: Theme.paddingLarge
        }

        //anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge

//            PageHeader {
//                title: qsTr("About SailfishReboot")
//            }

//            AboutItem {
//                label: qsTr("Version")
//                value: "0.0.1"
//            }

            AboutItem {
                label: qsTr("Project Home")
                value: "GitHub"

                onClicked: {
                    Qt.openUrlExternally("http://ejjoman.github.io/SailfishReboot")
                }
            }

            AboutItem {
                label: qsTr("License")
                value: "GNU General Public License v3"
            }

            AboutItem {
                label: qsTr("Autor")
                value: "Michael Neufing"
            }

            AboutItem {
                label: qsTr("Mail")
                value: "m.neufing@yahoo.de"
            }

            AboutItem {
                label: qsTr("Twitter")
                value: "@ejjoman"
            }

            AboutItem {
                label: qsTr("Donate")
                value: "via PayPal"
            }
        }
    }
}


