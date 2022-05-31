import 'package:flutter/material.dart';
import 'package:projects/app/models/recent_calcul_model.dart';
import 'package:projects/app/widgets/depense_row.dart';

class CalculHistoryScreen extends StatelessWidget {
  CalculHistoryScreen({Key? key}) : super(key: key);

  final List<RecentCalculModel> _items = [
    RecentCalculModel("Course", 12.5, DateTime.now()),
    RecentCalculModel("Essence", 95.6, DateTime.now()),
    RecentCalculModel("École", 8000, DateTime.now()),
    RecentCalculModel("École", 8000, DateTime.now()),
    RecentCalculModel("Pizza", 18, DateTime.now()),
    RecentCalculModel("Souris", 74.99, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculs récents",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Image.asset(
                'assets/images/splashIcon.png',
              ),
              onPressed: () => {Navigator.pop(context)},
            ),
          )
        ],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: DepenseWidget(item: _items[index]),
          );
        },
      ),
    );
  }
}
