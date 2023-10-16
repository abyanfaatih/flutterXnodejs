import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/controller/masyarakat_controller.dart';
import 'package:flutter_application_1/masyarakat_beranda.dart';

class BuatMasyarakat extends StatefulWidget {
  const BuatMasyarakat({super.key});

  @override
  State<BuatMasyarakat> createState() => _BuatMasyarakatState();
}

class _BuatMasyarakatState extends State<BuatMasyarakat> {
  final MasyarakatController masyarakatController = MasyarakatController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController telpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buat Masyarakat'),
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
              onPressed: () async {
                await masyarakatController.createData(
                  nikController.text,
                  namaController.text,
                  usernameController.text,
                  passwordController.text,
                  telpController.text,
                );
                Navigator.of(context).pop(); // Kembali ke halaman sebelumnya (biasanya beranda)
              },
              child: Text('Simpan'),
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     masyarakatController.createData(
            //       nikController.text,
            //       namaController.text,
            //       usernameController.text,
            //       passwordController.text,
            //       telpController.text,
            //     );
            //   },
            //   child: Text('Simpan'),
            // ),
          ],
        ),
      ),
        // Container(
        //   margin: const EdgeInsets.only(top: 52),
        //   padding: const EdgeInsets.only(left: 32, right: 32),
        //   child: const Center(
        //     child: Column(
        //       children: [
        //         TextField(
        //           decoration: InputDecoration(hintText: 'masukan Nama'),
        //         ),
        //         SizedBox(
        //           height: 32,
        //         ),
        //         TextField(
        //           decoration: InputDecoration(hintText: 'masukan Username'),
        //         ),
        //         SizedBox(
        //           height: 32,
        //         ),
        //         TextField(
        //           decoration: InputDecoration(hintText: 'masukan Password'),
        //         ),
        //         SizedBox(
        //           height: 32,
        //         ),
        //         TextField(
        //           decoration: InputDecoration(hintText: 'masukan NIK'),
        //         ),
        //         SizedBox(
        //           height: 32,
        //         ),
        //         TextField(
        //           decoration: InputDecoration(hintText: 'masukan Nomor telepon'),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
    );
  }
}
