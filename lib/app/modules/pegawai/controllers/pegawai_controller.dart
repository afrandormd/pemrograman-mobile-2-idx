import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  //TODO: Implement pegawaiController
  // late TextEditingController cIdPegawai;
  // late TextEditingController cNama;
  // late TextEditingController cJabatan;
  // late TextEditingController cAlamat;

  late TextEditingController cNoKaryawan;
  late TextEditingController cNamaKaryawan;
  late TextEditingController cJabatanKaryawan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan = firestore.collection('karyawan_22312105');
    return karyawan.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference karyawan = firestore.collection('karyawan_22312105');
    return karyawan.snapshots();
  }

// Bagian Tambah Data
  void add(String noKaryawan, String namaKaryawan, String jabatanKaryawan) async {
    CollectionReference pegawai = firestore.collection("karyawan_22312105");

    try {
      await pegawai.add({
        "no_karyawan": noKaryawan,
        "nama_karyawan": namaKaryawan,
        "jabatan_karyawan": jabatanKaryawan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data karyawan",
          onConfirm: () {
            cNoKaryawan.clear();
            cNamaKaryawan.clear();
            cJabatanKaryawan.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan karyawan.",
      );
    }
  }

// Bagian Update Data
  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("karyawan_22312105").doc(id);

    return docRef.get();
  }

  void Update(String noKaryawan, String namaKaryawan, String jabatanKaryawan,
      String id) async {
    DocumentReference pegawaiById = firestore.collection("karyawan_22312105").doc(id);

    try {
      await pegawaiById.update({
        "no_karyawan": noKaryawan,
        "nama_karyawan": namaKaryawan,
        "jabatan_karyawan": jabatanKaryawan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data karyawan.",
        onConfirm: () {
          cNoKaryawan.clear();
          cNamaKaryawan.clear();
          cJabatanKaryawan.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan pegawai.",
      );
    }
  }

// Bagian Delete data
  void delete(String id) {
    DocumentReference docRef = firestore.collection("karyawan_22312105").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNoKaryawan = TextEditingController();
    cNamaKaryawan = TextEditingController();
    cJabatanKaryawan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNoKaryawan.dispose();
    cNamaKaryawan.dispose();
    cJabatanKaryawan.dispose();
    super.onClose();
  }
}