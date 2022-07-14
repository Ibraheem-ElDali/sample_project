class Validators {
  Validators._();

  static final Validators instance = Validators._();

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'This field is empty!';
    } else if (value.length < 2) {
      return 'Name must be at least 2 letters';
    } else if (value.length > 30) {
      return 'Name must be at most 30 letters';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'This field is empty!';
    } else if (value.length < 6) {
      return 'Weak password!';
    }
    return null;
  }
}
