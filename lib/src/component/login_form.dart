import 'package:fit_tracker/src/screens/main_screen/main_screen.dart';
import 'package:fit_tracker/view/login_screen_view_model.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final LoginScreenViewModel model;
  const LoginForm({ Key? key, required this.model }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: widget.model.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    onSaved: (value) {
                      widget.model.userEmail = value as String;
                    },
                  ),
                  if (!widget.model.isLogin)
                    TextFormField(
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value == null || value.length <= 3) {
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      onSaved: (value) {
                        widget.model.userName = value as String;
                      },
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be atleast 7 characters';
                      }
                      return null;
                    },
                    obscureText: !widget.model.showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          widget.model.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          widget.model.changePasswordVisibility();
                        },
                      ),
                    ),
                    onSaved: (value) {
                      widget.model.userPassword = value as String;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (isLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        bool isSuccess = await widget.model.trySubmit(context);
                        if (isSuccess) {
                          Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: Text(
                        widget.model.isLogin ? 'Login' : 'Signup',
                      ),
                    ),
                  if (!isLoading)
                    TextButton(
                      onPressed: () {
                        widget.model.changeLoginType();
                      },
                      child: Text(
                        widget.model.isLogin
                            ? 'Create New Account'
                            : 'I already have an account',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}