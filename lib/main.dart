import 'package:custom_painter/models/layout_model.dart';
import 'package:custom_painter/pages/launcher_page.dart';
import 'package:custom_painter/pages/launcher_tablet_page.dart';
import 'package:custom_painter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(2)),
        ChangeNotifierProvider<LayoutModel>(create: (_) => LayoutModel()),
      ],
      child: Builder(
        builder: (context) {
          final appTheme = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            theme: appTheme.currentTheme,
            debugShowCheckedModeBanner: false,
            home: OrientationBuilder(
              builder: (context, orientation) {
                final screenSize = MediaQuery.of(context).size;

                if (screenSize.width > 500) {
                  return LauncherTabletPage();
                } else {
                  return LauncherPage();
                }
              },
            ),
          );
        },
      )));
}
