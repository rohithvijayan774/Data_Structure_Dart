import 'dart:io';

class MinHeap {
  List<int> heap;
  MinHeap(this.heap);

  heapifyDown(List<int> arr, int length, int currentIndx) {
    int smallest = currentIndx;
    int leftIndx = (2 * currentIndx) + 1;
    int rightIndx = (2 * currentIndx) + 2;

    if (leftIndx < length && arr[leftIndx] < arr[smallest]) {
      smallest = leftIndx;
    }
    if (rightIndx < length && arr[rightIndx] < arr[smallest]) {
      smallest = rightIndx;
    }

    if (smallest != currentIndx) {
      int temp = arr[smallest];
      arr[smallest] = arr[currentIndx];
      arr[currentIndx] = temp;

      heapifyDown(arr, length, smallest);
    }
  }

  heapify() {
    var length = heap.length;
    for (var i = (length ~/ 2) - 1; i >= 0; i--) {
      heapifyDown(heap, length, i);
    }
  }

  display() {
    if (heap.isEmpty) {
      print('Heap is Empty');
      return;
    }
    for (var i = 0; i < heap.length; i++) {
      stdout.write("${heap[i]} ");
    }
  }

  heapSort(List<int> arr) {
    var length = arr.length;
    for (var i = (length ~/ 2) - 1; i >= 0; i--) {
      heapifyDown(arr, length, i);
    }

    for (var i = length - 1; i >= 0; i--) {
      int temp = arr[0];
      arr[0] = arr[i];
      arr[i] = temp;

      heapifyDown(arr, i, 0);
    }
  }

  remove() {
    if (heap.isEmpty) {
      print("Heap is Empty");
      return;
    }
    heap[0] = heap[heap.length - 1];
    heap.removeAt(heap.length - 1);

    heapifyDown(heap, heap.length, 0);
  }

  parent(int i) {
    return (i - 1) ~/ 2;
  }

  shiftUp(int currentIndex) {
    int parentIndex = parent(currentIndex);

    while (currentIndex > 0 && heap[parentIndex] > heap[currentIndex]) {
      int temp = heap[currentIndex];
      heap[currentIndex] = heap[parentIndex];
      heap[parentIndex] = temp;
      currentIndex = parentIndex;
      parentIndex = parent(currentIndex);
    }
  }

  insert(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }
}

void main() {
  MinHeap minHeap = MinHeap([18, 5, 6, 9, 17, 2]);
  minHeap.heapify();
  minHeap.display();

  print("\nInput-------------------");
  minHeap.insert(4);
  minHeap.display();
  // print("\nRemove--------------");
  // heap.remove();
  // heap.display();
  // print("\nRemove--------------");
  // heap.remove();
  // heap.display();

  print('\nSorted--------------');
  minHeap.heapSort(minHeap.heap);
  minHeap.display();
}
