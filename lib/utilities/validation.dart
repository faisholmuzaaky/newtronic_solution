part of 'utilities.dart';

class Validation {
  static validasiFullname(String fullname) {
    if (fullname.isEmpty) {
      return 'Bagian ini tidak boleh kosong';
    } else if (fullname.length < 3 || fullname.length > 50) {
      return 'Full name terdiri 3 sampai 50 chars';
    } else if (RegExp(r'[#?!@$%^&*-]').hasMatch(fullname) ||
        RegExp(r'[0-9]').hasMatch(fullname)) {
      return 'Full name hanya dapat diisi dengan text';
    } else {
      return null;
    }
  }

  static validasiUsername(String username) {
    if (username.isEmpty) {
      return 'Bagian ini tidak boleh kosong';
    }
    if (username.length < 6 || username.length > 12) {
      return 'Username terdiri 6 sampai 12 chars';
    }
    if (RegExp(r'\s').hasMatch(username)) {
      return 'Hanya boleh huruf dan angka';
    } else {
      return null;
    }
  }

  static validasiEmail(String email) {
    if (email.isEmpty) {
      return 'Bagian ini tidak boleh kosong';
    }
    if (!EmailValidator.validate(email)) {
      return 'Pastikan format email anda sudah benar';
    } else {
      return null;
    }
  }

  static validasiPassword(String password) {
    if (password.isEmpty) {
      return 'Bagian ini tidak boleh kosong';
    }
    if (password.length < 8) {
      return 'Password terdiri minimal 8 chars';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password harus mengandung huruf besar';
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password harus mengandung huruf kecil';
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password harus mengandung huruf besar';
    }
    if (!RegExp(r'[#?!@$%^&*-]').hasMatch(password)) {
      return 'Password harus mengandung spesial chars';
    } else {
      return null;
    }
  }
}
