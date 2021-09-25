import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';
import './hash_table.dart';

void main() {

  var table = HashTable<String>();
  table.put(1,'one');
  table.put(6,'two');
  table.put(6,'three');
  print(table);
  print(table.get(6));
  print(table.get(1));

}
