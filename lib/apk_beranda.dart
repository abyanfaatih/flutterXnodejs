import 'package:flutter/material.dart';
import 'package:flutter_application_1/masyarakat_beranda.dart';
import 'package:flutter_application_1/masyarakat_buat.dart';
import 'package:get/get.dart';

class BerandaUtama extends StatefulWidget {
  const BerandaUtama({super.key});

  @override
  State<BerandaUtama> createState() => _BerandaUtamaState();
}

class _BerandaUtamaState extends State<BerandaUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const BerandaMasyarakat());
                  },
                  child: Container(
                    height: 132,
                    width: 132,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.purple.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Align(
                      alignment: Alignment.center, // Menempatkan teks di tengah
                      child: const Text('Masyarakat'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const BuatMasyarakat());
                  },
                  child: Container(
                    height: 132,
                    width: 132,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.purple.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Align(
                      alignment: Alignment.center, // Menempatkan teks di tengah
                      child: const Text('Buat Masyarakat'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
