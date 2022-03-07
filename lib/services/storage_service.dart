import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class StorageService {
  //kết nối với cloud và cloud_firebaseStore
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  //kết nối với cloud và cloud_firebaseStore

  Future<void> uploadImage(XFile image) async {
    await storage.ref("product_image/${image.name}").putFile(File(image.path));
  }

  Future<String> getDownloadUrl(String imageName) async {
    String downLoadUrl =
        await storage.ref("product_image/$imageName").getDownloadURL();
    return downLoadUrl;
  }
}
