class Node {
  String value;
  var children = List<Node?>.filled(ALPHABET_SIZE, null);
  bool isEndOfWord = false;

  static const ALPHABET_SIZE = 26;

  Node(this.value);

  @override
  String toString() => value;
}

class Trie {
  Node root = Node('');

  void insert(String word) {

    var current = root;
    var char = '';

    for (char in word.split('')) {
      var idx = char.toLowerCase().codeUnits[0] - 'a'.codeUnits[0];

      if (current.children[idx] == null) {
        current.children[idx] = Node(char.toLowerCase());
      }

      current = current.children[idx]!;
    }
    current.isEndOfWord = true;
  }
}
