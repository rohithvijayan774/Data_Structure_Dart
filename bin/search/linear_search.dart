void main(List<String> args) {
  List<int> list = [1, 2, 3, 4, 5, 6, 7];
  int target = 10;

  final result = linearSearch(list, target);

  if (result == -1) {
    print('$target not found in list');
  } else {
    print('$target found in index $result');
  }
}

int linearSearch(List<int> list, int target) {
  for (var i = 0; i < list.length; i++) {
    if (list[i] == target) {
      return i;
    }
  }
  return -1;
}
