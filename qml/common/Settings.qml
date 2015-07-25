import QtQuick 2.0
import harbour.sailfishreboot.Settings 1.0

QtObject {
    id: root

    //property bool useColoredActions: true
    property int remorseTimeOut: 5

    property bool _isInitializing: true

    //onUseColoredActionsChanged: _saveSetting('useColoredActions');
    onRemorseTimeOutChanged: _saveSetting('remorseTimeOut');

    function _getSettings() {
        var _settings = [];

        for (var prop in root) {
            if (prop.substring(0, 1) === "_" || prop.substring(0, 2) === "on" || prop.indexOf('Changed') >= 0)
                continue;

            if (prop === "objectName")
                continue;

            if (typeof root[prop] === 'function' || typeof root[prop] === 'undefined')
                continue;

            _settings[prop] = root[prop];
        }

        return _settings
    }

    function loadSettings() {
        console.log("[Settings]", "Load settings")

        var _settings = _getSettings();

        for (var setting in _settings) {
            root[setting] = QmlSettings.loadSetting("settings/" + setting, _settings[setting]);
            console.log("[Settings]", "[Loaded]", "Key: '" + setting + "'", "Value: '" + root[setting] + "'", "Default: '" + _settings[setting] + "'")
        }
    }

    function saveSettings() {
        console.log("[Settings]", "Save settings")

        var _settings = _getSettings();

        for (var setting in _settings) {
            _saveSetting(setting)
        }
    }

    function _saveSetting(settingName) {
        if (_isInitializing)
            return;

        QmlSettings.saveSetting("settings/" + settingName, root[settingName]);
        console.log("[Settings]", "[Saved]", "Key: '" + settingName + "'", "Value: '" + root[settingName] + "'")
    }

    Component.onCompleted: {
        loadSettings()
        _isInitializing = false;
    }
}
