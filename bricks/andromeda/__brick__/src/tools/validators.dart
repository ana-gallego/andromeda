final RegExp _emailRegExp = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);
String? validateEmail(String? email, {String? customError}) {
  if (customError != null) return customError;

  if ((email ?? "").isEmpty) {
    return 'Email is required';
  } else if (!_emailRegExp.hasMatch((email ?? "").trim())) {
    return 'Please enter a valid email';
  }
  return null;
}

String? noValidate() {
  return null;
}

String? validatePassword(input) {
  if (input.trim().length < 6) {
    return 'The password must be at least 6 characters';
  }

  return null;
}

String? validatePasswordRepeat(input, repeat) {
  if (input.trim().length < 6) {
    return 'The password must be at least 6 characters';
  }
  if (input != repeat) {
    return 'Passwords do not match';
  }

  return null;
}

String? validateText(String? input) {
  if ((input ?? "").isEmpty) {
    return 'This field is required';
  } else {
    String pattern = r'^[a-zA-Z\s]*$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch((input ?? ""))) {
      return 'Enter a valid text';
    }
    return null;
  }
}

String? validateTextWithPunctuation(String? input) {
  if ((input ?? "").isEmpty) {
    return 'This field is required';
  } else {
    String pattern = r'^[a-zA-Z\s\.,;:!?()]*$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch((input ?? ""))) {
      return 'Enter a valid text';
    }
    return null;
  }
}

String? validatePhone(String? input) {
  String pattern = r'^(?:[+0][1-9])?[0-9]{7,20}$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch((input ?? ""))) {
    return 'Enter a valid phone';
  }
  return null;
}

String? validateDocument(input) {
  String pattern = r'^[0-9]+$';
  RegExp regExp = RegExp(pattern);

  if (input.trim().length < 6 || !regExp.hasMatch(input)) {
    return 'Please enter a valid value';
  } else {
    return null;
  }
}
