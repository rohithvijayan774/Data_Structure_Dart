class Node {
  int data;
  Node? next;

  Node(this.data) {
    next = null;
  }
}

class Stack {
  Node? top;

  void display() {
    Node? temp = top;

    if (temp == null) {
      print("Stack underflow");
      return;
    }
    while (temp != null) {
      print("${temp.data} ");
      temp = temp.next;
    }
  }

  void push(int data) {
    Node newNode = Node(data);

    if (top == null) {
      top = newNode;
      return;
    }
    newNode.next = top;
    top = newNode;
  }

  void pop() {
    if (top == null) {
      print('Stack is underflow');
      return;
    }
    top = top!.next;
  }

  void deleteByIndex(int index) {
    if (index < 0) {
      throw RangeError("Index must be Zero or larger than Zero");
    }
    Node? prev = null;
    Node? curr = top;
    int count = 0;

    while (curr != null && count < index) {
      prev = curr;
      curr = curr.next;
      count++;
    }
    if (curr == null) {
      throw RangeError("Index $index not found");
    }
    if (prev == null) {
      top = curr.next;
    } else {
      prev.next = curr.next;
    }
  }

  printByIndex(int index) {
    if (index < 0) {
      throw RangeError('Index must be Zero or larger than Zero');
    }

    Node? temp = top;
    int count = 0;

    while (temp != null && count < index) {
      temp = temp.next;
      count++;
    }
    if (temp == null) {
      throw RangeError('Index $index not found');
    }
    print('Element at Index $index : ${temp.data}');
  }
}

void main() {
  Stack stack = Stack();

  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.push(40);

  stack.display();

  stack.pop();
  print('');

  stack.display();
}
