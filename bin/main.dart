import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';
import './hash_table.dart';
import './tree.dart';

void main() {
  var tree = Tree();
  tree.insert(7);
  tree.insert(10);
  tree.insert(4);
  tree.insert(8);
  tree.insert(11);
  print(tree.find(12));
  print(tree.find(11));
  print('done');
}
