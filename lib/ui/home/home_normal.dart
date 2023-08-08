import 'dart:html' as html;
import 'dart:io' as io;

import 'package:file_crypt/components/app_bar.dart';
import 'package:file_crypt/core/history.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class HomeNormal extends StatefulWidget {
  const HomeNormal({super.key});

  @override
  State<HomeNormal> createState() => _HomeNormalState();
}

class _HomeNormalState extends State<HomeNormal> {
  final database = MyDatabase();
  Object? obj;

  Future<void> saveHistrory({required String filename}) async {
    final histories = await database.select(database.history).get();
    final id = histories.length + 1;
    await database
        .into(database.history)
        .insert(HistoryData(id: id, title: filename, createdAt: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: 64,
                        decoration: BoxDecoration(
                            color: Theme.of(context).indicatorColor,
                            borderRadius: BorderRadius.circular(45)),
                        child: Center(
                          child: Text(
                            obj != null
                                ? 'No file selected'
                                : 'File select. Ready for encryption...',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontFamily: GoogleFonts.comfortaa().fontFamily,
                                fontWeight: FontWeight.normal,
                                color: obj != null ? Colors.black : Colors.black54),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles();

                            if (result != null) {
                              final file = kIsWeb
                                  ? html.File(result.files.single.bytes!, result.files.single.name)
                                  : io.File(result.files.single.path!);
                              setState(() {
                                obj = file;
                              });
                            } else {
                              // User canceled the picker
                            }
                          },
                          splashColor: Colors.black54,
                          borderRadius: BorderRadius.circular(45),
                          child: Container(
                            height: 64,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.red, borderRadius: BorderRadius.circular(45)),
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Select',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontFamily: GoogleFonts.comfortaa().fontFamily,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Icon(IconlyBold.folder),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
