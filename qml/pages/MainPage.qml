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
    property color shutdownColor: "#FF3D64" //"#FF0033"

    property bool _remorseTimerRunning: false

    backNavigation: !_remorseTimerRunning
    forwardNavigation: !_remorseTimerRunning

    function shutdown() {
        remorsePopup.optionalExecute(qsTr("Your device will shutdown"), settings.remorseTimeOut * 1000, function() {
            dsmeAdapter.shutdown();
        });
    }

    function reboot() {
        remorsePopup.optionalExecute(qsTr("Your device will reboot"), settings.remorseTimeOut * 1000, function() {
            dsmeAdapter.reboot();
        });
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            id: pullDownMenu
            //enabled: !_remorseTimerRunning
            quickSelect: true
            highlightColor: settings.useColoredActions ? rebootColor : Theme.highlightColor
            backgroundColor: settings.useColoredActions ? rebootColor : Theme.highlightBackgroundColor

            MenuItem {
                text: qsTr("Reboot")
                onClicked: reboot()
            }

            Item { height: Theme.itemSizeExtraSmall; width: parent.width }
        }

        PushUpMenu {
            id: pushUpMenu
            //enabled: !_remorseTimerRunning
            quickSelect: true
            highlightColor: settings.useColoredActions ? shutdownColor : Theme.highlightColor
            backgroundColor: settings.useColoredActions ? shutdownColor : Theme.highlightBackgroundColor

            Item { height: Theme.itemSizeExtraSmall; width: parent.width }

            MenuItem {
                text: qsTr("Shutdown")
                onClicked: shutdown()
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
                text: qsTr("Uptime")
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

    RemorsePopup {
        id: remorsePopup

        //anchors.bottom: parent.bottom

        onCanceled: {
            _remorseTimerRunning = false;
        }

        onTriggered: {
            _remorseTimerRunning = false;
        }

        function optionalExecute(text, timeout, callback) {
            if (timeout === 0) {
                callback()
            } else {
                _remorseTimerRunning = true;

                remorsePopup.execute(text, function() {
                    callback();
                }, timeout);
            }
        }
    }
}


