import 'package:file_crypt/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class UploadNormal extends StatelessWidget {
  const UploadNormal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Icon(
            IconlyLight.upload,
            size: 60,
          )),
          const SizedBox(height: 25),
          Center(
            child: Text(
              'Feature coming soon...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
