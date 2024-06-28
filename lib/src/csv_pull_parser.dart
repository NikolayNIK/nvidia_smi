Stream<List<String>> parseCsvFromStream(
  Stream<String> steam, {
  String valueSeparator = ',',
  String lineSeparator = '\n',
}) async* {
  final valueSeparatorRune = valueSeparator.runes.single;
  final lineSeparatorRune = lineSeparator.runes.single;

  final buffer = StringBuffer();
  var row = <String>[];

  await for (String value in steam) {
    for (final rune in value.runes) {
      if (rune == valueSeparatorRune) {
        row.add(buffer.toString());
        buffer.clear();
        continue;
      }

      if (rune == lineSeparatorRune) {
        final rowToYield = row;
        row = <String>[];
        yield rowToYield;
        continue;
      }

      buffer.writeCharCode(rune);
    }
  }

  row.add(buffer.toString());
  yield row;
}

Iterable<List<String>> parseCsv(
  String csv, {
  String valueSeparator = ',',
  String lineSeparator = '\n',
}) sync* {
  final valueSeparatorRune = valueSeparator.runes.single;
  final lineSeparatorRune = lineSeparator.runes.single;

  final buffer = StringBuffer();
  var row = <String>[];

  for (final rune in csv.runes) {
    if (rune == valueSeparatorRune) {
      row.add(buffer.toString());
      buffer.clear();
      continue;
    }

    if (rune == lineSeparatorRune) {
      row.add(buffer.toString());
      buffer.clear();

      final rowToYield = row;
      row = <String>[];
      yield rowToYield;
      continue;
    }

    buffer.writeCharCode(rune);
  }

  row.add(buffer.toString());
  yield row;
}
