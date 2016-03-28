import QtQuick 2.0
import org.nemomobile.dbus 2.0

DBusInterface {
    id: root

    service: "com.nokia.dsme"
    path: "/com/nokia/dsme/request"
    iface: "com.nokia.dsme.request"
    bus: DBus.SystemBus

    function reboot() {
        root.call("req_reboot", undefined)
    }

    function shutdown() {
        root.call("req_shutdown", undefined)
    }
}
