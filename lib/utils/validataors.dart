class Validators {
  static String? validateEmail(String? text) {
    if (text != null) {
      if (text.isEmpty) {
        return "This field is required";
      }
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(text) !=
          true) {
        return "Invalid email format";
      }
    }
    return null;
  }

  static String? validatePassword(String pass) {
    if (pass.length < 6) {
      return "check with password. Password length should be more than 6";
    }
    return null;
  }
}
