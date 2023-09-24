part of 'autentikasi_cubit.dart';

@immutable
sealed class AutentikasiState {}

final class AutentikasiInitial extends AutentikasiState {}

class AutentikasiLoading extends AutentikasiState {}

class AutentikasiBerhasil extends AutentikasiState {
  final UserModels user;
  AutentikasiBerhasil(this.user);
}

class AutentikasiLoginGagal extends AutentikasiState {
  final String pesan;
  AutentikasiLoginGagal(this.pesan);
}

class AutentikasiPendaftaranGagal extends AutentikasiState {
  final String pesan;
  AutentikasiPendaftaranGagal(this.pesan);
}

class AutentikasiGagal extends AutentikasiState {
  final String pesan;
  AutentikasiGagal(this.pesan);
}
