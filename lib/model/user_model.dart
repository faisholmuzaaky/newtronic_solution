part of 'models.dart';

class UserModels {
  String? nama;
  String? username;
  String? email;
  String? password;
  String? imageUrl;

  UserModels({
    this.nama,
    this.imageUrl,
    this.username,
    this.email,
    this.password,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        nama: json['nama'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        imageUrl: json['imageUrl'],
      );

  toJson() {
    return {
      'nama': nama,
      'username': username,
      'email': email,
      'password': password,
      'imageUrl': imageUrl,
    };
  }
}

List<UserModels> listUserMock = [
  UserModels(nama: 'Agus', imageUrl: 'assets/Ellipse 3.png'),
  UserModels(nama: 'Barjo', imageUrl: 'assets/Ellipse 4.png'),
  UserModels(nama: 'Salim', imageUrl: 'assets/Profile.png'),
];
