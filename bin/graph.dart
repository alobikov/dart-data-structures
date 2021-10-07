import 'dart:collection';

class Node {
  String label;

  Node(this.label);

  @override
  String toString() => label;
}

class Graph {
  var adjacencyList = HashMap<Node, List<Node>>();
  var nodes = HashMap<String, Node>();

  void addNode(String label) {
    var node = Node(label);
    nodes.putIfAbsent(label, () => node);
    adjacencyList.putIfAbsent(node, () => <Node>[]);
  }

  void removeNode(label) {
    if (!nodes.containsKey(label)) return;
    Node node = nodes[label]!;
    nodes.remove(label);
    adjacencyList.forEach((key, value) {
      value.remove(node);
    });
    adjacencyList.remove(node);
  }

  void addEdge(String from, String to) {
    if (!nodes.containsKey(from) || !nodes.containsKey(to)) return;
    Node toNode = nodes[to]!;
    var node = nodes[from];
    adjacencyList[node]!.add(toNode);
  }

  void removeEdge(String from, String to) {
    if (!nodes.containsKey(from) || !nodes.containsKey(to)) return;
    Node node = nodes[from]!;
    adjacencyList[node]!.remove(nodes[to]);
  }

  Set<Node> traverse(String label) {
    if (!nodes.containsKey(label)) return {};
    var result = <Node>{};
    _traverse(nodes[label]!, result);
    return result;
  }

  _traverse(Node node, Set<Node> result) {
    result.add(node);
    if (adjacencyList[node]!.isEmpty) return;
    for (var toNode in adjacencyList[node]!) {
      _traverse(toNode, result);
    }
  }

  Set<Node> traverseBreadth(String label) {
    var result = <Node>{};
    var queue = Queue();
    if (!nodes.containsKey(label)) return result;
    Node node = nodes[label]!;
    queue.add(node);
    while (queue.isNotEmpty) {
      Node current = queue.removeFirst();
      result.add(current);
      for (var neighbor in adjacencyList[current]!) {
        if (result.contains(neighbor)) continue;
        queue.add(neighbor);
      }
    }
    return result;
  }

  void showList() {
    getBucket(Node node) => adjacencyList[node];
    nodes.forEach((k, node) {
      var bucket = getBucket(node);
      if (bucket!.isNotEmpty) {
        print('$k is connected with ${getBucket(node)}');
      }
    });
  }
}
