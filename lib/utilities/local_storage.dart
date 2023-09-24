part of 'utilities.dart';

class LocalStrorage {
  final box = GetStorage();

  void saveUser(UserModels user) {
    box.write('user', user);
  }

  void lsitUser(List<UserModels> user) {
    box.write('list_user', user);
  }

  getUserFromLocal() {
    return box.read('user');
  }

  getListUserFromLocal() {
    return box.read('list_user');
  }

  removeUserFromLocal() {
    box.remove('user');
  }
}
