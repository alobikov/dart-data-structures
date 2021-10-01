import 'dart:collection';

class Node {
  String value;
  var children = HashMap<String, Node>();
  bool isEndOfWord = false;

  Node(this.value);

  bool hasChild(String char) {
    return children.containsKey(char);
  }

  void addChild(String char) {
    children[char] = Node(char);
  }

  Node? getChild(String char) {
    return children[char];
  }

  remove(Node node) {
    children.remove(node.value);
  }

  List toArray() {
    List result = [];
    children.forEach((k, v) {
      result.add(v);
    });
    return result;
  }

  @override
  String toString() => '$value${isEndOfWord ? '.' : ''}';
}

class Trie {
  Node root = Node('');

  void insert(String word) {
    var current = root;

    for (var char in word.split('')) {
      if (!current.hasChild(char)) {
        current.addChild(char.toLowerCase());
      }

      current = current.getChild(char)!;
    }
    current.isEndOfWord = true;
  }

  bool contains(String word) {
    var current = root;

    for (var char in word.split('')) {
      if (!current.hasChild(char)) {
        return false;
      }
      current = current.getChild(char)!;
    }
    return current.isEndOfWord;
  }

  List<Node>? getNodes(String word) {
    var current = root;
    List<Node> result = [];

    for (var char in word.split('')) {
      if (!current.hasChild(char)) {
        return null;
      }
      current = current.getChild(char)!;
      result.add(current);
    }
    return result;
  }

  void traverse() {
    return _traverse(root);
  }

  void _traverse(Node node) {
    var nodes = node.toArray();
    print(node);
    for (var node in nodes) {
      _traverse(node);
    }
  }

 // TODO implement it with recursion
  void remove(String word) {
    var nodes = getNodes(word);
    while (nodes!.isNotEmpty) {
      if (hasNoChildren(nodes.last)) {
        var removedNode = nodes.removeLast();
        nodes.last.remove(removedNode);
      } else {
        nodes.last.isEndOfWord = false;
        return;
      }
    }
  }

  bool hasNoChildren(Node node) {
    return node.toArray().isEmpty;
  }
}
