import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_tracker/provider/base_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';

class LoginScreenViewModel extends BaseModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String userEmail = "";
  String userName = "";
  String userPassword = "";
  var isLogin = false;
  bool showPassword = false;

  var errormessage = "";
  
  final formKey = GlobalKey<FormState>();

  changePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  changeLoginType() {
    isLogin = !isLogin;
    notifyListeners();
  }

  Future<bool> trySubmit(BuildContext context) async {
    bool _isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_isValid) {
      formKey.currentState!.save();
      return submitAuthForm(
        userEmail.trim(),
        userPassword.trim(),
        userName.trim(),
        isLogin,
        context,
      );
    }
    return false;
  }

  Future<bool> submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential currentuser;
    try {
      if (isLogin) {
        currentuser = await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        GFToast.showToast(
          'Welcome Back.',
          ctx,
        );
        return true;
      } else {
        currentuser = await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);


        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentuser.user!.uid)
            .set({
          'name': username,
          'email': email,
          'gender':"",
          "birthday":"",
          "height":""
        });

        GFToast.showToast(
          'Welcome $username!',
          ctx,
        );
        return true;
      }
    } catch (err) {
      errormessage = err.toString();
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(errormessage),
          action: SnackBarAction(
            onPressed: () {},
            label: 'undo',
          ),
          backgroundColor: Colors.black,
        ),
      );
      return false;
    }
  }

}