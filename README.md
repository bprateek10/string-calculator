# String Calculator

This is a simple Ruby class `StringCalculator` that can perform calculations on a string of numbers. It supports the following features:

- Addition of numbers separated by commas (`,`) or new lines (`\n`).
- Custom delimiters can be defined at the start of the input string.
- Throws errors for negative numbers, displaying all negative numbers found.

## Installation

1. Make sure you have Ruby installed on your system.
2. Clone this repository:
   ```bash
   git clone https://github.com/bprateek10/string-calculator.git
   cd string-calculator
   ```

## Usage

### Basic Usage

```ruby
require_relative 'string_calculator'

calculator = StringCalculator.new

# Adding numbers separated by commas or new lines
calculator.add("1,2,3")       # Output: 6
calculator.add("1\n2,3")      # Output: 6
```

### Custom Delimiters

You can define a custom delimiter at the beginning of the input string:

```ruby
calculator.add("//;\n1;2")    # Output: 3
calculator.add("//|\n1|2|3")  # Output: 6
calculator.add("//***\n1***2***3")  # Output: 6
```

### Handling Negative Numbers

The calculator will throw an error if negative numbers are present:

```ruby
calculator.add("1,-2,3")     # Raises ArgumentError: Negative numbers not allowed: -2
calculator.add("//;\n1;-2;-3")  # Raises ArgumentError: Negative numbers not allowed: -2, -3
```

### Running Tests

To run the tests for the `StringCalculator` class, make sure you have `rspec` installed:

```bash
gem install rspec
```

Then, run the tests:

```bash
rspec
```
