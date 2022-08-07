import 'package:fit_tracker/config/size_config.dart';
import 'package:fit_tracker/src/models/weights_model.dart';
import 'package:fit_tracker/view/details_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'weight_operations.dart';

class ItemRow extends StatelessWidget {
  final bool isStart;
  final int weightBefore;
  final WeightsModel weights;
  final String id;
  final DetailsScreenViewModel model;
  const ItemRow(
      {Key? key, required this.isStart, required this.weightBefore, required this.weights, required this.id, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double change = double.parse(weights.value) - weightBefore;
    // print("Before : $weightBefore After : ${weights.value}");
    final bool goodWeight = model.checkWeight(int.parse(weights.value), weightBefore);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          height: getProportionateScreenHeight(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Icon(
                 isStart ? Icons.new_releases : goodWeight
                    ? Icons.arrow_downward_outlined
                    : Icons.arrow_upward_outlined,
                size: 20,
                color: goodWeight || isStart ? Colors.green : Colors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weights.value.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    DateFormat.MMMEd().add_jm().format(DateTime.fromMillisecondsSinceEpoch(weights.time)),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                isStart ? "" : goodWeight ? change.toString() : '+$change',
                style: TextStyle(
                    color: goodWeight || isStart ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(15)),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      WeightOperations.editWeight(context, model, id, weights.value);
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      //color: Color(0xff05293d),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      elevation: 0,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      WeightOperations.deleteWeight(context, model, id);
                    },
                    child: const Icon(
                      Icons.delete_forever_rounded,
                      size: 22,
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.grey,
                      shape: const CircleBorder(),
                      elevation: 0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
