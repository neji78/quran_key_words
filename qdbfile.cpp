#include "qdbfile.h"
#include <QDebug>


QDBFile::QDBFile(QString name) : QObject()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(name);
    if(!db.open()){
        qDebug() << db.lastError().text();
    }
    tables = db.tables();
    qDebug()<<tables;
    set_current_table(tables.first());
}

void QDBFile::set_current_table(QString table_name)
{
    if(tables.contains(table_name))
        current_table = new QTable(db,table_name);
    else
       qDebug()<<"there is no tables with name "+table_name;
}
