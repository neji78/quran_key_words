#ifndef QURAN_H
#define QURAN_H

#include "qdbfile.h"
#include "protocols.h"

#include <QObject>
#include <QStringList>
#include <QVariant>



class Quran : public QObject
{
    Q_OBJECT
private:
    QStringList joze;
    QStringList sooreh;
    QStringList ayeh;
    QStringList ayehNumbers;
    QList<struct word_key> words_packet;
    QDBFile *quran_;
public:
    explicit Quran();


public slots:
    void update_sooreh(QString joze);
    void update_ayeh(QString sooreh);
    void update_words(QString ayeh);
    void save_words(QString word,QString mean,bool key);
    QStringList get_joze(){return joze;}
    QStringList get_sooreh(){return sooreh;}
    QStringList get_ayehNumbers_(){return ayehNumbers;}
    QList<struct word_key> get_words(){return words_packet;}

signals:
    void current_joze_changed(QString joze);
    void current_sooreh_changed(QString sooreh);
    void current_ayeh_changed(QString ayeh);


};

#endif // QURAN_H
