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
import "../common"

Page {
    id: page

    allowedOrientations: Orientation.All

    backNavigation: !app._remorseTimerRunning
    forwardNavigation: !app._remorseTimerRunning

    property alias remorsePopup: remorsePopup

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            id: pullDownMenu
            //enabled: !_remorseTimerRunning
            quickSelect: true
            highlightColor: "#FFCC33" //settings.useColoredActions ? rebootColor : Theme.highlightColor
            backgroundColor: "#FFCC33" // settings.useColoredActions ? rebootColor : Theme.highlightBackgroundColor

            MenuItem {
                text: qsTr("Reboot")
                onClicked: app.reboot()
            }

            Item { height: Theme.itemSizeExtraSmall; width: parent.width }
        }

        PushUpMenu {
            id: pushUpMenu
            //enabled: !_remorseTimerRunning
            quickSelect: true
            highlightColor: "#FF0033" //settings.useColoredActions ? shutdownColor : Theme.highlightColor
            backgroundColor: "#FF0033" //settings.useColoredActions ? shutdownColor : Theme.highlightBackgroundColor

            Item { height: Theme.itemSizeExtraSmall; width: parent.width }

            MenuItem {
                text: qsTr("Shutdown")
                onClicked: app.shutdown()
            }
        }

        contentHeight: parent.height

        Image {
            id: rebootImage

            anchors {
                top: parent.top
                topMargin: Theme.paddingLarge
                horizontalCenter: parent.horizontalCenter
            }

            source: "image://theme/icon-l-redirect?" + pullDownMenu.highlightColor
        }

        SplitPanel {
            id: splitPanel
            isHorizontal: page.orientation === Orientation.Landscape || page.orientation === Orientation.LandscapeInverted

            //distance: isHorizontal ? .1 : .5

            anchors {
                left: parent.left
                right: parent.right
                top: rebootImage.bottom
                bottom: shutdownImage.top
            }

            leftTop: Column {
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
                    font {
                        pixelSize: Theme.fontSizeHuge
                        family: Theme.fontFamilyHeading
                    }
                    color: Theme.secondaryColor
                    wrapMode: Text.Wrap
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

            rightBottom: Column {
                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

                //                Label {
                //                    id: headerText
                //                    color: Theme.highlightColor
                //                    anchors.horizontalCenter: parent.horizontalCenter

                //                    font {
                //                        pixelSize: Theme.fontSizeLarge
                //                        family: Theme.fontFamilyHeading
                //                    }

                //                    text: "Highscores"
                //                }

                //                InfoLabel {
                //                    text: "No Highscores available yet"
                //                    font.pixelSize: Theme.fontSizeMedium
                //                }

                Repeater {
                    model: 3

                    delegate: Item {
                        width: parent.width
                        height: di.height + Theme.paddingSmall/2

                        Item {
                            width: parent.width
                            height: di.height
                            anchors.verticalCenter: parent.verticalCenter

                            Item {
                                width: parent.width - 2*Theme.paddingMedium
                                height: parent.height

                                anchors.horizontalCenter: parent.horizontalCenter
                                opacity: .15

                                OpacityRampEffect {
                                    sourceItem: opacityRampWrapper
                                    direction: OpacityRamp.LeftToRight
                                    offset: 0.75
                                    slope: 5
                                }

                                Item {
                                    id: opacityRampWrapper

                                    width: parent.width
                                    height: parent.height

                                    OpacityRampEffect {
                                        sourceItem: background
                                        direction: OpacityRamp.RightToLeft
                                        offset: 0.75
                                        slope: 5
                                    }

                                    Rectangle {
                                        id: background

                                        width: parent.width
                                        height: parent.height

                                        color: index % 2 == 0 ? Theme.primaryColor : Theme.secondaryColor
                                    }
                                }
                            }

                            ExtendedDetailItem {
                                id: di
                                label: "<img src='image://theme/icon-s-date?" + Theme.secondaryHighlightColor + "' /> Mo, 23.01.2015"
                                value: "<img src='image://theme/icon-s-timer?" + Theme.highlightColor + "' /> 152d 20h 55m 59s"

                                leftMargin: Theme.paddingSmall
                                rightMargin: Theme.paddingSmall
                            }
                        }
                    }
                }
            }
        }





        //        Drawer {

        //        }



        //        Column {
        //            anchors {
        //                top: rebootImage.bottom
        //                bottom: shutdownImage.top
        //                left: parent.left
        //                right: parent.right
        //            }

        //            Column {
        //                height: parent.height * .5
        //                width: parent.width


        //            }

        //            Column {
        //                height: parent.height * .5
        //                width: parent.width

        //                Column {
        //                    anchors {
        //                        left: parent.left
        //                        right: parent.right
        //                        centerIn: parent //.verticalCenter
        //                    }

        //                }


        //            }
        //        }

        //        Column {
        //            anchors {
        //                left: parent.left
        //                right: parent.right
        //                verticalCenter: parent.verticalCenter
        //            }

        //            Label {
        //                anchors {
        //                    left: parent.left
        //                    right: parent.right
        //                }
        //                font {
        //                    pixelSize: Theme.fontSizeHuge
        //                    family: Theme.fontFamilyHeading
        //                }
        //                color: Theme.secondaryColor
        //                wrapMode: Text.Wrap
        //                horizontalAlignment: Text.AlignHCenter
        //                text: qsTr("Uptime")
        //            }

        //            Label {
        //                anchors {
        //                    left: parent.left
        //                    right: parent.right
        //                }
        //                color: Theme.highlightColor
        //                font {
        //                    pixelSize: Theme.fontSizeHuge
        //                    family: Theme.fontFamilyHeading
        //                }

        //                horizontalAlignment: Text.AlignHCenter
        //                text: bootTime.secondsSinceBoot.secondsToTimeString()
        //            }
        //        }



        Image {
            id: shutdownImage
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

        readonly property bool isRunning: _isRunning
        property bool _isRunning: false

        onCanceled: {
            _isRunning = false;
        }

        onTriggered: {
            _isRunning = false;
        }

        function optionalExecute(text, timeout, callback) {
            if (timeout === 0) {
                callback()
            } else {
                _isRunning = true;

                remorsePopup.execute(text, function() {
                    callback();
                }, timeout);
            }
        }
    }
}


