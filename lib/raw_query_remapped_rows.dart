import './src/raw_query.dart' as raw_query;
import './gpu_id.dart';

Future<Iterable<List<String>>> query(
  List<String> columns, {
  GpuId? id,
  bool includeHeaders = false,
  bool includeUnits = false,
}) async =>
    await raw_query.query(
      '--query-remapped-rows',
      columns,
      id: id,
      includeHeaders: includeHeaders,
      includeUnits: includeUnits,
    );

/// The timestamp of when the query was made in format "YYYY/MM/DD HH:MM:SS.msec".
const timestamp = 'timestamp';

/// The official product name of the GPU. This is an alphanumeric string. For all products.
const gpuName = 'gpu_name';

/// PCI bus id as "domain:bus:device.function", in hex.
const gpuBusId = 'gpu_bus_id';

/// This number matches the serial number physically printed on each board. It is a globally unique immutable alphanumeric value.
const gpuSerial = 'gpu_serial';

/// This value is the globally unique immutable alphanumeric identifier of the GPU. It does not correspond to any physical label on the board.
const gpuUuid = 'gpu_uuid';

/// The number of rows that have been remapped due to correctable ECC errors.
const remappedRowsCorrectable = 'remapped_rows.correctable';

/// The number of rows that have been remapped due to uncorrectable ECC errors.
const remappedRowsUncorrectable = 'remapped_rows.uncorrectable';

/// Whether or not there are pending row-remappings.
const remappedRowsPending = 'remapped_rows.pending';

/// Whether or not a row remapping has failed in the past.
const remappedRowsFailure = 'remapped_rows.failure';
