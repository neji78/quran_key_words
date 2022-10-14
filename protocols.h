#ifndef PROTOCOLS_H
#define PROTOCOLS_H
#include <QObject>
struct word_key{
    Q_GADGET
public:
    bool key;
    QString word;
    QString mean;
    Q_PROPERTY(bool key_ MEMBER key)
    Q_PROPERTY(QString word_ MEMBER word)
    Q_PROPERTY(QString mean_ MEMBER mean)
};
struct word_key_{

public:
    QString key;
    QString word;
    QString mean;
};
#endif // PROTOCOLS_H
