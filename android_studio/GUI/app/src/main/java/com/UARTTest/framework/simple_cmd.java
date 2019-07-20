package com.UARTTest.framework;

public abstract class simple_cmd<T> extends command_msg {
    public T valu;

//    public static simple_cmd<T> create(T new_value) throws Exception  {
//        simple_cmd<T> obj = this.getClass().newInstance();
//        obj.valu = new_value;
//        return obj;
//    }

    public simple_cmd<T> set(T new_value) {
        valu = new_value;
        return this;
    }
}
