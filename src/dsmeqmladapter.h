#ifndef DSMEQMLADAPTER_H
#define DSMEQMLADAPTER_H

#include <QObject>
#include <QtDBus/QDBusInterface>
//#include <QtDBus/QDBusConnection>

class DsmeQmlAdapter : public QObject
{
    Q_OBJECT
public:
    explicit DsmeQmlAdapter(QObject *parent = 0);
    ~DsmeQmlAdapter();

    Q_INVOKABLE void reboot();
    Q_INVOKABLE void shutdown();

signals:

public slots:

private:
    QDBusInterface *_dsmeInterface;

};

#endif // DSMEQMLADAPTER_H
