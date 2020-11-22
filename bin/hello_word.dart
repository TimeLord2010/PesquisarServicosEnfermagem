import 'package:hello_word/hello_word.dart' as hello_word;

void main(List<String> arguments) {
  var nome = "Vinícius Gabriel";
  nome = nome.replaceAll(r'[a-c]', '@');
  print('Novo nome é $nome');
  var person = hello_word.Person();
  person.Name = 'Vinícius';
  person.Age = 23;
  print('Person is: ${person}');
}
