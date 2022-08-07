import 'package:fit_tracker/config/size_config.dart';
import 'package:fit_tracker/src/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final controller = PageController(
    viewportFraction: 0.9,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Text(
                    'Fit Tracker ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(30)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(35),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName);
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(135),
                      vertical: getProportionateScreenHeight(13),
                    ),
                    shape: const StadiumBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
