// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ungofficer/utility/app_service.dart';

class ListOfficer extends StatefulWidget {
  const ListOfficer({super.key});

  @override
  State<ListOfficer> createState() => _ListOfficerState();
}

class _ListOfficerState extends State<ListOfficer> {
  @override
  void initState() {
    super.initState();

    // Test API
    // AppService().processReadAllData().then(
    //   (value) {
    //     print('ขนาดของ OfficerModels --> ${value.length}');
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Officer'),
      ),
      body: FutureBuilder(
        future: AppService().processReadAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List officerModels = snapshot.data!;
            return ListView.builder(
              itemCount: officerModels.length,
              itemBuilder: (context, index) => WidgetTextRich(
                head: 'Name',
                value: officerModels[index].name,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class WidgetTextRich extends StatelessWidget {
  const WidgetTextRich({
    Key? key,
    required this.head,
    required this.value,
  }) : super(key: key);

  final String head;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: head,
        style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: ' : ',
              style: TextStyle(color: Theme.of(context).primaryColor)),
          TextSpan(text: value, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal))
        ],
      ),
    );
  }
}
