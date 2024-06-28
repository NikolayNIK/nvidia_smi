import './src/raw_query.dart' as raw_query;
import './gpu_id.dart';

Future<Iterable<List<String>>> query(
  List<String> columns, {
  GpuId? id,
  bool includeHeaders = false,
  bool includeUnits = false,
}) async =>
    await raw_query.query(
      '--query-accounted-apps',
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

/// vGPU instance
const vgpuInstance = 'vgpu_instance';

/// Process ID of the compute application
const pid = 'pid';

/// GPU Utilization
const gpuUtilization = 'gpu_utilization';

/// GPU Utilization
const gpuUtil = 'gpu_util';

/// Percentage of GPU memory utilized on the device by the context.
const memUtilization = 'mem_utilization';

/// Percentage of GPU memory utilized on the device by the context.
const memUtil = 'mem_util';

/// Maximum amount memory used on the device by the context.
const maxMemoryUsage = 'max_memory_usage';

/// Amount of time in ms during which the compute context was active.
const time = 'time';
