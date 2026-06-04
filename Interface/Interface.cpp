#include "Interface.h"
#include<QDateTime>
Q_GLOBAL_STATIC(Interface, interface)

Interface::Interface(QObject *parent)
    : QObject{parent}
{
    pageIndex = PAGE_HOME;
    previousPageIndex = pageIndex;

    acLeftTemperature = 26;
    acRightTemperature = 26;
    acFanLevel=5;

    updateTimer = new QTimer();
    updateTimer->start(100);
    connect(updateTimer,SIGNAL(timeout()),this,SLOT(slotUpdateTimer()));

}

Interface *Interface::instance()
{
    return interface;

}

int Interface::getControlCenterMediaVolume() const
{
    return controlCenterMediaVolume;
}

void Interface::setControlCenterMediaVolume(int newControlCenterMediaVolume)
{
    if (controlCenterMediaVolume == newControlCenterMediaVolume)
        return;
    controlCenterMediaVolume = newControlCenterMediaVolume;
    emit controlCenterMediaVolumeChanged();
}

bool Interface::getControlCenterPositionStatus() const
{
    return controlCenterPositionStatus;
}

void Interface::setControlCenterPositionStatus(bool newControlCenterPositionStatus)
{
    if (controlCenterPositionStatus == newControlCenterPositionStatus)
        return;
    controlCenterPositionStatus = newControlCenterPositionStatus;
    emit controlCenterPositionStatusChanged();
}

bool Interface::getControlCenterBluetoothStatus() const
{
    return controlCenterBluetoothStatus;
}

void Interface::setControlCenterBluetoothStatus(bool newControlCenterBluetoothStatus)
{
    if (controlCenterBluetoothStatus == newControlCenterBluetoothStatus)
        return;
    controlCenterBluetoothStatus = newControlCenterBluetoothStatus;
    emit controlCenterBluetoothStatusChanged();
}

bool Interface::getControlCenterWLANStatus() const
{
    return controlCenterWLANStatus;
}

void Interface::setControlCenterWLANStatus(bool newControlCenterWLANStatus)
{
    if (controlCenterWLANStatus == newControlCenterWLANStatus)
        return;
    controlCenterWLANStatus = newControlCenterWLANStatus;
    emit controlCenterWLANStatusChanged();
}

int Interface::getSettingsFunctionValue() const
{
    return settingsFunctionValue;
}

void Interface::setSettingsFunctionValue(int newSettingsFunctionValue)
{
    if (settingsFunctionValue == newSettingsFunctionValue)
        return;
    settingsFunctionValue = newSettingsFunctionValue;
    emit settingsFunctionValueChanged();
}

int Interface::getAcFanLevel() const
{
    return acFanLevel;
}

void Interface::setAcFanLevel(int newAcFanLevel)
{
    if (acFanLevel == newAcFanLevel)
        return;
    acFanLevel = newAcFanLevel;
    emit acFanLevelChanged();
}

int Interface::getAcRightTemperature() const
{
    return acRightTemperature;
}

void Interface::setAcRightTemperature(int newAcRightTemperature)
{
    if (acRightTemperature == newAcRightTemperature)
        return;
    acRightTemperature = newAcRightTemperature;
    emit acRightTemperatureChanged();
}



int Interface::getAcLeftTemperature() const
{
    return acLeftTemperature;
}

void Interface::setAcLeftTemperature(int newAcLeftTemperature)
{
    if (acLeftTemperature == newAcLeftTemperature)
        return;
    acLeftTemperature = newAcLeftTemperature;
    emit acLeftTemperatureChanged();
}

int Interface::getPreviousPageIndex() const
{
    return previousPageIndex;
}

void Interface::setPreviousPageIndex(int newPreviousPageIndex)
{
    if (previousPageIndex == newPreviousPageIndex)
        return;
    previousPageIndex = newPreviousPageIndex;
    emit previousPageIndexChanged();
}

int Interface::getPAGE_CONTROL()
{
    return PAGE_CONTROL;
}

void Interface::slotUpdateTimer()
{
    //获取当前日期和时间
    QDateTime currentTime = QDateTime::currentDateTime();
    QTime currentTimeOnly = currentTime.time();
    QDate currentDateOnly = currentTime.date();

    QString time = currentTimeOnly.toString("HH:mm");
    QString date = currentDateOnly.toString("M月d日");
    int week = currentDateOnly.dayOfWeek();

    QString weekString;
    switch (week) {
    case Qt::Sunday:weekString = " 星期日";break;
    case Qt::Monday:weekString = " 星期一";break;
    case Qt::Tuesday:weekString = " 星期二";break;
    case Qt::Wednesday:weekString = " 星期三";break;
    case Qt::Thursday:weekString = " 星期四";break;
    case Qt::Friday:weekString = " 星期五";break;
    case Qt::Saturday:weekString = " 星期六";break;
    default:
        break;
    }
    date.append(weekString);

    emit updateDateTime(date,time);

}

int Interface::getPAGE_SETTINGS()
{
    return PAGE_SETTINGS;
}

int Interface::getPAGE_APP()
{
    return PAGE_APP;
}

int Interface::getPAGE_AC()
{
    return PAGE_AC;
}

int Interface::getPAGE_HOME()
{
    return PAGE_HOME;
}

int Interface::getPAGE_MAIN()
{
    return PAGE_MAIN;
}

int Interface::getPageIndex() const
{
    return pageIndex;
}

void Interface::setPageIndex(int newPageIndex)
{
    if (pageIndex == newPageIndex)
        return;
    pageIndex = newPageIndex;
    emit pageIndexChanged();
}
