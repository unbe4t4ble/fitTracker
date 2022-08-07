import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_tracker/provider/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';

class DetailsScreenViewModel extends BaseModel {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController editweightController = TextEditingController();

  void edit({required String docId, required BuildContext context}) {
    String? uid = auth.currentUser?.uid;
    if(editweightController.text.isNotEmpty){
      if (uid != null) {
        FirebaseFirestore.instance
            .collection('weights')
            .doc(uid)
            .collection('userWeights')
            .doc(docId)
            .update({'value': editweightController.text});
      }
      editweightController.clear();
      GFToast.showToast("Weight saved", context);
      Navigator.of(context).pop();
    }else{
      GFToast.showToast("Weight can not empty", context);
    }
  }

  ///Deleting sub-collection:
  void delete({required String docId}) {
    String? uid = auth.currentUser?.uid;

    if (uid != null) {
      FirebaseFirestore.instance
          .collection('weights')
          .doc(uid)
          .collection('userWeights')
          .doc(docId)
          .delete();
    }
  }

  bool checkWeight(int value, int beforeValue) {
    if (value < beforeValue) {
      return true;
    } else {
      return false;
    }
  }
}
