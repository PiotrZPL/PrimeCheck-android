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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 2 / 3,
              child: Column(  
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  number == -1
                  ? const Text(
                    "Let's check!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  )
                  : Column(
                    children: [
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
                          "It is divisible by $numberThatDevides.",
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                          ),
                        )
                      else
                        const SizedBox(
                          height: 26
                        ),
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
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
                ],
              ),
            ),
            SizedBox(
              child: FloatingActionButton.extended(
                onPressed: checkIfNumberIsPrime,
                label: Text(
                  "Check",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}