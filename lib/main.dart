/*
Copyright (C) 2021-2024 Piotr Lange

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 3.

PrimeCheck is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:primecheck/utils/is_prime.dart';
import 'package:primecheck/widgets/page_content.dart';
import 'package:primecheck/utils/license.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    yield LicenseEntryWithLineBreaks(
      ["PrimeCheck"],
      licensetext,
    );
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: 'PrimeCheck',
        theme: ThemeData(
          colorScheme: lightColorScheme ?? const ColorScheme.light(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? const ColorScheme.dark(),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const HomePage(),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var menuItems = <String>[
    "About",
  ];

  void onSelected(item) {
    switch (item) {
      case 'About':
        // showDialog(
        //   context: context,
        //   builder: buildErrotDialog,
        // );
        showAboutDialog(
          context: context,
          applicationVersion: versionString,
          applicationName: "PrimeCheck",
          applicationLegalese: "Released under the terms of the GNU GPL v3.\n\nCopyright (c) 2022-${DateTime.now().year} Piotr Lange",
          applicationIcon: const Image(
            image: AssetImage("assets/images/icon-1.png"),
            width: 52,
            height: 52,
          )
        );
        break;
    }
  }

  int _number = -1;
  bool _isPrime = false;
  int _numberThatDevides = 0;
  final textFieldController = TextEditingController();
  String versionString = "0.3.0";

  void checkIfNumberIsPrime() {
    setState(() {
      _number = int.parse(textFieldController.text);
      List tempList = isPrime(_number);
      _isPrime = tempList[0];
      _numberThatDevides = tempList[1];
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldController.dispose();
    super.dispose();
  }

  Widget buildErrotDialog(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            const Text(
              "PrimeCheck",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 7,),
            const Icon(Icons.info),
            const SizedBox(height: 7,),
            const Text(
              "Released under the GNU GPL v3",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "version: $versionString",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("PrimeCheck"),
        actions: <Widget>[
              PopupMenuButton<String>(
                  onSelected: onSelected,
                  itemBuilder: (BuildContext context) {
                    return menuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: ListTile(
                          title: Text(choice),
                          leading: const Icon(Icons.info),
                        ),
                      );
                    }).toList();
                  })
            ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: PageContent(
          number: _number,
          isPrime: _isPrime,
          numberThatDevides: _numberThatDevides,
          textFieldController: textFieldController,
          checkIfNumberIsPrime: checkIfNumberIsPrime,
        )
      ),
    );
  }
}
