import 'dart:math' as math;

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
  num infinity = double.infinity;
  num negInfinity = -double.infinity;

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

  List traversePreOrder() {
    var node = root;
    var lst = [];
    _traversePreOrder(node, lst);
    return lst;
  }

  _traversePreOrder(node, lst) {
    if (node == null) return lst;
    lst.add(node.data);
    _traversePreOrder(node.left, lst);
    _traversePreOrder(node.right, lst);
  }

  List traversePostOrder() {
    var node = root;
    var lst = [];
    _traversePostOrder(node, lst);
    return lst;
  }

  _traversePostOrder(node, lst) {
    if (node == null) return lst;
    _traversePostOrder(node.left, lst);
    _traversePostOrder(node.right, lst);
    lst.add(node.data);
  }

  void invert() {
    var node = root;
    if (node == null) return;
    _invert(node);
  }

  void _invert(node) {
    if (node == null) return;
    var tmp = node.left;
    node.left = node.right;
    node.right = tmp;
    _invert(node.left);
    _invert(node.right);
  }

  int height() {
    if (root == null) return -1;
    return _height(root);
  }

  _height(node) {
    if (node.left == null && node.right == null) return 0;
    return 1 + math.max(_height(node.left), _height(node.right));
  }

  bool isLeaf(node) {
    return (node.left == null && node.right == null);
  }

// O(n)
  int min() {
    if (root == null) return -1;
    return _min(root!);
  }

  int _min(Node node) {
    if (isLeaf(node)) return node.data;
    var left = _min(node.left!);
    var right = _min(node.right!);
    return math.min(math.min(left, right), node.data);
  }

  bool? equals(Tree? other) {
    if (other == null) return false;
    return _equals(root, other.root);
  }

  _equals(root, otherRoot) {
    if (otherRoot == null && root == null) return true;
    if (otherRoot != null && root != null) {
      return root.data == otherRoot.data &&
          _equals(root!.left, otherRoot!.left) &&
          _equals(root!.right, otherRoot!.right);
    }
    return false;
  }

  bool? isBinarySearchTree() {
    return _validate(root, negInfinity, infinity);
  }

  _validate(node, min, max) {
    if (node == null) return true;
    print(node.data);
    return node.data < max &&
        node.data > min &&
        _validate(node!.left, negInfinity, (node!.data)) &&
        _validate(node!.right, (node!.data), infinity);
  }

  List? getNodesAtDistance(distance) {
    var lst = [];
    if (root == null) return lst;
    if (distance == 0) return [root!.data];
    return _getNodes(root, distance, lst);
  }

  _getNodes(node, distance, lst) {
    if (node == null) return;
    if (distance == 0) {
      lst.add(node.data);
      return lst;
    }
    _getNodes(node.left, distance - 1, lst);
    _getNodes(node.right, distance - 1, lst);
    return lst;
  }

  int treeSize() {
    if (root == null) return 0;
    return _treeSize(root);
  }

  _treeSize(node) {
    if (node == null) return 0;
    return 1 + _treeSize(node.left) + _treeSize(node.right);
  }

  int countLeaves() {
    if (root == null) return 0;
    return _countLeaves(root);
  }

  _countLeaves(node) {
    if (node == null) return 0;
    if (!isLeaf(node))
      return _countLeaves(node.left) + _countLeaves(node.right);
    return 1 + _countLeaves(node.left) + _countLeaves(node.right);
  }

  bool contains(int data) {
    if (root == null) return false;
    return _contains(root, data);
  }

  _contains(Node? node, int data) {
    if (node == null) return false;
    if (node.data == data) return true;
    if (node.data < data) {
      return _contains(node.left, data);
    } else {
      return _contains(node.right, data);
    }
  }

  bool areSibling(int a, int b) {
    if (root == null) return false;
    return _areSibling(root, math.min(a, b), math.max(a, b));
  }

  _areSibling(Node? node, int a, int b) {
    if (node == null) return false;
    if (node.left?.data == a && node.right?.data == b) {
      return true;
    }
    if (node.data > a) {
      return _areSibling(node.left, a, b);
    } else {
      return _areSibling(node.right, a, b);
    }
  }

  List getAncestors(int data) {
    if (root == null) return [];
    var lst = <Node>[];
    _getAncestors(root, data, lst);
    return lst;
  }

  _getAncestors(Node? node, int key, List<Node> lst) {
    if (node == null) return [];
    if (node.data == key) return lst;
    lst.add(node);
    if (node.data > key) {
      return _getAncestors(node.left, key, lst);
    } else {
      return _getAncestors(node.right, key, lst);
    }
  }
}
