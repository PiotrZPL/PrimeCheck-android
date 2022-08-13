import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrimeCheck',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
          applicationLegalese: "Released under the terms of the GNU GPL v3.\n\nCopyright (c) 2022 Piotr Lange"
        );
        break;
    }
  }

  int _number = -1;
  bool _isPrime = false;
  int _numberThatDevides = 0;
  final textFieldController = TextEditingController();
  String versionString = "0.2";

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
