class Node {
  Node? left;
  Node? right;
  int data;

  Node(this.data);

  @override
  String toString() => 'Node=$data';
}

class Tree {
  Node? root;

  void insert(int data) {
    if (root == null) {
      root = Node(data);
      return;
    }

    var current = root;
    var newNode = Node(data);
    while (true) {
      if (current!.data == data) throw Exception("Duplicate nodes not allowed");

      if (current.data > data) {
        if (current.left == null) {
          current.left = newNode;
          break;
        }
        current = current.left;
      } else {
        if (current.right == null) {
          current.right = newNode;
          break;
        }
        current = current.right;
      }
    }
  }

  bool find(int data) {
    if (root == null) return false;

    var current = root;
    while (current != null) {
      if (current.data == data) return true;
      if (current.data > data) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return false;
  }
}
