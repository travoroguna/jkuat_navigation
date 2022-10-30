import 'package:jkuat_navigation/models/account.dart';
import 'package:jkuat_navigation/utilities/appconfig.dart';

class UserServices {
  String collection = "users";

  void registerUser(Account currentUser) {
    AppConfig.firebaseFiretore
        .collection(collection)
        .doc(currentUser.id)
        .set(currentUser.toMap());
  }

  void updateUserData(Map<String, dynamic> values) {
    AppConfig.firebaseFiretore
        .collection(collection)
        .doc(values['id'])
        .update(values);
  }

  Future<Account> getUserById(String id) => AppConfig.firebaseFiretore
          .collection(collection)
          .doc(id)
          .get()
          .then((doc) {
        return Account.fromMap(doc.data() as Map<dynamic, dynamic>);
      });
}
