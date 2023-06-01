void main() {
  List<int> list = [5, 7, 3, 4, 9, 2, -10];
  print('Unsorted List : $list');

  final sortedList = mergeSort(list);
  print('Sorted List : $sortedList');
}

List<int> mergeSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }

  final mid = list.length ~/ 2;
  final left = list.sublist(0, mid);
  final right = list.sublist(mid);

  final leftSort = mergeSort(left);
  final rightSort = mergeSort(right);

  List<int> sortedList = [];
  var i = 0, j = 0;

  while (i < leftSort.length && j < rightSort.length) {
    if (leftSort[i] < rightSort[j]) {
      sortedList.add(leftSort[i]);
      i++;
    } else {
      sortedList.add(rightSort[j]);
      j++;
    }
  }

  sortedList.addAll(leftSort.sublist(i));
  sortedList.addAll(rightSort.sublist(j));

  return sortedList;
}
