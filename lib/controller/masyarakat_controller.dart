import 'dart:convert';
import 'package:flutter_application_1/models/masyarakat_models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as axios;

class MasyarakatController extends GetxController {
  static final MasyarakatController _instance =
      MasyarakatController._internal();

  factory MasyarakatController() {
    return _instance;
  }

  MasyarakatController._internal();

  RxInt show = RxInt(0);
  RxBool isLoading = RxBool(false);

  RxList<MasyarakatModels> listmasyarakat = RxList<MasyarakatModels>([]);

  get value => null;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      listmasyarakat.value.clear();
      isLoading.value == true;
      var res = await axios.get(Uri.parse('http://localhost:5000/masyarakat'));

      if (res.statusCode == 200) {
        isLoading.value == false;
        final content = jsonDecode(res.body);

        for (Map<String, dynamic> i in content) {
          listmasyarakat.add(MasyarakatModels.fromJson(i));
          print(listmasyarakat.length);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  createData(String nik, String nama, String username, String password,
      String telp) async {
    try {
      isLoading.value = true;
      var response = await axios.post(
        Uri.parse("http://localhost:5000/masyarakat"),
        body: jsonEncode({
          "nik": nik,
          "nama": nama,
          "username": username,
          "password": password,
          "telp": telp,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      isLoading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil dibuat");
      } else {
        print("Gagal membuat data. Status code: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  editData(String id, String nik, String nama, String username, String password, String telp) async {
    try {
      isLoading.value = true;
      var response = await axios.put(
        Uri.parse("http://localhost:5000/masyarakat/$id"), // URL untuk mengedit data sesuai dengan ID
        body: jsonEncode({
          "nik": nik,
          "nama": nama,
          "username": username,
          "password": password,
          "telp": telp,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      isLoading.value = false;

      if (response.statusCode == 200) {
        print("Data berhasil diubah");
        getData(); // Memuat ulang data setelah pengeditan
      } else {
        print("Gagal mengubah data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
