import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';
import './hash_table.dart';
import './tree.dart';

void main() {
  var tree = Tree();
  tree.insert(7);
  tree.insert(4);
  tree.insert(9);
  tree.insert(8);
  tree.insert(1);
  tree.insert(6);
  // tree.insert(10);
  // tree.insert(12);
  print(tree.traversePreOrder());

  var tree1 = Tree();
  tree1.insert(7);
  tree1.insert(8);
  tree1.insert(9);
  tree1.insert(4);
  tree1.insert(10);
  tree1.insert(1);
  tree1.insert(6);

  print('result: ${tree.getNodesAtDistance(3)}');
  print('tree size: ${tree.treeSize()}');
  print('leaves count: ${tree.countLeaves()}');
  var search = 4;
  print('contains $search:, ${tree.contains(search)}');
  search = 5;
  print('contains $search:, ${tree.contains(search)}');

  print('areSibling 4 and 9: ${tree.areSibling(9,4)}');
  print('areSibling 1 and 6: ${tree.areSibling(1,6)}');
}
