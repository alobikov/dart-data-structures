import 'dart:collection';

class Node {
  String label;
  List<Edge> edges = <Edge>[];

  Node(this.label);

  void addEdge(Node to, num weight) {
    edges.add(Edge(to, weight));
  }

List<Edge> getEdges() => edges;

  @override
  String toString() => label;
}

class Edge {
  Node to;
  num weight;

  Edge(this.to, this.weight);

  @override
  String toString() => '$weight-$to';
}

class WeightedGraph {
  HashMap<String, Node> nodes = HashMap();

  void showGraph() {
    for ( Node node in nodes.values) {
      print('$node ${node.getEdges()}');
    }
  }

  addNode(String label) {
    nodes.putIfAbsent(label, () => Node(label));
  }

  void addEdge(String from, String to, num weight) {
    Node? fromNode = nodes[from];
    Node? toNode = nodes[to];
    if (fromNode == null || toNode == null) return;
    fromNode.addEdge(toNode, weight);
    toNode.addEdge(fromNode, weight);
  }
}
