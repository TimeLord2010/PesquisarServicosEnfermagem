import 'package:hello_word/registerUser.dart';
import 'package:test/test.dart';

class CPFverifier {
  String originalCPF;
  bool isValid;
  CPFverifier(String original, bool valid) {
    originalCPF = original;
    isValid = valid;
  }
}

void main() {
  test('CPF validation', () {
    var cpfs = [
      CPFverifier('033.380.952-10', true),
      CPFverifier('870.957.127-27', true),
      CPFverifier('870.957.127-28', false),
      CPFverifier('634.417.235-52', false),
    ];
    for (var verifier in cpfs) {
      expect(validateCPF(verifier.originalCPF, false), verifier.isValid);
    }
  });
}
