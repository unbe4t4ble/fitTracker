import 'package:fit_tracker/config/size_config.dart';
import 'package:fit_tracker/provider/base_view.dart';
import 'package:fit_tracker/src/screens/details_screen/components/weight_operations.dart';
import 'package:fit_tracker/src/screens/details_screen/details_screen.dart';
import 'package:fit_tracker/src/screens/user_profile/user_profile.dart';
import 'package:fit_tracker/src/widgets/custom_bottom_nav_bar.dart';
import 'package:fit_tracker/view/main_screen_view_model.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/main-screen';
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<MainScreenViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Center(child: Text('Fit Tracker')),
            ),
            body: PageView(controller: model.pageController, children: const [
              DetailsScreen(),
              UserProfile(),
            ]),
            floatingActionButton: ElevatedButton(
              onPressed: () {
                WeightOperations.addWeight(context, model);
              },
              child: Text(
                'Add Weight',
                style: TextStyle(
                  fontSize: 18,
                  color: ThemeData().scaffoldBackgroundColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(10),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(model),
          );
        });
  }
}