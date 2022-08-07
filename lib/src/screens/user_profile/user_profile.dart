import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:fit_tracker/provider/base_view.dart';
import 'package:fit_tracker/src/screens/login_screen/login_screen.dart';
import 'package:fit_tracker/src/screens/user_profile/components/edit_profile_operations.dart';
import 'package:fit_tracker/view/user_profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';

class UserProfile extends StatelessWidget {

  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<UserProfileViewModel>(
        onModelReady: (model) => {
              model.init(context),
            },
        builder: (context, model, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: model.isLoaded
                  ? ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text("Account", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                        ),
                       Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text("Name", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                                  child: Text(model.user.name, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                                ),

                                const Text("Gender", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                                  child: Text(model.user.gender, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                                ),

                                const Text("Birthday", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                                  child: Text(model.user.birthday, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                                ),

                                const Text("Height", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                                  child: Text(model.user.height, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        // You can add a settings title
                        SettingsGroup(
                          settingsGroupTitle: "",
                          items: [
                            SettingsItem(
                              onTap: () {
                                EditProfileOperations.editProfile(context, model, model.user);
                              },
                              icons: Icons.edit,
                              title: "Modify",
                              titleStyle: const TextStyle(
                                color: Color.fromARGB(255, 227, 205, 4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SettingsItem(
                              onTap: () {
                                model.signOut();
                                GFToast.showToast("Signout Success", context);
                                Navigator.of(context).pushNamed(LoginScreen.routeName);
                              },
                              icons: Icons.exit_to_app_rounded,
                              title: "Sign Out",
                            ),
                            SettingsItem(
                              onTap: () {
                                model.deleteAccount();
                                GFToast.showToast("User Account Deleted", context);
                                Navigator.of(context).pushNamed(LoginScreen.routeName);
                              },
                              icons: CupertinoIcons.delete_solid,
                              title: "Delete account",
                              titleStyle: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        });
  }
}
