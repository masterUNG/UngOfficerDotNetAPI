// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ungofficer/utility/app_dialog.dart';
import 'package:ungofficer/utility/app_service.dart';
import 'package:ungofficer/widgets/widget_button.dart';
import 'package:ungofficer/widgets/widget_form.dart';
import 'package:ungofficer/widgets/widget_image_assets.dart';
import 'package:ungofficer/widgets/widget_text_rich.dart';

class ListOfficer extends StatefulWidget {
  const ListOfficer({super.key});

  @override
  State<ListOfficer> createState() => _ListOfficerState();
}

class _ListOfficerState extends State<ListOfficer> {
  final keyForm = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: officerModels.length,
              itemBuilder: (context, index) => Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.5,
                  children: <Widget>[
                    SlidableAction(
                      onPressed: (context) {},
                      label: 'Edit',
                      icon: Icons.edit,
                      backgroundColor: Colors.blue.shade700,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        AppDialog().normalDialog(
                            title: 'Confirm Delete',
                            icon: const WidgetImageAssets(
                                name: 'images/office2.png', width: 200),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Delete :',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                WidgetTextRich(
                                    head: 'Name',
                                    value: officerModels[index].name),
                                WidgetTextRich(
                                    head: 'Surname',
                                    value: officerModels[index].surname),
                                WidgetTextRich(
                                    head: 'Position',
                                    value: officerModels[index].position),
                                Text(
                                  'Please Confirm For Delete',
                                  style: TextStyle(color: Colors.red.shade700),
                                ),
                              ],
                            ),
                            firstAction: WidgetButton(
                              text: 'Confirm',
                              onPressed: () {},
                            ));
                      },
                      label: 'Delete',
                      icon: Icons.delete_forever,
                      backgroundColor: Colors.red.shade700,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: WidgetTextRich(
                              head: 'Name', value: officerModels[index].name),
                        ),
                        Expanded(
                          flex: 1,
                          child: WidgetTextRich(
                              head: 'Surname',
                              value: officerModels[index].surname),
                        ),
                      ],
                    ),
                    WidgetTextRich(
                        head: 'Position', value: officerModels[index].position),
                    const Divider(),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: WidgetButton(
        text: 'Add New Officer',
        onPressed: () {
          AppDialog().normalDialog(
            title: 'Add New Officer',
            icon: const WidgetImageAssets(name: 'images/office1.png'),
            content: Form(
              key: keyForm,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetForm(
                    controller: nameController,
                    validator: (p0) {
                      if (p0?.isEmpty ?? true) {
                        return 'Please Fill Name';
                      } else {
                        return null;
                      }
                    },
                    labelText: 'Name :',
                  ),
                  const SizedBox(height: 8),
                  WidgetForm(
                    controller: surNameController,
                    validator: (p0) {
                      if (p0?.isEmpty ?? true) {
                        return 'Please Fill Surname';
                      } else {
                        return null;
                      }
                    },
                    labelText: 'SurName :',
                  ),
                  const SizedBox(height: 8),
                  WidgetForm(
                    controller: positionController,
                    validator: (p0) {
                      if (p0?.isEmpty ?? true) {
                        return 'Please Fill Position';
                      } else {
                        return null;
                      }
                    },
                    labelText: 'Position :',
                  ),
                ],
              ),
            ),
            firstAction: WidgetButton(
              text: 'Add New Officer',
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  String name = nameController.text;
                  String surName = surNameController.text;
                  String position = positionController.text;

                  AppService()
                      .processAddNewOfficer(
                          name: name, surName: surName, position: position)
                      .then(
                    (value) {
                      nameController.clear();
                      surNameController.clear();
                      positionController.clear();

                      Get.back();
                      setState(() {});
                    },
                  );
                }
              },
            ),
          );
        },
        type: GFButtonType.solid,
      ),
    );
  }
}
