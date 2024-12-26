class Validators {
  Validators._();

  static String? textValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  static String? emailValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    if (!value.contains('.')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? passwordValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? mobileNumberValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a mobile number';
    }
    if (value.length != 10) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  static String? selectValidate(value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option';
    }
    return null;
  }
}
