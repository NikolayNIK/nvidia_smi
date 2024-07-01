Iterable<List<String>> parseCsv(
  String csv, {
  String valueSeparator = ',',
  String lineSeparator = '\n',
}) sync* {
  final valueSeparatorRunes = valueSeparator.runes.toList(growable: false);
  final lineSeparatorRune = lineSeparator.runes.single;

  final buffer = StringBuffer();
  var row = <String>[];

  int valueSeparatorIndex = 0;

  for (final rune in csv.runes) {
    if (rune == valueSeparatorRunes[valueSeparatorIndex]) {
      valueSeparatorIndex++;
      if (valueSeparatorIndex == valueSeparatorRunes.length) {
        row.add(buffer.toString());
        buffer.clear();
        valueSeparatorIndex = 0;
      }

      continue;
    }

    if (valueSeparatorIndex != 0) {
      for (var i = 0; i < valueSeparatorIndex; i++) {
        final char = valueSeparatorRunes[i];
        if (char == lineSeparatorRune) {
          row.add(buffer.toString());
          buffer.clear();

          final rowToYield = row;
          row = <String>[];
          yield rowToYield;
          continue;
        }

        buffer.writeCharCode(char);
      }

      valueSeparatorIndex = 0;
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
