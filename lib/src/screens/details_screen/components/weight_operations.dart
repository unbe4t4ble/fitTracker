import 'package:fit_tracker/view/details_screen_view_model.dart';
import 'package:fit_tracker/view/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'custom_dialog_box.dart';

class WeightOperations {
  static void addWeight(BuildContext context, MainScreenViewModel model) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomDialogBox(
            title: 'Add new weight',
            descriptions: '',
            image: "assets/images/add.png",
            controller: model.addweightController,
            buttonText: 'Add',
            press1: () async {
              model.save(context);
            },
          );
        });
  }

  static void editWeight(BuildContext context, DetailsScreenViewModel model, String docId, String value) {
    model.editweightController.text = value;
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialogBox(
            title: 'Edit weight',
            descriptions: 'Lose weight & keep fit',
            image: "assets/images/edit.png",
            controller: model.editweightController,
            buttonText: 'Save',
            press1: () async {
              model.edit(docId: docId, context: context);
              Navigator.of(context).pop();
            },
            press2: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  static void deleteWeight(
      BuildContext context, DetailsScreenViewModel model, String docId) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialogBox(
            title: 'Delete weight?',
            descriptions: 'This entry will be permanently deleted!',
            image: "assets/images/delete.png",
            buttonText: 'Delete',
            press1: () async {
              model.delete(docId: docId);
              Navigator.of(context).pop();
              GFToast.showToast("Weight deleted", context);
            },
            press2: () {
              Navigator.of(context).pop();
            },
          );
        });
  }
}
