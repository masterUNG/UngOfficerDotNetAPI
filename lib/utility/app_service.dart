// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:ungofficer/models/officer_model.dart';
import 'package:ungofficer/utility/app_constant.dart';

class AppService {
  Future<void> processAddNewOfficer({
    required String name,
    required String surName,
    required String position,
  }) async {
    print('name ===> $name');
    print('surName ===> $surName');
    print('position ===> $position');

    Map<String, dynamic> map = {};
    map['id'] = 0;
    map['name'] = name;
    map['surname'] = surName;
    map['position'] = position;

    print('map --> $map');

    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';

    await dio.post(AppConstant.urlAPI, data: map).then(
      (value) {
        print('Add New Data Success');
      },
    );
  }

  Future<List<OfficerModel>> processReadAllData() async {
    var officerModels = <OfficerModel>[];
    try {
      var result = await Dio().get(AppConstant.urlAPI);
      print('result ===> $result');

      for (var element in result.data) {
        OfficerModel officerModel = OfficerModel.fromMap(element);
        officerModels.add(officerModel);
      }
    } on Exception catch (e) {
      print('Have Error ----> $e');
    }
    return officerModels;
  }
}
