import 'package:test/test.dart';
import 'package:fire_math/fire_math.dart';

void main() {
  test('savings rate', () {
    expect(savingsRate(income: 9000, spending: 5400), closeTo(0.4, 1e-9));
  });

  test('initial withdrawal under the rule', () {
    expect(initialWithdrawal(portfolio: 1000000), 40000.0);
  });

  test('survival years at constant real spending', () {
    expect(survivalYears(portfolio: 1000000, annualSpending: 40000), 25.0);
    expect(survivalYears(portfolio: 1000000, annualSpending: 40000, realReturn: 0.04), 120.0);
  });
}
