void main() {
  List<int> arr = [10, 7, 8, 9, 1, 5];
  int n = arr.length;
  print('Unsorted Array : $arr');

  quickSort(arr, 0, n - 1);
  print('Sorted Array : $arr');
}

List<int> quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    //Find the partition index
    int pivotIndex = partition(arr, low, high);

    //Recursively sort the left and right subarrays
    quickSort(arr, low, pivotIndex - 1);
    quickSort(arr, pivotIndex + 1, high);
  }
  return arr;
}

int partition(List<int> arr, int low, int high) {
  //Select the rightmost element as the pivot
  int pivot = arr[high];

  //index of smaller element
  int i = low - 1;

  for (var j = low; j < high - 1; j++) {
    //if the current element is smaller than the pivot
    if (arr[j] < pivot) {
      i++;

      //swap arr[i] and arr[j]
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  //swap arr[i+1] and arr[high] (or pivot)
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}
