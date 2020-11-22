import 'package:hello_word/exceptionUtil.dart';

class CPFInvalidCharacters extends GenericException {
  CPFInvalidCharacters(String cpf) {
    message = 'CPF ($cpf) contains invalid characters.';
  }
}

class CPFIncorrentLength extends GenericException {
  CPFIncorrentLength(String cpf) {
    message = 'CPF ($cpf) has too many or too little characters.';
  }
}

class CPFInvalidVerificationCode extends GenericException {
  CPFInvalidVerificationCode(String givenCode) {
    message = 'Wrong verification code ($givenCode).';
  }
}

bool validateCPF(String cpf, [bool throwEsceptions = true]) {
  try {
    cpf = cpf.replaceAll(RegExp(r'[.-]'), '');
    var pattern = RegExp(r'^[0-9]+$');
    var matched = pattern.hasMatch(cpf);
    if (!matched) throw CPFInvalidCharacters(cpf);
    if (cpf.length != 11) throw CPFIncorrentLength(cpf);
    var verificationDigits = cpf.substring(9);
    var rawCPF = cpf.substring(0, 9);
    rawCPF += calculateCPFdigit(rawCPF).toString();
    rawCPF += calculateCPFdigit(rawCPF).toString();
    var calculatedDigits = rawCPF.substring(9);
    if (verificationDigits != calculatedDigits) throw CPFInvalidVerificationCode(verificationDigits);
    return true;
  } on Exception {
    if (throwEsceptions) {
      rethrow;
      //throw new Exception('CPF ({cpf})')
    }
    return false;
  }
}

int calculateCPFdigit(String imcompleteCPF) {
  var digits = imcompleteCPF.split('').map((x) => int.parse(x)).toList();
  for (var i = 0; i < digits.length; i++) digits[i] *= digits.length + 1 - i;
  var total = digits.reduce((value, element) => value + element);
  var remainder = total % 11;
  return remainder < 2 ? 0 : 11 - remainder;
}
