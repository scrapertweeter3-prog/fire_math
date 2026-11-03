/// Retirement math utilities: savings rate, an inflation-indexed 4%
/// withdrawal, and constant-real-spending survival years.
library;

/// Share of income left after spending. A 40% savings rate on $9,000
/// income and $5,400 spending returns 0.4.
double savingsRate({required double income, required double spending}) {
  return (income - spending) / income;
}

/// First withdrawal under the rule: [portfolio] times [rate] (default 4%).
double initialWithdrawal({required double portfolio, double rate = 0.04}) {
  return portfolio * rate;
}

/// [amount] indexed forward [years] years at [inflation] a year.
double inflationAdjust({
  required double amount,
  required int years,
  double inflation = 0.03})
{
  var v = amount;
  for (var i = 0; i < years; i++) {
    v *= 1 + inflation;
  }
  return v;
}

/// Years a [portfolio] covers constant real [annualSpending] before it
/// depletes. [realReturn] credits growth each year and defaults to 0:
/// the pure-drawdown survival check. A portfolio drawing exactly its
/// real return never depletes.
double survivalYears({
  required double portfolio,
  required double annualSpending,
  double realReturn = 0.0})
{
  var balance = portfolio;
  var years = 0.0;
  while (balance > 0 && years < 120) {
    balance = balance * (1 + realReturn) - annualSpending;
    years += 1;
  }
  return years;
}
