/*
Copyright (C) 2021-2022 Piotr Lange and sutani127

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

import 'dart:math';


List isPrime(int numberToCheck) {
  if (numberToCheck < 2) {
    return [false, 0];
  }
  else if (numberToCheck == 2) {
    return [true, 0];
  }
  if (numberToCheck % 2 == 0) {
    return [false, 2];
  }
  final int lim = sqrt(numberToCheck).toInt();
  for (int i = 3; i <= lim; i += 2) {
    if (numberToCheck % i == 0) {
      return [false, i];
    }
  }
  return [true, 0];
}
