import './balanced_expression.dart';
import './list_queue.dart';
import './priority_queue.dart';
import './hash_table.dart';

void main() {

  var table = HashTable<String>();
  table.put(1,'one');
  table.put(6,'two');
  table.put(3,'three');
  table.put(6,'six');
  print(table);
  print(table.remove(1));
  print(table);

}
