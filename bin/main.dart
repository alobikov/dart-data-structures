import './balanced_expression.dart';

void main() {

final expr1= '(<e> + [33])';
var expr= BalancedExpression('(123 (q)+1[],.<..>)');

print(expr);
print(expr.isBalanced());
}
