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
g.addEdge('A', 'D');
g.addEdge('A', 'B');
g.addEdge('A', 'C');
g.removeEdge('A','D');
g.showList();
}