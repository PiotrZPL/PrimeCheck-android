import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primecheck/utils/is_prime.dart';

void main() {
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
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
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
  int _number = 0;
  bool _isPrime = false;
  int _numberThatDevides = 0;
  final textFieldController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("PrimeCheck"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_number',
              style: Theme.of(context).textTheme.headline4,
            ),
            if (_isPrime) 
              const Text("is a prime number.")
            else
              const Text("is not a prime number."),
            if (_numberThatDevides != 0)
              Text("It can be devided by $_numberThatDevides."),
            TextField(
              decoration: const InputDecoration(labelText: "Enter your number"),
              controller: textFieldController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
            const SizedBox(height: 120),
            ElevatedButton(
              onPressed: checkIfNumberIsPrime,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(120, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                )
              ),
              child: Text(
                "Check",
                style: Theme.of(context).textTheme.headline6,
              )
            )
          ],
        ),
      ),
    );
  }
}
