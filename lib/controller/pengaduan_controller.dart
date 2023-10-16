import 'dart:convert';
import 'package:flutter_application_1/models/pengaduan_models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as axios;

class PengaduanController extends GetxController {
  static final PengaduanController _instance =
      PengaduanController._internal();

  factory PengaduanController() {
    return _instance;
  }

  PengaduanController._internal();

  RxInt show = RxInt(0);
  RxBool isLoading = RxBool(false);

  RxList<PengaduanModels> listsatu = RxList<PengaduanModels>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value == true;
      var res = await axios.get(Uri.parse('http://localhost:5000/pengaduan'));

      if (res.statusCode == 200) {
        isLoading.value == false;
        final content = jsonDecode(res.body);

        for (Map<String, dynamic> i in content) {
          listsatu.add(PengaduanModels.fromJson(i));
          print(listsatu.length);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
