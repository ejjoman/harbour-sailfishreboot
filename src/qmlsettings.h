#ifndef QMLSETTINGS_H
#define QMLSETTINGS_H

#include <QObject>
#include <QVariant>
#include <QSettings>

class QmlSettings : public QObject
{
    Q_OBJECT
public:
    explicit QmlSettings(QObject *parent = 0);

    Q_INVOKABLE void saveSetting(const QString &key, const QVariant &value);
    Q_INVOKABLE QVariant loadSetting(const QString &key, const QVariant &defaultValue = QVariant());

signals:

public slots:

private:
    QSettings *_settings;
};

#endif // QMLSETTINGS_H
