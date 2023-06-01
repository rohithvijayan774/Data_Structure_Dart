void main(List<String> args) {
  Queue queue = Queue();

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  queue.enqueue(4);

  print('Queue : ${queue.list}');

  queue.dequeue();

  print("Dequeued Queue : ${queue.list}");
  print('Peek value : ${queue.peek()}');
}

class Queue<T> {
  List<T> list = [];

  void enqueue(T value) {
    list.add(value);
  }

  bool isEmpty() {
    return list.isEmpty;
  }

  T dequeue() {
    if (isEmpty()) {
      throw RangeError('Empty Queue');
    }
    return list.removeAt(0);
  }

  T peek() {
    if (isEmpty()) {
      throw RangeError('Queue is Empty');
    }
    return list.first;
  }
}
