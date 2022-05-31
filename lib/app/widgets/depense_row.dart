import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects/app/models/recent_calcul_model.dart';

class DepenseWidget extends StatelessWidget {
  const DepenseWidget({Key? key, required RecentCalculModel item})
      : _item = item,
        super(key: key);

  final RecentCalculModel _item;

  @override
  Widget build(BuildContext context) {
    DateFormat dateformat = DateFormat("d MMMM y");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_item.label,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Text(
          Intl.withLocale('fr', () => dateformat.format(_item.date)),
          style: TextStyle(fontSize: 10),
        ),
        Text(
          _item.result.toString(),
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: -2),
        )
      ],
    );
  }
}
