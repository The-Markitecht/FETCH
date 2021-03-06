﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace project
{
public class BlockingQueue<T> : IEnumerable<T>

{

    private int _count = 0;

    private Queue<T> _queue = new Queue<T>();

    public T Dequeue()

    {

        lock (_queue)

        {

            while (_count <= 0) Monitor.Wait(_queue);

            _count--;

            return _queue.Dequeue();

        }

    }


    public void Enqueue(T data)

    {

        if (data == null) throw new ArgumentNullException("data");

        lock (_queue)

        {

            _queue.Enqueue(data);

            _count++;

            Monitor.Pulse(_queue);

        }

    }


    IEnumerator<T> IEnumerable<T>.GetEnumerator()

    {

        while (true) yield return Dequeue();

    }


    System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()

    {

        return ((IEnumerable<T>)this).GetEnumerator();

    }

}
}
