import 'package:delivery_app/exports.dart';

class FirebaseHelper {
  static Future<String> getImageUrl(String fileName) async {
    final ref = FirebaseStorage.instance.ref().child(fileName);
    return await ref.getDownloadURL();
  }
}
