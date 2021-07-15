#ifndef MOUSEGRABBER_H
#define MOUSEGRABBER_H

#include <QObject>
#include <QQuickItem>
#include <QGuiApplication>
#include <QMouseEvent>

class MouseGrabber : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QQuickItem* target READ target WRITE setTarget NOTIFY targetChanged)
    Q_PROPERTY(bool active READ active WRITE setActive NOTIFY activeChanged)

public:
    explicit MouseGrabber(QObject *parent = 0) : QObject(parent), m_target(nullptr), m_active(true) {  }
    QQuickItem* target() const { return m_target; }
    bool active() const { return m_active;}


signals:
    void targetChanged();
    void activeChanged();

public slots:
    void setTarget(QQuickItem* target)
    {
        if (m_target == target)
            return;
        ungrabMouse(m_target);
        if (m_active)
            grabMouse(target);
        m_target = target;
        emit targetChanged();
    }
    void setActive(bool arg)
    {
        if (m_active == arg)
            return;
        m_active = arg;

        if (m_active)
            grabMouse(m_target);
        else
            ungrabMouse(m_target);

        emit activeChanged();
    }

private:
    static void grabMouse(QQuickItem* target)
    {
        if (target)
        {
            target->grabMouse();
            QMouseEvent event(QEvent::MouseButtonPress, QPointF(), Qt::LeftButton,  QGuiApplication::mouseButtons(), QGuiApplication::keyboardModifiers());
            QGuiApplication::sendEvent(target, &event);
        }
    }

    static void ungrabMouse(QQuickItem* target)
    {
        if (target)
            target->ungrabMouse();
    }

    QQuickItem* m_target;
    bool m_active;
};
#endif // MOUSEGRABBER_H
