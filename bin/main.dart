import './linked_list.dart';

void main(List<String> arguments) {
  var linked = LinkedList();
  // linked.addLast(10);
  // linked.addLast(20);
  // linked.addLast(30);
  // linked.addLast(40);
  linked.addLast(50);
  final result = linked.getKthFromTheEnd(1);
  print(result);
}
