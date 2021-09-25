import 'dart:collection';

class Entry<T> extends LinkedListEntry<Entry<T>> {
  T? value;
  int key;

  Entry(this.key, this.value);

  @override
  String toString() {
    return '$key:$value';
  }
}

class HashTable<T> {
  var hashTable = List<LinkedList<Entry<T>>?>.filled(5, null);

  void put(int key, T value) {
    var idx = key % 5;
    var ll = hashTable[idx];
    ll ??= LinkedList<Entry<T>>();
    ll.add(Entry(key, value));
    hashTable[idx] = ll;
  }

  T? get(int key) {
    var idx = key % 5;
   if (hashTable[idx] == null) return null;
   var result = hashTable[idx]!.singleWhere((e) => e.key == key,
        orElse: () => Entry(0,null));
    return result.value;
  }

  bool remove(int key) {
    var mod = key % 5;
    var ll = hashTable[mod];
    if (ll == null) return false;
    ll.remove(ll.firstWhere((e) => e.key == key));
    return true;
  }

  @override
  String toString() {
    return hashTable
        .map((ll) => ll != null ? ll.toList().toString() : 'null')
        .toString();
  }
}
