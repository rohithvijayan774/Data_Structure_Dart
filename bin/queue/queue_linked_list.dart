class Node {
  int data;
  Node? next;
  Node(this.data) {
    next = null;
  }
}

class Queue {
  Node? rear;
  Node? front;

  void display() {
    if (front == null) {
      print("Empty list");
      return;
    }
    Node? temp = front;

    while (temp != null) {
      print(temp.data);

      temp = temp.next;
    }
  }

  void enqueue(int data) {
    Node newNode = Node(data);

    if (rear == null) {
      rear = front = newNode;
      return;
    }
    rear!.next = newNode;
    rear = newNode;
  }

  void dequeue() {
    if (front == null) {
      print("Queue is Empty");
      return;
    }
    front = front!.next;
    if (front == null) {
      rear = null;
    }
  }
}

void main() {
  Queue queue = Queue();

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);

  queue.display();

  print("");
  queue.dequeue();
  queue.display();
}
