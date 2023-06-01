class HashTable<K, V> {
  final int capacity;
  List<MapEntry<K, V>?> table;

  HashTable(this.capacity) : table = List.filled(capacity, null);

  int hash(K key) {
    return key.hashCode % capacity;
  }

  void put(K key, V value) {
    int index = hash(key);
    if (table[index] != null && table[index]!.key != key) {
      throw Exception('Key collision');
    }
    table[index] = MapEntry(key, value);
  }

  V get(K key) {
    int index = hash(key);
    if (table[index] == null || table[index]!.key != key) {
      throw Exception('Key not found');
    }
    return table[index]!.value;
  }

  void remove(K key) {
    int index = hash(key);
    if (table[index] == null || table[index]!.key != key) {
      throw Exception('Key not found');
    }
    table[index] = null;
  }
}

void main(List<String> args) {
  HashTable<dynamic, dynamic> myTable = HashTable(10);

  myTable.put('name', 'Rohith');
  myTable.put('age', 25);

  printTable(myTable);

  myTable.remove('age');

  printTable(myTable);
}

void printTable(HashTable table) {
  for (var i = 0; i < table.table.length; i++) {
    if (table.table[i] != null) {
      print('[ ${table.table[i]!.key} : ${table.table[i]!.value}]');
    }
  }
}
