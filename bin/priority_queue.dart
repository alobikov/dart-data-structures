class PriorityQueue {
  var queue = [];
  var ptr = 0;

  PriorityQueue(maxCount) {
    queue = List<int?>.filled(maxCount, null);
  }

  void add(value) {
    if (ptr == queue.length) throw Exception("Queue overflow!");
    if (ptr == 0) {
      queue[ptr] = value;
      ptr++;
      return;
    }

    var idx = shiftItemsToInsert(value);
    queue[idx] = value;
    ptr++;
  }

  int remove() {
    if (ptr == 0) throw Exception("Operation not allowed");
    int removed = queue[--ptr];
    queue[ptr] = null;
    return removed;

  }

  int shiftItemsToInsert(value) {
    var i = ptr;
    while (i != 0) {
      if (value >= queue[i-1]) {
        break;
      } else {
        queue[i] = queue[i-1];
      }
      i--;
    }
    return i;
  }

  @override
  String toString() {
    return queue.toString();
  }
}
