import 'package:nvidia_smi/raw_query_gpu.dart' as query_gpu;
import 'package:nvidia_smi/raw_query_compute_apps.dart' as query_apps;
import 'package:nvidia_smi/raw_query_accounted_apps.dart' as accounted_apps;

import 'print_table.dart';

void main(List<String> args) async {
  printGPU();
  printComputeApps();
  printAccountedApps();
}

void printGPU() async {
  final propertyNames = [
    query_gpu.gpuUuid,
    query_gpu.gpuName,
    query_gpu.computeCap,
    query_gpu.displayActive,
    query_gpu.pstate,
    query_gpu.utilizationGpu,
    query_gpu.utilizationMemory,
    query_gpu.utilizationDecoder,
    query_gpu.utilizationEncoder,
    query_gpu.utilizationJpeg,
    query_gpu.utilizationOfa,
  ];

  final output = await query_gpu.query(
    propertyNames,
    includeUnits: true,
  );

  print('GPU properties');
  for (final propertyValues in output) {
    printTable([
      ['Property', 'Value'],
      for (final entry in propertyNames.indexed)
        [entry.$2, propertyValues[entry.$1]],
    ]);
  }
}

void printComputeApps() async {
  final output = await query_apps.query(
    [
      query_apps.gpuUuid,
      query_apps.gpuName,
      query_apps.pid,
      query_apps.processName,
      query_apps.usedMemory,
    ],
    includeHeaders: true,
  );

  print('Compute Apps');
  printTable(output);
}

void printAccountedApps() async {
  final output = await accounted_apps.query(
    [
      accounted_apps.gpuUuid,
      accounted_apps.gpuName,
      accounted_apps.pid,
      accounted_apps.gpuUtilization,
    ],
    includeHeaders: true,
  );

  print('Accounted Apps');
  printTable(output);
}
