import 'dart:math' as math;
import 'dart:core';

class Heap {
  var heap = List.filled(15,0);
  int size = 0;

  void insert(int value) {
    heap[size++]=value;
    bubbleUp(size-1);
  }

  bool remove() {
    if (size == 0) return false;
    heap[0] = heap[size-1];
    heap[size-1] = 0;
    size--;
    bubbleDown(0);
    return true;
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
      return ;
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
