#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "quran.h"
Q_DECLARE_METATYPE(QList<word_key>)
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //Quran *qr = new Quran();
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<Quran>("quran",1,0,"MyQuran");
    qRegisterMetaType<word_key>();
    qRegisterMetaType<QList<word_key>>();
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
