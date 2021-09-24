import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';

void main() {
  var q = PriorityQueue(5);
  q.add(2);
  q.add(4);
  q.add(3);
  q.add(1);
  print(q);
}
