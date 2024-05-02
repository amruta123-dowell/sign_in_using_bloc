class Validators {
  static String? validateEmail(String text) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(text) !=
        true) {
      return "Invalid email format";
    }

    return null;
  }

  static String? validatePassword(String pass) {
    if (pass.length < 6) {
      return "check with password. Password length should be more than 6";
    }
    return null;
  }

  static String? validateField(String text) {
    if (text.isEmpty) {
      return "Empty textfield";
    } else {
      return null;
    }
  }
}
