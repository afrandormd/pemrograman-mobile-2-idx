import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  late TextEditingController cJabatan;
  late TextEditingController cNama;
  late TextEditingController cIdPegawai;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pegawai = firestore.collection('pegawai');

    return pegawai.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference pegawai = firestore.collection('pegawai');

    return pegawai.snapshots();
  }

  void add(String nama, String jabatan, String idPegawai, String alamat) async {
    CollectionReference pegawai = firestore.collection("pegawai");

    try {
      await pegawai.add({
        "nama": nama,
        "jabatan": jabatan,
        "idPegawai": idPegawai,
        "alamat": alamat
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pegawai.",
          onConfirm: () {
            cNama.clear();
            cJabatan.clear();
            cIdPegawai.clear();
            cAlamat.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Pegawai.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

    return docRef.get();
  }

  void Update(String nama, String jabatan, String id, String idPegawai,
      String alamat) async {
    DocumentReference pegawaiById = firestore.collection("pegawai").doc(id);

    try {
      await pegawaiById.update({
        "nama": nama,
        "jabatan": jabatan,
        "idPegawai": idPegawai,
        "alamat": alamat,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Pegawai.",
        onConfirm: () {
          cNama.clear();
          cJabatan.clear();
          cIdPegawai.clear();
          cAlamat.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Pegawai.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("pegawai").doc(id);

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
    cNama = TextEditingController();
    cJabatan = TextEditingController();
    cIdPegawai = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNama.dispose();
    cJabatan.dispose();
    cIdPegawai.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}
