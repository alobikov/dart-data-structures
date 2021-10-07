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
g.addNode('test1');
g.addNode('test2');
g.addNode('test3');
g.addNode('test4');
g.addEdge('test1', 'test2');
g.addEdge('test1', 'test3');
g.addEdge('test1', 'test4');
g.removeEdge('test1','test2');
g.showList();
}