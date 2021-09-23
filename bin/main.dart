import './linked_list.dart';

void main(List<String> arguments) {
  var linked = LinkedList();
  linked.addLast(10);
  linked.addLast(20);
  linked.addLast(30);
  linked.printDetailed();
  linked.reverse();
  print(linked);
  linked.printDetailed();
}
