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

  List<Node> topologicalSort() {
    Queue<Node> stack = Queue();
    Set<Node> visited = {};
    for (var node in nodes.values) {
      _topologicalSort(node, visited, stack);
    }
    return List.from(stack.toList().reversed);
  }

  _topologicalSort(Node node, Set<Node> visited, Queue stack) {
    if (visited.contains(node)) return;
    visited.add(node);
    for (var neighbour in adjacencyList[node]!) {
      _topologicalSort(neighbour, visited, stack);
    }
    stack.add(node);
  }

  bool hasCycle() {
    var all = List<Node>.from(nodes.values);
    print('all nodes $all');
    var visiting = <Node>[];
    var visited = <Node>[];
    while (all.isNotEmpty) {
      var current = all[0];
      print('current $current');
      if(_hasCycle(current, all, visiting, visited)) return true;
    }
    return false;
  }

  _hasCycle(
      Node node, List<Node> all, List<Node> visiting, List<Node> visited) {
    all.remove(node);
    visiting.add(node);
    print('visiting: $visiting');
    for (var neighbour in adjacencyList[node]!) {
      if (visited.contains(neighbour)) continue;

      if (visiting.contains(neighbour)) return true;

      if(_hasCycle(neighbour, all, visiting, visited)) return true;
    }
    visiting.remove(node);
    visited.add(node);
    print('visited: $visited');
    return false;
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
