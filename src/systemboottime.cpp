#include "systemboottime.h"
#include <QFile>
#include <QTextStream>

SystemBootTime::SystemBootTime(QObject *parent) :
    QObject(parent)
{
    QDateTime systemBootDateTime;

    QFile uptimeFile("/proc/uptime");
    if (uptimeFile.exists() && uptimeFile.open(QIODevice::ReadOnly)) {
        QTextStream stream(&uptimeFile);

        double uptime = stream.readLine().section(" ", 0, 0).trimmed().toDouble();
        systemBootDateTime = QDateTime::currentDateTime().addSecs(qRound(uptime) * -1);
        uptimeFile.close();
    }

    this->_lastSecondsSinceSystemBoot = -1;
    this->_systemBootTime = systemBootDateTime;

    this->_timer = new QTimer(this);
    connect(this->_timer, SIGNAL(timeout()), this, SLOT(timerTimeout()));
}

SystemBootTime::~SystemBootTime()
{
    this->_timer->stop();
    delete(this->_timer);
}

QDateTime SystemBootTime::_getSystemBootTime() const
{
    return this->_systemBootTime;
}

qint64 SystemBootTime::secondsSinceBoot() const
{
    return this->_systemBootTime.secsTo(QDateTime::currentDateTime());
}

void SystemBootTime::setAutoUpdate(bool update)
{
    if (update == this->_timer->isActive())
        return;

    if (update)
        this->_timer->start();
    else
        this->_timer->stop();

    emit this->autoUpdateChanged();
}

void SystemBootTime::timerTimeout()
{
    if (this->_lastSecondsSinceSystemBoot < this->secondsSinceBoot()) {
        this->_lastSecondsSinceSystemBoot = this->secondsSinceBoot();
        emit this->secondsSinceBootChanged();
    }
}
