import 'package:flutter/material.dart';
import 'package:projects/app/models/recent_calcul_model.dart';
import 'package:projects/app/widgets/depense_row.dart';

class CalculHistoryDetailsScreen extends StatelessWidget {
  const CalculHistoryDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;

    RecentCalculModel? element;

    if (argument != null) {
      element = argument as RecentCalculModel;
    }

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        element != null
            ? Center(child: DepenseWidget(item: element))
            : const Center(child: Text("Pas de données")),
      ],
    ));
  }
}
