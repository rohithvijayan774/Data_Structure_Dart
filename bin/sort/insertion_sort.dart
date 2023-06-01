void main(List<String> args) {
  List<int> list = [9, 2, 3, 5, 4];
  print("Unsorted Array : $list");

  for (var i = 1; i < list.length; i++) {
    var temp = list[i];
    var j = i - 1;
    while (j >= 0 && list[j] > temp) {
      list[j + 1] = list[j];
      j--;
    }
    list[j + 1] = temp;
  }
  print("Sorted Array : $list");
}
