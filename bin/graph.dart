import 'dart:collection';

class Node {
  String label;

  Node(this.label);

  @override
  String toString() => label;
}

class Graph {
  var adjacencyList = HashMap<Node, List<Node>>();
  var map = HashMap<String, Node>();

  void addNode(String label) {
    var node = Node(label);
    map.putIfAbsent(label, () => node);
    adjacencyList.putIfAbsent(node, () => <Node>[]);
  }

  void removeNode(label) {
    if (!map.containsKey(label)) return;
    Node node = map[label]!;
    map.remove(label);
    adjacencyList.forEach((key, value) {
      value.removeWhere((element) => element == node);
    });
  }

  void addEdge(String from, String to) {
    if (!map.containsKey(from) || !map.containsKey(to)) return;
    Node toNode = map[to]!;
    var node = map[from];
    adjacencyList[node]!.add(toNode);
  }

  void removeEdge(String from, String to) {
    if (!map.containsKey(from) || !map.containsKey(to)) return;
    Node node = map[from]!;
    adjacencyList[node]!.remove(map[to]);
  }

  void showList() {
    getBucket(Node node) => adjacencyList[node];
    map.forEach((k, node) {
      var bucket = getBucket(node);
      if (bucket!.isNotEmpty) {
        print('$k is connected with ${getBucket(node)}');
      }
    });
  }
}
