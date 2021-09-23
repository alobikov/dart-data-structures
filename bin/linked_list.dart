class Node {
  Node? next;
  int data;

  Node(this.data);

  @override
  toString() {
    return data.toString();
  }
}

class LinkedList {
  Node? head;
  Node? tail;
  int _size = 0;

  void addLast(int data) {
    final newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
    _size++;
  }

  void addFirst(int data) {
    final newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
    _size++;
  }

  bool contains(int data) {
    return indexOf(data) != -1;
  }

  void deleteFirst() {
    if (head == null) throw Exception("Node not found!");

    if (head == tail) {
      head = null;
      tail = null;
    } else {
      final second = head?.next;
      head!.next = null;
      head = second;
    }
    _size--;
  }

  void deleteLast() {
    if (head == null) throw Exception("Node not found");

    if (head == tail) {
      head = null;
      tail = null;
    } else {
      var prev = getPrevious(tail);
      tail = prev;
      tail!.next = null;
    }
    _size--;
  }

  Node? getPrevious(node) {
    final current = head;
    while (current != null) {
      if (current.next == node) return current;
    }
    return null;
  }

  int indexOf(data) {
    if (head == null) return -1;
    var node = head;
    var index = 0;
    while (node != null) {
      if (node.data == data) break;
      index++;
      node = node.next;
    }
    return index;
  }

  void reverse() {
    if (head == null) return;
    if (head == tail) return;
    var current = head;
    head = tail;
    tail = current;
    Node? pointer;
    Node? second;
    while (current != null) {
      second = current.next;
      current.next = pointer;
      // print('pointer: $pointer, current: $current');
      pointer = current;
      current = second;
    }
  }

  int size() {
    return _size;
  }

  List<Node> toArray() {
    if (head == null) return [];
    List<Node> result = [];
    var current = head;
    while (current != null) {
      result.add(current);
      current = current.next;
    }
    return result;
  }

  @override
  String toString() {
    if (head == null) {
      return 'The list is empty';
    }
    var node = head;
    var arr = [];
    while (node != null) {
      arr.add(node.data);
      node = node.next;
    }
    return ' $arr, head: ${head!.data}, tail: ${tail!.data})';
  }

  void printDetailed() {
    toArray().forEach((node) =>
        print('${node.data}>${node.next != null ? node.next!.data : 'null'}'));
  }
}
