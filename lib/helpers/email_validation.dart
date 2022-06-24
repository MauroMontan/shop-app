class Validator {
  static String? email(String? value) {
    RegExp emailRegxp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return emailRegxp.hasMatch(value ?? "") ? null : "enter a valid email";
  }

  static String? password(String? value) =>
      value != null && value.length >= 6 ? null : "invalid password";
}
