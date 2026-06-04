#ifndef INTERFACE_H
#define INTERFACE_H

#include <QObject>
#include <QTimer>

#define INTERFACE Interface::instance()

class Interface : public QObject
{
    Q_OBJECT

public:
    explicit Interface(QObject *parent = nullptr);
    static Interface *instance();

    //功能界面
    const static int PAGE_MAIN=0;//主界面
    const static int PAGE_HOME=1;//HOME界面
    const static int PAGE_AC=2;//空调
    const static int PAGE_APP=3;//应用
    const static int PAGE_SETTINGS=4;//设置
    const static int PAGE_CONTROL=5;//控制中心

    QTimer *updateTimer;

    //主页
    int pageIndex;
    int previousPageIndex;

    //空调
    int acLeftTemperature;
    int acRightTemperature;
    int acFanLevel;

    //设置
    int settingsFunctionValue;

    //控制中心
    bool controlCenterWLANStatus;
    bool controlCenterBluetoothStatus;
    bool controlCenterPositionStatus;
    int controlCenterMediaVolume;

    int getPageIndex() const;
    void setPageIndex(int newPageIndex);

    static int getPAGE_MAIN();

    static int getPAGE_HOME();

    static int getPAGE_AC();

    static int getPAGE_APP();

    static int getPAGE_SETTINGS();

    static int getPAGE_CONTROL();



    int getPreviousPageIndex() const;
    void setPreviousPageIndex(int newPreviousPageIndex);

    int getAcLeftTemperature() const;
    void setAcLeftTemperature(int newAcLeftTemperature);

    int getAcRightTempreature() const;
    void setAcRightTempreature(int newAcRightTempreature);

    int getAcRightTemperature() const;
    void setAcRightTemperature(int newAcRightTemperature);

    int getAcFanLevel() const;
    void setAcFanLevel(int newAcFanLevel);

    int getSettingsFunctionValue() const;
    void setSettingsFunctionValue(int newSettingsFunctionValue);

    bool getControlCenterWLANStatus() const;
    void setControlCenterWLANStatus(bool newControlCenterWLANStatus);

    bool getControlCenterBluetoothStatus() const;
    void setControlCenterBluetoothStatus(bool newControlCenterBluetoothStatus);

    bool getControlCenterPositionStatus() const;
    void setControlCenterPositionStatus(bool newControlCenterPositionStatus);

    int getControlCenterMediaVolume() const;
    void setControlCenterMediaVolume(int newControlCenterMediaVolume);

signals:

    void pageIndexChanged();
    void updateDateTime(QString date,QString time);

    void previousPageIndexChanged();

    void acLeftTemperatureChanged();

    void acRightTemperatureChanged();

    void acFanLevelChanged();

    void settingsFunctionValueChanged();

    void controlCenterWLANStatusChanged();

    void controlCenterBluetoothStatusChanged();

    void controlCenterPositionStatusChanged();

    void controlCenterMediaVolumeChanged();

public slots:
    void slotUpdateTimer();


private:
    Q_PROPERTY(int pageIndex READ getPageIndex WRITE setPageIndex NOTIFY pageIndexChanged FINAL)
    Q_PROPERTY(int PAGE_MAIN READ getPAGE_MAIN CONSTANT FINAL)
    Q_PROPERTY(int PAGE_HOME READ getPAGE_HOME CONSTANT FINAL)
    Q_PROPERTY(int PAGE_AC READ getPAGE_AC CONSTANT FINAL)
    Q_PROPERTY(int PAGE_APP READ getPAGE_APP CONSTANT FINAL)
    Q_PROPERTY(int PAGE_SETTINGS READ getPAGE_SETTINGS CONSTANT FINAL)
    Q_PROPERTY(int PAGE_CONTROL READ getPAGE_CONTROL CONSTANT FINAL)
    Q_PROPERTY(int previousPageIndex READ getPreviousPageIndex WRITE setPreviousPageIndex NOTIFY previousPageIndexChanged FINAL)
    Q_PROPERTY(int acLeftTemperature READ getAcLeftTemperature WRITE setAcLeftTemperature NOTIFY acLeftTemperatureChanged FINAL)
    Q_PROPERTY(int acRightTemperature READ getAcRightTemperature WRITE setAcRightTemperature NOTIFY acRightTemperatureChanged FINAL)
    Q_PROPERTY(int acFanLevel READ getAcFanLevel WRITE setAcFanLevel NOTIFY acFanLevelChanged FINAL)
    Q_PROPERTY(int settingsFunctionValue READ getSettingsFunctionValue WRITE setSettingsFunctionValue NOTIFY settingsFunctionValueChanged FINAL)
    Q_PROPERTY(bool controlCenterWLANStatus READ getControlCenterWLANStatus WRITE setControlCenterWLANStatus NOTIFY controlCenterWLANStatusChanged FINAL)
    Q_PROPERTY(bool controlCenterBluetoothStatus READ getControlCenterBluetoothStatus WRITE setControlCenterBluetoothStatus NOTIFY controlCenterBluetoothStatusChanged FINAL)
    Q_PROPERTY(bool controlCenterPositionStatus READ getControlCenterPositionStatus WRITE setControlCenterPositionStatus NOTIFY controlCenterPositionStatusChanged FINAL)
    Q_PROPERTY(int controlCenterMediaVolume READ getControlCenterMediaVolume WRITE setControlCenterMediaVolume NOTIFY controlCenterMediaVolumeChanged FINAL)
};

#endif // INTERFACE_H
