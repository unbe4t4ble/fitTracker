import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_tracker/provider/base_model.dart';
import 'package:fit_tracker/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';

class UserProfileViewModel extends BaseModel {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late UserModel user;
  bool isLoaded = false;
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerGender = TextEditingController();
  final TextEditingController controllerBirthday = TextEditingController();
  final TextEditingController controllerHeight = TextEditingController();

  init(BuildContext context) async {
    String? uid = auth.currentUser?.uid;
    var data = await db.collection('users').doc(uid).get();

    user = userModelFromJson(data.data());
    isLoaded = true;
    notifyListeners();
  }

  void signOut() async {
    await auth.signOut();
  }

  void edit({required BuildContext context}) async {
    String? uid = auth.currentUser?.uid;

    if(controllerName.text.isEmpty){
      GFToast.showToast("Name can not empty", context);
      return;
    }

    await db.collection('users')
    .doc(uid)
    .update(
      {
        'name': controllerName.text.trim(),
        'gender': controllerGender.text.trim(),
        "birthday": controllerBirthday.text.trim(),
        "height": controllerHeight.text.trim()
      }
    );

    GFToast.showToast("Profile saved", context);
    Navigator.of(context).pop();

  }

  void deleteAccount() async {
    String? uid = auth.currentUser?.uid;
    await db.collection('users').doc(uid).delete();
  }

  void changeDetails() {}

  void changeTheme() {
    notifyListeners();
  }
}
