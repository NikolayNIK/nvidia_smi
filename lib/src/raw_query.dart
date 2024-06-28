import 'dart:io';

import '../gpu_id.dart';
import '../exceptions.dart';
import './csv_pull_parser.dart';

Future<Iterable<List<String>>> query(
  String queryArgument,
  List<String> columns, {
  required GpuId? id,
  required bool includeHeaders,
  required bool includeUnits,
}) async {
  final result = await Process.run(
    'nvidia-smi',
    [
      '--format=${[
        'csv',
        if (!includeHeaders) 'noheader',
        if (!includeUnits) 'nounits',
      ].join(',')}',
      queryArgument,
      columns.join(','),
      if (id != null) '--id=$id'
    ],
    stdoutEncoding: SystemEncoding(),
    stderrEncoding: SystemEncoding(),
  );

  if (result.exitCode != 0) {
    throw NvidiaSmiException(
      exitCode: exitCode,
      stderr: result.stderr,
      stdout: result.stdout,
    );
  }

  return parseCsv(result.stdout.toString().trim());
}
