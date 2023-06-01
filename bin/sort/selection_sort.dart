void main() {
  List<int> list = [5, 3, 8, 6, 2, 7, 1, 4];
  print('Unsorted Array : $list');

  for (var i = 0; i < list.length - 1; i++) {
    int minIndex = i;
    for (var j = i + 1; j < list.length; j++) {
      if (list[j] < list[minIndex]) {
        minIndex = j;
      }
    }
    if (minIndex != i) {
      int temp = list[i];
      list[i] = list[minIndex];
      list[minIndex] = temp;
    }
  }
  print("Sorted Array : $list");
}
