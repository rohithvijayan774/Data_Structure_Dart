void main(List<String> args) {
  List<int> list = [1, 2, 3, 4, 5, 6, 7];
  int target = 8;

  final result = binarySearch(list, target);

  if (result == -1) {
    print('$target not found in list');
  } else {
    print('$target found in index $result');
  }
}

int binarySearch(List<int> list, int target) {
  int low = 0;
  int high = list.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;

    if (list[mid] == target) {
      return mid;
    } else if (list[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}
