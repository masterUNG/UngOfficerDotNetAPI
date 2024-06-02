import 'package:dio/dio.dart';
import 'package:ungofficer/models/officer_model.dart';
import 'package:ungofficer/utility/app_constant.dart';

class AppService {
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
      print(e);
    }
    return officerModels;
  }
}
