import 'package:fit_tracker/config/size_config.dart';
import 'package:fit_tracker/provider/base_view.dart';
import 'package:fit_tracker/src/component/login_form.dart';
import 'package:fit_tracker/view/login_screen_view_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login-screen';
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginScreenViewModel>(builder: (context, model, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(100),
            ),
            Text(
              'Welcome to Fit Tracker',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            LoginForm(
              model: model,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      );
    });
  }
}