#include "dsmeqmladapter.h"

DsmeQmlAdapter::DsmeQmlAdapter(QObject *parent) :
    QObject(parent)
{
    this->_dsmeInterface = new QDBusInterface("com.nokia.dsme", "/com/nokia/dsme/request", "com.nokia.dsme.request", QDBusConnection::systemBus(), this);
}

DsmeQmlAdapter::~DsmeQmlAdapter()
{
    delete(this->_dsmeInterface);
}

void DsmeQmlAdapter::reboot()
{
    this->_dsmeInterface->call("req_reboot");
}

void DsmeQmlAdapter::shutdown()
{
    this->_dsmeInterface->call("req_shutdown");
}
