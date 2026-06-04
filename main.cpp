#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Interface/Interface.h"
#include <QIcon>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);


    app.setWindowIcon(QIcon(":/Images/App/bg.png"));
    engine.rootContext()->setContextProperty("ui",INTERFACE);
    engine.loadFromModule("BYD", "Main");

    return QCoreApplication::exec();
}
