import 'package:form_field_validator/form_field_validator.dart';
import 'package:vocapp/test/test.dart';

import 'modules/book.dart';

final nameValidator = RequiredValidator(errorText: 'Name is required');

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: 'Email is not valid')
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'Password length must be minimum 8'),
]);

bool chapterNameValidator(Book book, String? value) {
  bool _nameValidated = false;
  if (value == null) {
    print("Error: chapter name cannot be empty!");
    return _nameValidated;
  }

  final chapterExists = book.chapters.containsKey(value);
    if (chapterExists) {
      print("Error: chapter with the same name already exists!");
      _nameValidated = false;
    }
    else {
      _nameValidated = true;
    }
  return _nameValidated;
}
