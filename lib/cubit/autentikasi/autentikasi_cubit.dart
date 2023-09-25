import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:newtronic_solution/model/models.dart';
import 'package:newtronic_solution/utilities/utilities.dart';

part 'autentikasi_state.dart';

class AutentikasiCubit extends Cubit<AutentikasiState> {
  AutentikasiCubit() : super(AutentikasiInitial());

  List<UserModels> listUser = [];

  signUp({
    required UserModels user,
  }) async {
    emit(AutentikasiLoading());
    await Future.delayed(const Duration(seconds: 2));
    final data = await LocalStrorage().getListUserFromLocal();
    if (data != null) {
      listUser = (data as List<dynamic>)
          .map(
            (datauser) => UserModels.fromJson(datauser),
          )
          .toList();
      final index = listUser.indexWhere((element) =>
          element.email!.toLowerCase() == user.email!.toLowerCase());

      if (index == -1) {
        listUser.add(user);
        LocalStrorage().lsitUser(listUser);
        LocalStrorage().saveUser(user);
        emit(AutentikasiBerhasil(user));
      } else {
        emit(AutentikasiPendaftaranGagal('Email sudah terdaftar'));
      }
    } else {
      listUser.add(user);
      LocalStrorage().lsitUser(listUser);
      LocalStrorage().saveUser(user);
      emit(AutentikasiBerhasil(user));
    }
  }

  login({required String email, required String password}) async {
    final data = await LocalStrorage().getListUserFromLocal();
    emit(AutentikasiLoading());
    await Future.delayed(const Duration(seconds: 2));
    if (data != null) {
      final index = data.indexWhere(
          (element) => element['email'].toLowerCase() == email.toLowerCase());
      if (index != -1) {
        final isPassword = data[index]['password'] == password;
        if (isPassword) {
          final user = UserModels.fromJson(data[index]);
          LocalStrorage().saveUser(user);
          emit(AutentikasiBerhasil(user));
        } else {
          emit(AutentikasiLoginGagal('Credential tidak sesuai'));
        }
      } else {
        emit(AutentikasiLoginGagal('Account not registered'));
      }
    } else {
      emit(AutentikasiLoginGagal('Account not registered'));
    }
  }

  cekLogin() async {
    try {
      final data = await LocalStrorage().getUserFromLocal();
      UserModels user = UserModels.fromJson(data);
      emit(AutentikasiBerhasil(user));
    } catch (e) {
      emit(AutentikasiGagal('Pengguna tidak ditemukan'));
    }
  }

  logout() {
    listUser.clear();
    LocalStrorage().removeUserFromLocal();
    emit(AutentikasiInitial());
  }
}
