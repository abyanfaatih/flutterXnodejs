import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/masyarakat_controller.dart';
import 'package:flutter_application_1/masyarakat_buat.dart';
import 'package:get/get.dart';

class BerandaMasyarakat extends StatelessWidget {
  const BerandaMasyarakat({super.key});

  @override
  Widget build(BuildContext context) {
    MasyarakatController masyarakatController = Get.put(MasyarakatController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaduan'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    width: double.infinity,
                    height: 256,
                    decoration: const BoxDecoration(color: Colors.white60),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Get.to(() => const BuatMasyarakat());
                            },
                            child: const Text('Buat Masyarakat')),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.menu),
            ),
          )
        ],
      ),
      body: Center(
        child: _buildMasyarakatList(masyarakatController),
      ),
    );
  }

  Widget _buildMasyarakatList(MasyarakatController controller) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Obx(
        () => controller.isLoading.value
            ? _buildLoadingWidget()
            : ListView.builder(
                itemCount: controller.listmasyarakat.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(controller.listmasyarakat[index].nama.toString()), // Konversi ke string
                    ),

                    title: Text(controller.listmasyarakat[index].nik.toString()), // Konversi ke string

                    subtitle: Text(controller.listmasyarakat[index].createdAt.toString()), // Konversi ke string

                    // CircleAvatar(
                    //   child: Text('${controller.listmasyarakat[index].nama}'),
                    // ),
                    // title: Text('${controller.listmasyarakat[index].nik}'),
                    // subtitle:
                    //     Text('${controller.listmasyarakat[index].createdAt}'),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
