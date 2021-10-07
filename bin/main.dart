import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';
import './hash_table.dart';
import './tree.dart';
import './heap.dart';
import './trie.dart';
import './graph.dart';


void main() {
  var g = Graph();
  g.addNode('A');
  g.addNode('B');
  g.addNode('C');
  g.addNode('D');
  g.addEdge('B', 'D');
  g.addEdge('A', 'B');
  g.addEdge('A', 'C');
  g.addEdge('D', 'C');
  g.showList();
  print(g.traverse('A'));
  print(g.traverseBreadth('A'));
  print(g.traverseBreadth('C'));
  print(g.traverseBreadth('K'));

  var s = Graph();
  s.addNode('X');
  s.addNode('A');
  s.addNode('B');
  s.addNode('P');
  s.addEdge('X', 'A');
  s.addEdge('X', 'B');
  s.addEdge('A', 'P');
  s.addEdge('B', 'P');

  print(s.topologicalSort());

  print(g.hasCycle());
  g.addEdge('D', 'A');
  print(g.hasCycle());
}