import './balanced_expression.dart';
import './list_queue.dart';

void main() {
var q = ListQueue();
print(q);
q.enqueue(1);
q.enqueue(2);
q.enqueue(3);
q.enqueue(4);
q.enqueue(5);
print(q);
print(q.dequeue());
print(q.dequeue());
print(q);
q.enqueue(6);
print(q);
print(q.dequeue());
print(q.dequeue());
print(q.dequeue());
print(q.dequeue());
print('end');
}
