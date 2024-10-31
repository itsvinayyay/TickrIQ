String getYear({required String date}) {
  DateTime parsedDate = DateTime.parse(date);

  return parsedDate.year.toString();
}
