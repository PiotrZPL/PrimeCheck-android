import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageContent extends StatelessWidget {
  const PageContent({Key? key, required this.number, required this.isPrime, required this.numberThatDevides, required this.textFieldController, required this.checkIfNumberIsPrime}) : super(key: key);

  final int number;
  final bool isPrime;
  final int numberThatDevides;
  final TextEditingController textFieldController;
  final void Function() checkIfNumberIsPrime;

  @override
  Widget build (BuildContext context) {
    if (number != -1) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$number",
              style: TextStyle(
                color: isPrime ? Colors.green : Colors.red,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isPrime) 
              const Text(
                "is a prime number.",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22,
                ),
              )
            else
              const Text(
                "is not a prime number.",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                ),
              ),
            if (numberThatDevides != 0)
              Text(
                "It can be devided by $numberThatDevides.",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                ),
              )
            else
              const SizedBox(
                height: 26
              ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(38),
              child: TextField(
                decoration: const InputDecoration(labelText: "Enter your number"),
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: textFieldController,
                keyboardType: TextInputType.number,
                maxLength: 16,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            const SizedBox(
              height: 120
            ),
            ElevatedButton(
              onPressed: checkIfNumberIsPrime,
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(120, 60),
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
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Let's check!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(38),
              child: TextField(
                decoration: const InputDecoration(labelText: "Enter your number"),
                controller: textFieldController,
                style: const TextStyle(
                  fontSize: 22,
                ),
                keyboardType: TextInputType.number,
                maxLength: 16,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            const SizedBox(
              height: 120
            ),
            ElevatedButton(
              onPressed: checkIfNumberIsPrime,
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(120, 60),
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
      );
    }
  }
}