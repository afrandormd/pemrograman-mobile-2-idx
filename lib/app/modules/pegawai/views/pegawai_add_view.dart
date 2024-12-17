import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pegawai_controller.dart';

class PegawaiAddView extends GetView<PegawaiController> {
  const PegawaiAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNoKaryawan,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "No Karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNamaKaryawan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama Karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cJabatanKaryawan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Jabatan Karyawan"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                controller.cNoKaryawan.text,
                controller.cNamaKaryawan.text,
                controller.cJabatanKaryawan.text,
              ),
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
