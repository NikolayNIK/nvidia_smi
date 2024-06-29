import 'dart:math';
import 'package:characters/characters.dart';

void printTable(Iterable<List<String>> content) {
  final list = content.toList(growable: false);

  final lengths =
      list.map((e) => e.map((e) => e.characters.length + 1)).fold<List<int>>(
    [],
    (previousValue, element) => [
      for (final (index, item) in element.indexed)
        index < previousValue.length ? max(previousValue[index], item) : item,
    ],
  );

  void printRow(List<String> row) => print(
      '║${lengths.indexed.map((e) => (e.$1 >= row.length ? '' : row[e.$1]).padRightCharacters(e.$2)).join('│')}║');

  print('╔${lengths.map((e) => '═' * e).join('╤')}╗');
  printRow(list[0]);
  print('╟${lengths.map((e) => '─' * e).join('┼')}╢');
  content.skip(1).forEach(printRow);
  print('╚${lengths.map((e) => '═' * e).join('╧')}╝');
}

extension PadCharacters on String {
  String padRightCharacters(int widthCharacters, [String padding = ' ']) =>
      this +
      padding *
          ((widthCharacters - characters.length) ~/ padding.characters.length);
}
