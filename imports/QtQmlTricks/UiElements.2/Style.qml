pragma Singleton;
import QtQuick 2.1;
import QtQuick.Window 2.1;
import QtQmlTricks.UiElements 2.0;

QtObject {
    id: style;

    property bool isMobile : (Qt.platform.os === "android" || Qt.platform.os === "ios");

    property bool useNativeText : false;

    property bool useSlimFonts : true;

    property bool useHovering : !isMobile;

    property bool useDarkTheme : false;

    property int lineSize : (1 * Screen.devicePixelRatio);

    property int roundness : (3 * Screen.devicePixelRatio);

    property int spacingNormal : ((isMobile ? 15 : 8) * Screen.devicePixelRatio);
    property int spacingSmall  : Math.round (spacingNormal / 2);
    property int spacingBig    : Math.round (spacingNormal * 2);

    property int fontSizeNormal : ((isMobile ? 24 : 16) * Screen.devicePixelRatio);
    property int fontSizeSmall  : Math.round (fontSizeNormal * 0.85);
    property int fontSizeBig    : Math.round (fontSizeNormal * 1.15);
    property int fontSizeTitle  : Math.round (fontSizeNormal * 1.25);

    property color colorNone       : "transparent";
    property color colorDumb       : "#FF00FF"; // magenta
    property color colorHighlight  : (useDarkTheme ? "#00648B" : "#85D3FF"); // deep blue | light blue
    property color colorSelection  : (useDarkTheme ? "#0076A8" : "#238FCD"); // water blue | dark blue
    property color colorSecondary  : (useDarkTheme ? "#333333" : "#A9A9A9"); // darker gray | dark gray
    property color colorWindow     : (useDarkTheme ? "#212121" : "#D3D3D3"); // very dark gray | light gray
    property color colorClickable  : (useDarkTheme ? "#2E2E2E" : "#C7C7C7"); // very dark gray | light gray
    property color colorEditable   : (useDarkTheme ? "#000000" : "#FFFFFF"); // black | white
    property color colorForeground : (useDarkTheme ? "#FFFFFF" : "#000000"); // white | black
    property color colorBorder     : (useDarkTheme ? "#4F4F4F" : "#808088"); // dark gray | mid gray
    property color colorLink       : (useDarkTheme ? "#5BBDFF" : "#113487"); // light blue | dark blue
    property color colorError      : (useDarkTheme ? "#FF5B6B" : "#B30000"); // light red | dark red
    property color colorValid      : (useDarkTheme ? "#14C321" : "#1F7A1F"); // light green | dark green
    property color colorBubble     : (useDarkTheme ? "#4F4130" : "#FFF5C1"); // coffee brown | sand yellow

    readonly property string fontName : selectFont ([
                                                        "Sail Sans Pro",
                                                        "Source Sans Pro",
                                                        "Ubuntu",
                                                        "Roboto",
                                                        "Droid Sans",
                                                        "Liberation Sans",
                                                        "Trebuchet MS",
                                                        "Deja Vu Sans",
                                                        "Tahoma",
                                                        "Helvetica",
                                                        "Arial",
                                                    ],
                                                    "sans-serif");

    readonly property string fontFixedName : selectFont ([
                                                             "Ubuntu Mono",
                                                             "Roboto Mono",
                                                             "Liberation Mono",
                                                             "Droid Mono",
                                                             "Deja Vu Mono",
                                                             "Lucida Console",
                                                             "Courier New",
                                                         ],
                                                         "monospace");

    property Component symbolCross : Component {
        AbstractSymbol {
            id: cross;

            Rectangle {
                color: cross.color;
                width: cross.size;
                height: (cross.size * 0.15);
                rotation: +45;
                radius: (cross.size * 0.05);
                antialiasing: radius;
                anchors.centerIn: parent;
                anchors.alignWhenCentered: false;
            }
            Rectangle {
                color: cross.color;
                width: cross.size;
                height: (cross.size * 0.15);
                rotation: -45;
                radius: (cross.size * 0.05);
                antialiasing: radius;
                anchors.centerIn: parent;
                anchors.alignWhenCentered: false;
            }
        }
    }

    property Component symbolPlus : Component {
        AbstractSymbol {
            id: plus;

            Rectangle {
                color: plus.color;
                width: plus.size;
                height: (plus.size * 0.15);
                radius: (plus.size * 0.05);
                antialiasing: radius;
                anchors.centerIn: parent;
                anchors.alignWhenCentered: false;
            }
            Rectangle {
                color: plus.color;
                width: (plus.size * 0.15);
                height: plus.size;
                radius: (plus.size * 0.05);
                antialiasing: radius;
                anchors.centerIn: parent;
                anchors.alignWhenCentered: false;
            }
        }
    }

    property Component symbolMinus : Component {
        AbstractSymbol {
            id: minus;

            Rectangle {
                color: minus.color;
                width: minus.size;
                height: (minus.size * 0.15);
                radius: (minus.size * 0.05);
                antialiasing: radius;
                anchors.centerIn: parent;
                anchors.alignWhenCentered: false;
            }
        }
    }

    property Component symbolCheck : Component {
        AbstractSymbol {
            id: check;

            readonly property real section  : (size * 0.10);
            readonly property real diagonal : (Math.SQRT2 * section);

            Rectangle {
                id: small;
                color: check.color;
                width: (check.diagonal * 3);
                height: check.diagonal;
                rotation: +45;
                radius: (check.diagonal / 5);
                antialiasing: radius;
                anchors {
                    centerIn: parent;
                    alignWhenCentered: false;
                    verticalCenterOffset: check.section;
                    horizontalCenterOffset: (-2 * check.section);
                }
            }
            Rectangle {
                id: big;
                color: check.color;
                width: (check.diagonal * 5);
                height: check.diagonal;
                rotation: -45;
                radius: (check.diagonal / 5);
                antialiasing: radius;
                anchors {
                    centerIn: parent;
                    alignWhenCentered: false;
                    horizontalCenterOffset: check.section;
                }
            }
        }
    }

    property Component symbolArrowDown : Component {
        AbstractSymbol {
            id: arrow;

            Item {
                clip: true;
                width: arrow.size;
                height: (arrow.size / 2);
                anchors.centerIn: parent;

                Rectangle {
                    color: arrow.color;
                    width: (arrow.size * Math.SQRT2 / 2);
                    height: width;
                    rotation: 45;
                    antialiasing: true;
                    anchors {
                        verticalCenter: parent.top;
                        horizontalCenter: parent.horizontalCenter;
                        alignWhenCentered: false;
                    }
                }
            }
        }
    }

    property Component symbolArrowUp : Component {
        AbstractSymbol {
            id: arrow;

            Item {
                clip: true;
                width: arrow.size;
                height: (arrow.size / 2);
                anchors.centerIn: parent;

                Rectangle {
                    color: arrow.color;
                    width: (arrow.size * Math.SQRT2 / 2);
                    height: width;
                    rotation: 45;
                    antialiasing: true;
                    anchors {
                        verticalCenter: parent.bottom;
                        horizontalCenter: parent.horizontalCenter;
                        alignWhenCentered: false;
                    }
                }
            }
        }
    }

    property Component symbolArrowLeft : Component {
        AbstractSymbol {
            id: arrow;

            Item {
                clip: true;
                width: (arrow.size / 2);
                height: arrow.size;
                anchors.centerIn: parent;

                Rectangle {
                    color: arrow.color;
                    width: (arrow.size * Math.SQRT2 / 2);
                    height: width;
                    rotation: 45;
                    antialiasing: true;
                    anchors {
                        verticalCenter: parent.verticalCenter;
                        horizontalCenter: parent.right;
                        alignWhenCentered: false;
                    }
                }
            }
        }
    }

    property Component symbolArrowRight : Component {
        AbstractSymbol {
            id: arrow;

            Item {
                clip: true;
                width: (arrow.size / 2);
                height: arrow.size;
                anchors.centerIn: parent;

                Rectangle {
                    color: arrow.color;
                    width: (arrow.size * Math.SQRT2 / 2);
                    height: width;
                    rotation: 45;
                    antialiasing: true;
                    anchors {
                        verticalCenter: parent.verticalCenter;
                        horizontalCenter: parent.left;
                        alignWhenCentered: false;
                    }
                }
            }
        }
    }

    property Component templateGradientSunken : Component {
        Gradient {
            id: autogradient;

            property color baseColor : colorDumb;

            GradientStop { color: Qt.darker  (autogradient.baseColor, 1.15); position: 0.0; }
            GradientStop { color: Qt.lighter (autogradient.baseColor, 1.15); position: 1.0; }
        }
    }
    property Component templateGradientRaised : Component {
        Gradient {
            id: autogradient;

            property color baseColor : colorDumb;

            GradientStop { color: Qt.lighter (autogradient.baseColor, 1.15); position: 0.0; }
            GradientStop { color: Qt.darker  (autogradient.baseColor, 1.15); position: 1.0; }
        }
    }
    property Component templateGradientFlat : Component {
        Gradient {
            id: autogradient;

            property color baseColor : colorDumb;

            GradientStop { color: autogradient.baseColor; position: 0.0; }
            GradientStop { color: autogradient.baseColor; position: 1.0; }
        }
    }
    property Component templateGradientShaded : Component {
        Gradient {
            id: autogradient;

            property color baseColorTop    : colorDumb;
            property color baseColorBottom : colorDumb;

            GradientStop { color: autogradient.baseColorTop;    position: 0.0; }
            GradientStop { color: autogradient.baseColorBottom; position: 1.0; }
        }
    }

    function gray (val) {
        var tmp = (val / 255);
        return Qt.rgba (tmp, tmp, tmp, 1.0);
    }

    function opacify (tint, alpha) {
        var tmp = Qt.darker (tint, 1.0);
        return Qt.rgba (tmp.r, tmp.g, tmp.b, alpha);
    }

    function selectFont (list, fallback) {
        var ret;
        var all = Qt.fontFamilies ();
        for (var idx = 0; idx < list.length; idx++) {
            var tmp = list [idx];
            if (all.indexOf (tmp) >= 0) {
                ret = tmp;
                break;
            }
        }
        return (ret || fallback);
    }

    property Item _garbage_ : Item { }

    function generateGradient (template, baseColor) {
        return template.createObject (_garbage_, { "baseColor" : baseColor });
    }

    function gradientIdle (baseColor) {
        return generateGradient (templateGradientRaised, baseColor || colorClickable);
    }

    function gradientPressed (baseColor) {
        return generateGradient (templateGradientSunken, baseColor || colorClickable);
    }

    function gradientChecked (baseColor) {
        return generateGradient (templateGradientSunken, baseColor || colorHighlight);
    }

    function gradientDisabled (baseColor) {
        return generateGradient (templateGradientFlat, baseColor || colorWindow);
    }

    function gradientEditable (baseColor) {
        return generateGradient (templateGradientFlat, baseColor || colorEditable);
    }

    function gradientShaded (baseColorTop, baseColorBottom) {
        return templateGradientShaded.createObject (_garbage_, {
                                                        "baseColorTop"    : (baseColorTop    || colorHighlight),
                                                        "baseColorBottom" : (baseColorBottom || colorWindow),
                                                    });
    }
}
