import 'package:file_crypt/components/app_bar.dart';
import 'package:flutter/material.dart';

class HomeSmall extends StatefulWidget {
  const HomeSmall({super.key});

  @override
  State<HomeSmall> createState() => _HomeSmallState();
}

class _HomeSmallState extends State<HomeSmall> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < 10; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: const Color.fromARGB(255, 255, 201, 197),
            height: 400,
          ),
        )
    ];

    return Scaffold(
      appBar: const AppBarWidget(),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (_, int idx) => children[idx],
      ),
    );
  }
}
