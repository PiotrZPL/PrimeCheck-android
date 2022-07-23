bool isPrime (int numberToCheck) {
  if (numberToCheck > 1) {
    for (var iii = 2; iii <= numberToCheck ~/ 2; iii++) {
      if (numberToCheck % iii == 0) {
        return false;
      }
    }
  }
  else {
    return false;
  }
  return true;
}