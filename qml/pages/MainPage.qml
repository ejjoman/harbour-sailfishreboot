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
import harbour.sailfishreboot.BootTime 1.0
import "../Utils.js" as Utils

Page {
    id: page

    allowedOrientations: Orientation.All

    property color rebootColor: "#FFCC33"
    property color shutdownColor: "#FF0033"

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

//        PullDownMenu {
//            id: pullDownMenu

//            MenuItem {
//                text: qsTr("About SailfishReboot")

//                onClicked: {
//                    pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
//                }
//            }

//            MenuLabel {
//                text: "<b>" + qsTr("Uptime") + ":</b> " + bootTime.secondsSinceBoot.secondsToTimeString()

////                BootTime {
////                    id: bootTime
////                    autoUpdate: pullDownMenu.active //root.status === Cover.Active || root.status === Cover.Activating
////                    updateInterval: 200
////                }
//            }
//        }

        PullDownMenu {
            id: pullDownMenu
            quickSelect: true
            highlightColor: rebootColor
            backgroundColor: rebootColor

            MenuItem {
                text: "Reboot"
                onClicked: app.reboot();
            }

            Item { height: Theme.itemSizeExtraSmall; width: parent.width }
        }

        PushUpMenu {
            id: pushUpMenu
            quickSelect: true
            highlightColor: shutdownColor
            backgroundColor: shutdownColor

            Item { height: Theme.itemSizeExtraSmall; width: parent.width }

            MenuItem {
                text: "Shutdown"
                onClicked: app.shutdown();
            }
        }

        contentHeight: parent.height

        Image {
            anchors {
                top: parent.top
                topMargin: Theme.paddingLarge
                horizontalCenter: parent.horizontalCenter
            }

            source: "image://theme/icon-l-redirect?" + pullDownMenu.highlightColor
        }

        Column {
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                color: Theme.secondaryColor
                font {
                    pixelSize: Theme.fontSizeHuge
                    family: Theme.fontFamilyHeading
                }

                horizontalAlignment: Text.AlignHCenter
                text: "Uptime"
            }

            Label {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                color: Theme.highlightColor
                font {
                    pixelSize: Theme.fontSizeHuge
                    family: Theme.fontFamilyHeading
                }

                horizontalAlignment: Text.AlignHCenter
                text: bootTime.secondsSinceBoot.secondsToTimeString()
            }
        }

        Image {
            anchors {
                bottom: parent.bottom
                bottomMargin: Theme.paddingLarge
                horizontalCenter: parent.horizontalCenter
            }

            source: "image://theme/icon-l-power?" + pushUpMenu.highlightColor
        }
    }

    onStatusChanged: {
        if (status === PageStatus.Active && app._isInitial) {
            app._isInitial = false;
            pageStack.pushAttached(Qt.resolvedUrl("AboutPage.qml"))
        }
    }
}


