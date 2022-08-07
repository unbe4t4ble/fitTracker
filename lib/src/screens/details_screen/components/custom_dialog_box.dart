import 'package:fit_tracker/constant/constant.dart';
import 'package:flutter/material.dart';
import 'input_field.dart';

class CustomDialogBox extends StatelessWidget {
  final String? title, descriptions, image, buttonText, buttonText2;
  final VoidCallback? press1, press2;
  final TextEditingController? controller;
  const CustomDialogBox(
      {Key? key,
      this.title,
      this.descriptions,
      this.press1,
      this.press2,
      this.image,
      this.controller,
      this.buttonText,
      this.buttonText2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: Constants.padding,
            top: Constants.padding + 30,
            right: Constants.padding,
            bottom: Constants.padding,
          ),
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title!,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                descriptions!,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              controller != null
                  ? inputField(context, controller!)
                  : const SizedBox(),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: press2 != null
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  press2 != null
                      ? OutlinedButton(
                          onPressed: press2,
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                        ),
                  ElevatedButton(
                    onPressed: press1,
                    child: Text(
                      buttonText!,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
