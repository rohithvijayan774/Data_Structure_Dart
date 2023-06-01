void main() {
  final linkedList = LinkedList();
  linkedList.push(10);
  linkedList.push(20);
  linkedList.push(30);

  linkedList.append(40);

  print('Linkedlist Append Method');
  print(linkedList);

  final poppedValue = linkedList.pop();
  print('List After Pop : $linkedList');
  print('Poped Value : $poppedValue');
}

class Node<T> {
  T value;
  Node<T>? next;
  Node({required this.value, this.next});
  @override
  String toString() {
    if (next == null) {
      return '$value';
    }
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;
  bool get isEmpty => head == null;
  @override
  String toString() {
    if (isEmpty) {
      return 'List is empty';
    }
    return head.toString();
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;

    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }
}
