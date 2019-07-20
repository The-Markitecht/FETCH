package com.UARTTest.framework;

public abstract class simple_event<T> extends event_msg {
    public T valu;

    public simple_event<T> set(T new_value) {
        valu = new_value;
        return this;
    }
}
