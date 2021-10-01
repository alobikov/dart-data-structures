import 'dart:collection';

class Node {
  String value;
  var children = HashMap<String,Node>();
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

  @override
  String toString() => value;
}

class Trie {
  Node root = Node('');

  void insert(String word) {

    var current = root;
    var char = '';

    for (char in word.split('')) {

      if (!current.hasChild(char)) {
        current.addChild(char.toLowerCase());
      }

      current = current.getChild(char)!;
    }
    current.isEndOfWord = true;
  }
}
