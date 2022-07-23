List isPrime (int numberToCheck) {
  if (numberToCheck > 1) {
    for (var iii = 2; iii <= numberToCheck ~/ 2; iii++) {
      if (numberToCheck % iii == 0) {
        return [false, iii];
      }
    }
  }
  else {
    return [false, 0];
  }
  return [true, 0];
}