import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_tracker/provider/base_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toast/gf_toast.dart';

class MainScreenViewModel extends BaseModel {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController addweightController = TextEditingController();
  int selectedIndex = 0;
  final PageController pageController = PageController();

  ///On tapping bottom nav bar items
  void onItemTapped(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    notifyListeners();
  }

  void save(BuildContext context) {
    if(addweightController.text.isNotEmpty){
      String? uid = auth.currentUser?.uid;

      if (uid != null) {
        db.collection('weights').doc(uid).collection("userWeights").add({
          'value': addweightController.text,
          'time': DateTime.now().millisecondsSinceEpoch,
          'docId': db
              .collection('weights')
              .doc(uid)
              .collection("userWeights")
              .doc()
              .id,
        });
      }
      addweightController.clear();
      
      Navigator.of(context).pop();
      GFToast.showToast("Weight added successfully", context);
    }else{
      GFToast.showToast("Weight can not empty", context);
    }
  }
}
