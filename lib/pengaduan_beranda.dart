import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/pengaduan_controller.dart';
import 'package:flutter_application_1/pengaduan_isi.dart';
import 'package:get/get.dart';

class BerandaPengaduan extends StatefulWidget {
  const BerandaPengaduan({super.key});

  @override
  State<BerandaPengaduan> createState() => _BerandaPengaduanState();
}

class _BerandaPengaduanState extends State<BerandaPengaduan> {
  @override
  Widget build(BuildContext context) {
    PengaduanController pengaduan = Get.put(PengaduanController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Obx(() {
          if (pengaduan.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: pengaduan.listsatu.length,
              itemBuilder: (context, index) {
                final model = pengaduan.listsatu[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${model.status}',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                  title: TextButton(
                      child: Text(
                        "${model.tglPengaduan}",
                        textAlign: TextAlign.start,
                      ),
                      onPressed: () {
                        pengaduan.show.value = index;
                        Get.to(const Isipengaduan());
                      }),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${model.isiLaporan}')
                      // if (model.posts != null)
                      //   for (var post in model.posts!) Text('${post.title}')
                    ],
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
