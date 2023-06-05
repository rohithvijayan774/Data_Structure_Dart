import 'dart:io';

class MaxHeap {
  List<int> heap;
  MaxHeap(this.heap);

  heapifyDown(List<int> arr, int length, int currentIndx) {
    int larger = currentIndx;
    int leftIndx = (2 * currentIndx) + 1;
    int rightIndx = (2 * currentIndx) + 2;

    if (leftIndx < length && arr[leftIndx] > arr[larger]) {
      larger = leftIndx;
    }

    if (rightIndx < length && arr[rightIndx] > arr[larger]) {
      larger = rightIndx;
    }

    if (larger != currentIndx) {
      int temp = arr[larger];
      arr[larger] = arr[currentIndx];
      arr[currentIndx] = temp;

      heapifyDown(arr, length, currentIndx);
    }
  }

  heapify() {
    int length = heap.length;
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
}

void main() {
  MaxHeap maxHeap = MaxHeap([15, 5, 7, 10, 3, 2]);

  maxHeap.heapify();
  maxHeap.display();
}
