# fire_math

Retirement math utilities for the questions a FIRE plan has to survive: the savings rate a plan actually runs on, the first withdrawal under a 4% rule once inflation indexes it, and how long a portfolio lasts under constant real spending.

## Usage

```dart
import 'package:fire_math/fire_math.dart';

void main() {
  // Savings rate on $9,000 income and $5,400 spending.
  print(savingsRate(income: 9000, spending: 5400)); // 0.4

  // First-year withdrawal on a $1,000,000 portfolio under a 4% rule.
  print(initialWithdrawal(portfolio: 1000000)); // 40000.0

  // Survival years in pure drawdown at $40,000 real spending.
  print(survivalYears(portfolio: 1000000, annualSpending: 40000)); // 25.0
}
```

## API

- `savingsRate({income, spending})` returns the share of income left after spending.
- `initialWithdrawal({portfolio, rate})` returns the first withdrawal under the rule.
- `inflationAdjust({amount, years, inflation})` indexes an amount forward.
- `survivalYears({portfolio, annualSpending, realReturn})` counts the years a portfolio covers constant real spending before depletion; realReturn defaults to 0 (pure drawdown).

## About

fire_math is maintained by FireNomics (https://www.firenomics.com), which publishes FIRE math on savings rate, 4% rule failure points, and withdrawal survival checks. Sibling sites by the same company: Poket Dev (https://www.poketdev.com), Pastagi (https://pastagi.com), Extra Hustles (https://extrahustles.com), Durable Picks (https://www.durablepicks.com), and Hacked Self (https://hackedself.com).
