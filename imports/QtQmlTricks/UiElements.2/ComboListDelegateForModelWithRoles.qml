import QtQuick 2.1;
import QtQmlTricks.UiElements 2.0;

ComboListDelegate {
    id: base;
    key: (model ? model [roleKey] : undefined);
    value: (model ? model [roleValue] : "");
    width: implicitWidth;
    height: implicitHeight;
    implicitWidth: lbl.contentWidth;
    implicitHeight: lbl.contentHeight;

    property string roleKey   : "key";
    property string roleValue : "value";

    readonly property alias label : lbl;

    TextLabel {
        id: lbl;
        text: base.value;
        font.weight: (base.active ? Font.Bold : (Style.useSlimFonts ? Font.Light : Font.Normal));
        anchors.verticalCenter: parent.verticalCenter;
    }
}
