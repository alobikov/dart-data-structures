import 'dart:math' as math;
import 'dart:core';

class Heap {
  var heap = List.filled(15, 0);
  int size = 0;

  List heapify(List lst) {
    for (var i = lst.length ~/ 2 - 1; i >= 0; i--) {
      _heapify(i, lst);
    }
    return lst;
  }

  _heapify(int idx, List lst) {
    var lagerIdx = idx;

    var leftIdx = idx * 2 + 1;
    if (leftIdx < lst.length && lst[leftIdx] > lst[lagerIdx]) {
      lagerIdx = leftIdx;
    }

    var rightIdx = idx * 2 + 2;
    if (rightIdx < lst.length && lst[rightIdx] > lst[lagerIdx]) {
      lagerIdx = rightIdx;
    }

    if (idx == lagerIdx) return;
    swap(lst, idx, lagerIdx);
    _heapify(lagerIdx, lst);
  }

  swap(List lst, int idx, int idx1) {
    var tmp = lst[idx1];
    lst[idx1] = lst[idx];
    lst[idx] = tmp;
  }

  void insert(int value) {
    heap[size++] = value;
    bubbleUp(size - 1);
  }

  int? remove() {
    if (size == 0) return null;
    var removedValue = heap[0];
    heap[0] = heap[size - 1];
    heap[size - 1] = 0;
    size--;
    bubbleDown(0);
    return removedValue;
  }

  bool isNodeProper(int idx) {
    var parentValue = heap[parentIdx(idx)];
    return heap[idx] <= parentValue;
  }

  void bubbleUp(int idx) {
    if (idx == 0 || isNodeProper(idx)) return;
    swapChildAndParent(idx);
    return bubbleUp(parentIdx(idx));
  }

  bubbleDown(int idx) {
    if (idx >= size) return;

    if (!isLeftChild(idx) && !isRightChild(idx)) return;

    if (!isRightChild(idx)) {
      if (heap[leftIdx(idx)] > heap[idx]) {
        swapNodes(idx, leftIdx(idx));
      }
      return;
    }

    if (heap[leftIdx(idx)] > heap[rightIdx(idx)]) {
      if (heap[leftIdx(idx)] > heap[idx]) {
        swapNodes(idx, leftIdx(idx));
        return bubbleDown(leftIdx(idx));
      }
    } else {
      if (heap[rightIdx(idx)] > heap[idx]) {
        swapNodes(idx, rightIdx(idx));
        return bubbleDown(rightIdx(idx));
      }
    }
    return;
  }

  void swapNodes(int parentIdx, int childIdx) {
    var childValue = heap[childIdx];
    heap[childIdx] = heap[parentIdx];
    heap[parentIdx] = childValue;
  }

  void swapChildAndParent(int childIdx) {
    var childValue = heap[childIdx];
    heap[childIdx] = heap[parentIdx(childIdx)];
    heap[parentIdx(childIdx)] = childValue;
  }

  int leftIdx(parentIdx) => parentIdx * 2 + 1;

  int rightIdx(parentIdx) => parentIdx * 2 + 2;

  int parentIdx(int childIdx) => math.max((childIdx - 1), 0) ~/ 2;

  bool isLeftChild(int idx) => leftIdx(idx) < size;

  bool isRightChild(int idx) => rightIdx(idx) < size;

  @override
  String toString() {
    return heap.toString();
  }
}
