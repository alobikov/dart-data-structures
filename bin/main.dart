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
  trie.insert('car');
  trie.insert('care');
  trie.insert('careful');
  trie.insert('careless');
  trie.insert('card');
  trie.insert('egg');

 print(trie.autoCompletion('car'));

}