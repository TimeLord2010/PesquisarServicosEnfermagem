import 'package:hello_word/cpfUtil.dart';
import 'package:hello_word/exceptionUtil.dart';

class InvalidPhoneNumber extends GenericException {
  InvalidPhoneNumber(String phoneNumber) {
    message = 'Phone number ($phoneNumber) is not valid.';
  }
}

abstract class Authentication {
  String email;
  Future<bool> validate();
}

class LocalAuthentication extends Authentication {
  String password;
  String givenPassword;
  Future<bool> validate() {
    return Future.value(password == givenPassword);
  }
}

abstract class User {
  String _name;

  set name(String n) {
    n = n.trim();
    n = n.replaceAll(RegExp('[ ]+'), ' ');
    var names = n.split(' ');
    if (names.length < 2) throw Exception('The name given should contrain the first name and last name.');
    if (n.length < 7) throw Exception('The name given is too short.');
    _name = n;
  }

  String get name {
    return _name;
  }

  String _cpf;

  set cpf(String c) {
    validateCPF(c);
    _cpf = c;
  }

  String get cpf {
    return _cpf;
  }

  String _phoneNumber;

  set phoneNumber(String pn) {
    pn = pn.replaceAll(' ', '');
    var p = RegExp(r'^(+?55)?[0-9]{4}-?[0-9]{4}$');
    if (!p.hasMatch(pn)) throw InvalidPhoneNumber(pn);
    _phoneNumber = pn;
  }

  String get phoneNumber {
    return _phoneNumber;
  }

  Authentication autentication;

  void login();
  void register();
}

class ClientUser extends User {}

class Education {
  String institution;
  int year;
  String type; // especialidade, bacharel, ...
}

class JobHistory {
  String local;
  int year;
  String title;
}

class ServicesPrices {
  String service;
  double price;
}

class Nurse extends User {
  bool isTechnician;
  List<Education> education;
  List<JobHistory> jobHistory;
  List<String> convenios;
  double reputation;
  List<ServicesPrices> servicesAvaliable;
  String bio;
}

enum SupportPermissions { BanUsers, SuspendUser, InterveneInConflicts, AccountRecuperation }

enum AdminPermissions {
  BanAdmins,
  SuspendAdmin,
}

class TechSupport extends User {
  bool hasTwoFactorAuthentication;
  List<SupportPermissions> supportPermissions;
}

class Administrator extends TechSupport {
  bool hasTwoFactorAuthentication;
  List<AdminPermissions> adminPermissions;
}
