class BalancedExpression {
  String expr;
  final _stack = [];
  final openingChar = ['(', '[', '{', '<'];
  final closingChar = [')', ']', '}', '>'];

  BalancedExpression(this.expr);

  bool isBalanced() {
    var arr = expr.split("").reversed.toList();
    while (arr.isNotEmpty) {
      var char = arr.removeLast();

      if (isLeftBracket(char)) _stack.add(char);

      if (isRightBracket(char)) {
        if (_stack.isEmpty) return false;
        var left = _stack.removeLast();
        if (!isBracketPair(left, char)) return false;
      }
    }
    return _stack.isEmpty;
  }

  bool isLeftBracket(String char) {
    return openingChar.contains(char);
  }

  bool isRightBracket(String char) {
    return closingChar.contains(char);
  }

  bool isBracketPair(left, right) {
    return (left == openingChar[closingChar.indexOf(right)]);
  }

  @override
  String toString() {
    return expr;
  }
}
