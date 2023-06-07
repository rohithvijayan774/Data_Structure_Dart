class Graph {
  Map<String, List<String>> map = {};

  insert(String vertex, String edge) {
    if (!map.containsKey(vertex)) {
      addVertex(vertex);
    }
    if (!map.containsKey(edge)) {
      addVertex(edge);
    }
    map[vertex]!.add(edge);
    map[edge]!.add(vertex);
  }

  addVertex(String key) {
    map[key] = [];
  }

  remove(vertex1, vertex2) {
    map[vertex1]!.remove(vertex2);
    map[vertex2]!.remove(vertex1);
  }
}
