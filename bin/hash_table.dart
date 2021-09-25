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
    var bucket = getBucket(key);
    bucket = bucket ?? LinkedList<Entry<T>>();

    var entry = getEntry(bucket, key);
    if (entry == null) {
      bucket.add(Entry(key, value));
    } else {
      entry.value = value;
    }
    hashTable[hash(key)] = bucket;
  }

  T? get(int key) {
    var bucket = getBucket(key);
    if (bucket == null) return null;
    var entry = getEntry(bucket, key);
    if (entry == null) return null;
    return entry.value;
  }

  bool remove(int key) {
    var bucket = getBucket(key);
    if (bucket == null) return false;
    var entry = getEntry(bucket, key);
    if (entry == null) return false;
    if (bucket.length == 1) {
      hashTable[hash(key)] = null;
      return true;
    }
    return bucket.remove(entry);
  }

  hash(n) => n % hashTable.length;

  getBucket(n) => hashTable[hash(n)];

  getEntry(bucket, key) {
    for (var e in bucket) {
      if(e.key == key) return e;
    }
    return null;
  }

  @override
  String toString() {
    return hashTable
        .map((ll) => ll != null ? ll.toList().toString() : 'null')
        .toString();
  }
}
