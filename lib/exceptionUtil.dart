class GenericException implements Exception {
  String message;
  // set message(String m) {
  //   _message = m;
  // }

  @override
  String toString() {
    return message;
  }
}
