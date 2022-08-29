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


List isPrime(final int number)
{
	if (number <= 1) return [false, 0];
	if (number == 2) return [true, 0];
	if (number == 3) return [true, 0];
	if (number % 2 == 0) return [false, 2];
	if (number % 3 == 0) return [false, 3];

	final int lim = sqrt(number).toInt();
	for (int i = 5; i <= lim; i += 6)
	{
		if (number % i == 0) return [false, i];
		if (number % (i + 2) == 0) return [false, i + 2];
	}

	return [true, 0];
}
