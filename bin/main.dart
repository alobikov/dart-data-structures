import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';
import './hash_table.dart';
import './tree.dart';
import './heap.dart';
import './trie.dart';

void main() {

  var trie = Trie();
  // trie.insert('can');
  trie.insert('cat');
  trie.insert('canada');

  print(trie.contains('canada'));
  print(trie.contains('can'));
  trie.traverse();
  trie.remove('can');
  trie.traverse();
}