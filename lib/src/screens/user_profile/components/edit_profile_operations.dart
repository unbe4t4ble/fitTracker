import 'package:fit_tracker/src/models/user_model.dart';
import 'package:fit_tracker/src/screens/user_profile/components/dialog_edit_profile.dart';
import 'package:fit_tracker/view/user_profile_view_model.dart';
import 'package:flutter/material.dart';

class EditProfileOperations {
  static void editProfile(BuildContext context, UserProfileViewModel model, UserModel user) {
    model.controllerName.text = user.name;
    model.controllerGender.text = user.gender;
    model.controllerBirthday.text = user.birthday;
    model.controllerHeight.text = user.height;

    showDialog(
        context: context,
        builder: (context) {
          return DialogEditProfile(
            title: 'Data Profile',
            descriptions: '',
            image: "assets/images/edit.png",
            controllerName: model.controllerName,
            controllerGender: model.controllerGender,
            controllerBirthday: model.controllerBirthday,
            controllerHeight: model.controllerHeight,
            buttonText: 'Save',
            press1: () async {
              model.edit(context: context);
            },
            press2: () {
              Navigator.of(context).pop();
            },
          );
        });
  }
}
