import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';
import './hash_table.dart';
import './tree.dart';
import './heap.dart';

void main() {
  var heap = Heap();
// 15, 10, 3, 8, 12, 9, 4, 1, 24
  print('original heap: $heap');
  heap.insert(15);
  heap.insert(10);
  heap.insert(3);
  heap.insert(8);
  heap.insert(12);
  heap.insert(9);
  heap.insert(4);
  heap.insert(1);
  heap.insert(24);
  print('resulting heap: $heap');
  heap.remove();
  print('result after remove(): $heap');
}