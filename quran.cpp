#include "quran.h"
#include <QDebug>

Quran::Quran() : QObject()
{
    quran_ = new QDBFile("quranDB.db");
    for(int i = 1; i <= 30; i++){
        joze.append(QString::number(i));
    }

    connect(this,&Quran::current_joze_changed,this,&Quran::update_sooreh);
    connect(this,&Quran::current_sooreh_changed,this,&Quran::update_ayeh);
    connect(this,&Quran::current_ayeh_changed,this,&Quran::update_words);
}

void Quran::update_sooreh(QString joze)
{
    sooreh.clear();
    QSqlQuery *qurry = quran_->get_current_table()->get_data("part",joze);
    while(qurry->next()){
        if(!sooreh.contains(qurry->value("sooreh").toString()))
            sooreh.append(qurry->value("sooreh").toString());
    }
    //get_list_of_sooreh from this joze
    //emit current sooreh changed
}

void Quran::update_ayeh(QString sooreh)
{
    ayeh.clear();
    ayehNumbers.clear();
    QSqlQuery *qurry = quran_->get_current_table()->get_data("sooreh",sooreh);
    int i = 1;
    while(qurry->next()){
        if(!ayeh.contains(qurry->value("ayeh").toString())){
            ayeh.append(qurry->value("ayeh").toString());
            ayehNumbers.append(QString::number(i));
            i++;
        }
    }
    //update_words(ayeh.first());
    //get_list_of_ayeh from this sooreh
    //emit current ayeh changed
}

void Quran::update_words(QString ayehnum)
{
    words_packet.clear();
    struct word_key pac;
    if(ayehnum.toInt()){
        QSqlQuery *qurry = quran_->get_current_table()->get_data("ayeh","'"+ayeh[ayehnum.toInt()-1]+"'");
        while(qurry->next()){
            pac.word = qurry->value("word").toString();
            pac.mean = qurry->value("mean").toString();
            pac.key = qurry->value("key").toBool();
            words_packet.append(pac);
        }
    }
    //get_list_of_words from this ayeh
    //emit current words changed
}

void Quran::save_words(QString word, QString mean, bool key)
{
    struct word_key_ packet;
    packet.word = word;
    packet.mean = mean;
    if(key)
        packet.key = "true";
    else
        packet.key = "false";
    quran_->get_current_table()->update(packet);
}
