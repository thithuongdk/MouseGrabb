#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include "mousegrabber.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<MouseGrabber>("com.qmlcomponents", 1, 0, "MouseGrabber");

    QQmlApplicationEngine engine(QUrl("qrc:/qml/dashboard.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
