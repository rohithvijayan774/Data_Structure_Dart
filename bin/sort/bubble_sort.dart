void main() {
  List<int> list = [1, 13, 121, 0, 451, 163];
  print("Unsorted Array : $list");

  for (var i = 0; i < list.length; i++) {
    for (var j = 0; j < list.length - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  print("Sorted Array : $list");
}
