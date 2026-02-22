bool isValidEmail(String email) {
  final e = email.trim();
  final reg = RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
  return reg.hasMatch(e);
}

bool isStrongPassword(String password) {
  final p = password.trim();
  if (p.length < 8) return false;
  final hasLetter = RegExp(r'[A-Za-z]').hasMatch(p);
  final hasDigit = RegExp(r'\d').hasMatch(p);
  return hasLetter && hasDigit;
}
