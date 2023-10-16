import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller/masyarakat_controller.dart';
import 'package:flutter_application_1/models/masyarakat_models.dart';

class EditMasyarakat extends StatefulWidget {
  final MasyarakatModels masyarakat; // Menerima objek MasyarakatModels yang akan diubah

  EditMasyarakat({Key? key, required this.masyarakat}) : super(key: key);

  @override
  _EditMasyarakatState createState() => _EditMasyarakatState();
}

class _EditMasyarakatState extends State<EditMasyarakat> {
  final MasyarakatController masyarakatController = MasyarakatController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController telpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    

    // Isi TextField dengan data yang ada
    nikController.text = widget.masyarakat.nik;
    namaController.text = widget.masyarakat.nama;
    usernameController.text = widget.masyarakat.username;
    passwordController.text = widget.masyarakat.password;
    telpController.text = widget.masyarakat.telp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Masyarakat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nikController,
              decoration: InputDecoration(labelText: 'NIK'),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: telpController,
              decoration: InputDecoration(labelText: 'Telepon'),
            ),
            ElevatedButton(
              onPressed: () {
                // Mengirim permintaan pembaruan ke server
                masyarakatController.editData(
                  widget.masyarakat.id, // ID masyarakat yang akan diubah
                  nikController.text,
                  namaController.text,
                  usernameController.text,
                  passwordController.text,
                  telpController.text,
                );
              },
              child: Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}