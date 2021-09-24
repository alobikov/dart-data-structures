import 'dart:convert';

class ListQueue<T> {
  var queue = List<T?>.filled(5, null);
  var head = 0;
  var tail = 0;
  var count = 0;

  bool isFull() {
    return queue.length == tail - 1;
  }

  bool isEmpty() {
    return tail == 0;
  }

  void enqueue(T data) {
    if (count == queue.length) {
      throw Exception("Queue overflow");
    }
    queue[tail % queue.length] = data;
    tail++;
    count++;
  }

  T? dequeue() {
    if (count == 0) throw Exception("Queue is empty");
    var data = queue[head % queue.length];
    queue[head % queue.length] = null;
    count--;
    head++;
    return data;
  }

  @override
  String toString() {
    return queue.map((data) => JsonEncoder().convert(data)).toString();
  }
}
