void main() {
  Stack stack = Stack();

  stack.push(1);
  stack.push(2);
  stack.push(3);

  print("Stack : ${stack.items}");

  stack.pop();
  print("Popped Stack : ${stack.items}");

  print('Peek value : ${stack.peek()}');
}

class Stack<T> {
  List items = [];

  bool isEmpty() {
    return items.isEmpty;
  }

  void push(dynamic element) {
    items.add(element);
  }

  dynamic pop() {
    if (isEmpty()) {
      throw RangeError('Stack is Empty');
    }
    items.removeLast();
  }

  dynamic peek() {
    if (isEmpty()) {
      throw RangeError('Stack is Empty');
    }
    return items.last;
  }
}
