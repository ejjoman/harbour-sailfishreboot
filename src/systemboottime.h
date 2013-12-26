#ifndef SYSTEMBOOTTIME_H
#define SYSTEMBOOTTIME_H

#include <QDateTime>
#include <QTimer>

class SystemBootTime : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool autoUpdate READ autoUpdate WRITE setAutoUpdate NOTIFY autoUpdateChanged)
    Q_PROPERTY(int updateInterval READ updateInterval WRITE setUpdateInterval NOTIFY updateIntervalChanged)
    Q_PROPERTY(qint64 secondsSinceBoot READ secondsSinceBoot NOTIFY secondsSinceBootChanged)

public:
    explicit SystemBootTime(QObject *parent = 0);
    ~SystemBootTime();

    qint64 secondsSinceBoot() const;

    bool autoUpdate() const { return this->_timer->isActive(); }
    void setAutoUpdate(bool update);

    int updateInterval() const { return this->_timer->interval(); }
    void setUpdateInterval(int msec) { this->_timer->setInterval(msec); emit this->updateIntervalChanged(); }

private:
    QDateTime _getSystemBootTime() const;

    QDateTime _systemBootTime;
    QTimer *_timer;
    qint32 _lastSecondsSinceSystemBoot;

signals:
    void autoUpdateChanged();
    void updateIntervalChanged();
    void secondsSinceBootChanged();

private slots:
    void timerTimeout();

};

#endif // SYSTEMBOOTTIME_H
