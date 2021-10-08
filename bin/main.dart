import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';
import './hash_table.dart';
import './tree.dart';
import './heap.dart';
import './trie.dart';
import './graph.dart';
import './weighted_graph.dart';

void main() {
  var g = WeightedGraph();
  g.addNode('A');
  g.addNode('B');
  g.addNode('C');
  g.addEdge('A','B',2);
  g.addEdge('A','C',2);
  g.addEdge('B','C',4);
g.showGraph();
}
