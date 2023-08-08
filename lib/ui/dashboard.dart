import 'package:file_crypt/ui/details.dart';
import 'package:file_crypt/ui/history/history_normal.dart';
import 'package:file_crypt/ui/history/history_small.dart';
import 'package:file_crypt/ui/home/home_normal.dart';
import 'package:file_crypt/ui/home/home_small.dart';
import 'package:file_crypt/ui/upload/upload_normal.dart';
import 'package:file_crypt/ui/upload/upload_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:iconly/iconly.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedTab = 0;
  final _pagesNormal = [const HomeNormal(), const HistoryNormal(), const UploadNormal()];
  final _pagesSmall = [const HomeSmall(), const HistorySmall(), const UploadSmall()];
  final _details = [
    AdaptiveScaffold.emptyBuilder,
    (_) => const Details(),
    AdaptiveScaffold.emptyBuilder
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      smallBreakpoint: const WidthPlatformBreakpoint(end: 700),
      mediumBreakpoint: const WidthPlatformBreakpoint(begin: 700, end: 1000),
      largeBreakpoint: const WidthPlatformBreakpoint(begin: 1000),
      useDrawer: false,
      selectedIndex: _selectedTab,
      onSelectedIndexChange: (int index) {
        setState(() {
          _selectedTab = index;
        });
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(IconlyLight.home),
          selectedIcon: Icon(IconlyBold.home),
          label: 'Home',
          tooltip: 'Home',
        ),
        NavigationDestination(
          icon: Icon(IconlyLight.activity),
          selectedIcon: Icon(IconlyBold.activity),
          label: 'History',
          tooltip: 'History',
        ),
        NavigationDestination(
          icon: Icon(IconlyLight.upload),
          selectedIcon: Icon(IconlyBold.upload),
          label: 'Upload',
          tooltip: 'Upload',
        ),
      ],
      body: (_) => _pagesNormal[_selectedTab],
      smallBody: (_) => _pagesSmall[_selectedTab],
      secondaryBody: _details[_selectedTab],
      largeBody: (_) => _pagesNormal[_selectedTab],
      largeSecondaryBody: _details[_selectedTab],
      smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    );
  }
}
