import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DosenUpdateView extends GetView {
  const DosenUpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DosenUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DosenUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
