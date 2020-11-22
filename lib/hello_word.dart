int factorial(int n) {
  if (n < 0) throw Exception('Cannot calculate factorial on a negative number');
  if (n == 0) return 1;
  var original = n;
  for (var i = 1; i < original; i++) n *= i;
  return n;
}

class Person {
  String Name;
  int _age;

  set Age(int a) {
    print('Setting age...');
    _age = a;
  }

  int get Age {
    return _age;
  }
}
