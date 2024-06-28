import './src/raw_query.dart' as raw_query;
import './gpu_id.dart';

Future<Iterable<List<String>>> query(
  List<String> columns, {
  GpuId? id,
  bool includeHeaders = false,
  bool includeUnits = false,
}) async =>
    await raw_query.query(
      '--query-gpu',
      columns,
      id: id,
      includeHeaders: includeHeaders,
      includeUnits: includeUnits,
    );

/// The timestamp of when the query was made in format "YYYY/MM/DD HH:MM:SS.msec".
const timestamp = 'timestamp';

/// The version of the installed NVIDIA display driver. This is an alphanumeric string.
const driverVersion = 'driver_version';

/// Whether heterogeneuos multi-vGPU is supported by driver.
const vgpuDriverCapabilityHeterogenousMultivgpu =
    'vgpu_driver_capability.heterogenous_multivGPU';

/// The number of NVIDIA GPUs in the system.
const count = 'count';

/// The official product name of the GPU. This is an alphanumeric string. For all products.
const name = 'name';

/// The official product name of the GPU. This is an alphanumeric string. For all products.
const gpuName = 'gpu_name';

/// This number matches the serial number physically printed on each board. It is a globally unique immutable alphanumeric value.
const serial = 'serial';

/// This number matches the serial number physically printed on each board. It is a globally unique immutable alphanumeric value.
const gpuSerial = 'gpu_serial';

/// This value is the globally unique immutable alphanumeric identifier of the GPU. It does not correspond to any physical label on the board.
const uuid = 'uuid';

/// This value is the globally unique immutable alphanumeric identifier of the GPU. It does not correspond to any physical label on the board.
const gpuUuid = 'gpu_uuid';

/// PCI bus id as "domain:bus:device.function", in hex.
const pciBusId = 'pci.bus_id';

/// PCI bus id as "domain:bus:device.function", in hex.
const gpuBusId = 'gpu_bus_id';

/// PCI domain number, in hex.
const pciDomain = 'pci.domain';

/// PCI bus number, in hex.
const pciBus = 'pci.bus';

/// PCI device number, in hex.
const pciDevice = 'pci.device';

/// PCI Base Classcode, in hex.
const pciBaseclass = 'pci.baseClass';

/// PCI Sub Classcode, in hex.
const pciSubclass = 'pci.subClass';

/// PCI vendor device id, in hex
const pciDeviceId = 'pci.device_id';

/// PCI Sub System id, in hex
const pciSubDeviceId = 'pci.sub_device_id';

/// Fractional vGPU profiles on this GPU can be used in multi-vGPU configurations.
const vgpuDeviceCapabilityFractionalMultivgpu =
    'vgpu_device_capability.fractional_multiVgpu';

/// Supports concurrent execution of timesliced vGPU profiles of differing types.
const vgpuDeviceCapabilityHeterogeneousTimesliceProfile =
    'vgpu_device_capability.heterogeneous_timeSlice_profile';

/// Supports concurrent execution of timesliced vGPU profiles of differing framebuffer sizes.
const vgpuDeviceCapabilityHeterogeneousTimesliceSizes =
    'vgpu_device_capability.heterogeneous_timeSlice_sizes';

/// The current PCI-E link generation. These may be reduced when the GPU is not in use. Deprecated, use pcie.link.gen.gpucurrent instead.
const pcieLinkGenCurrent = 'pcie.link.gen.current';

/// The current PCI-E link generation. These may be reduced when the GPU is not in use.
const pcieLinkGenGpucurrent = 'pcie.link.gen.gpucurrent';

/// The maximum PCI-E link generation possible with this GPU and system configuration. For example, if the GPU supports a higher PCIe generation than the system supports then this reports the system PCIe generation.
const pcieLinkGenMax = 'pcie.link.gen.max';

/// The maximum PCI-E link generation supported by this GPU.
const pcieLinkGenGpumax = 'pcie.link.gen.gpumax';

/// The maximum PCI-E link generation supported by the root port corresponding to this GPU.
const pcieLinkGenHostmax = 'pcie.link.gen.hostmax';

/// The current PCI-E link width. These may be reduced when the GPU is not in use.
const pcieLinkWidthCurrent = 'pcie.link.width.current';

/// The maximum PCI-E link width possible with this GPU and system configuration. For example, if the GPU supports a higher PCIe generation than the system supports then this reports the system PCIe generation.
const pcieLinkWidthMax = 'pcie.link.width.max';

/// Zero based index of the GPU. Can change at each boot.
const index = 'index';

/// A flag that indicates whether a physical display (e.g. monitor) is currently connected to any of the GPU's connectors. "Enabled" indicates an attached display. "Disabled" indicates otherwise.
const displayMode = 'display_mode';

/// A flag that indicates whether a display is initialized on the GPU's (e.g. memory is allocated on the device for display). Display can be active even when no monitor is physically attached. "Enabled" indicates an active display. "Disabled" indicates otherwise.
const displayActive = 'display_active';

/// A flag that indicates whether persistence mode is enabled for the GPU. Value is either "Enabled" or "Disabled". When persistence mode is enabled the NVIDIA driver remains loaded even when no active clients, such as X11 or nvidia-smi, exist. This minimizes the driver load latency associated with running dependent apps, such as CUDA programs. Linux only.
const persistenceMode = 'persistence_mode';

/// A flag that indicates the type of addressing mode enabled for the GPU. Value is either "HMM" or "ATS" or "None". When the mode is HMM, system allocated memory (malloc, mmap) is addressable from the device (GPU), via software-based mirroring of the CPU's page tables, on the GPU. When the mode is ATS, system allocated memory (malloc, mmap) is addressable from the device (GPU), via Address Translation Services. This means that there is (effectively) a single set of page tables, and the CPU and GPU both use them. The mode is None when neither HMM nor ATS is active. Linux only.
const addressingMode = 'addressing_mode';

/// A flag that indicates whether accounting mode is enabled for the GPU. Value is either "Enabled" or "Disabled". When accounting is enabled statistics are calculated for each compute process running on the GPU.Statistics can be queried during the lifetime or after termination of the process.The execution time of process is reported as 0 while the process is in running state and updated to actualexecution time after the process has terminated. See --help-query-accounted-apps for more info.
const accountingMode = 'accounting.mode';

/// The size of the circular buffer that holds list of processes that can be queried for accounting stats. This is the maximum number of processes that accounting information will be stored for before information about oldest processes will get overwritten by information about new processes.
const accountingBufferSize = 'accounting.buffer_size';

/// The driver model currently in use. Always "N/A" on Linux.
const driverModelCurrent = 'driver_model.current';

/// The driver model that will be used on the next reboot. Always "N/A" on Linux.
const driverModelPending = 'driver_model.pending';

/// The BIOS of the GPU board.
const vbiosVersion = 'vbios_version';

/// Global version of the infoROM image. Image version just like VBIOS version uniquely describes the exact version of the infoROM flashed on the board in contrast to infoROM object version which is only an indicator of supported features.
const inforomImg = 'inforom.img';

/// Global version of the infoROM image. Image version just like VBIOS version uniquely describes the exact version of the infoROM flashed on the board in contrast to infoROM object version which is only an indicator of supported features.
const inforomImage = 'inforom.image';

/// Version for the OEM configuration data.
const inforomOem = 'inforom.oem';

/// Version for the ECC recording data.
const inforomEcc = 'inforom.ecc';

/// Version for the power management data.
const inforomPwr = 'inforom.pwr';

/// Version for the power management data.
const inforomPower = 'inforom.power';

/// Checks if a GPU reset is required.
const resetStatusResetRequired = 'reset_status.reset_required';

/// Checks if a GPU drain and reset is recommended.
const resetStatusDrainAndResetRecommended =
    'reset_status.drain_and_reset_recommended';

/// The GOM currently in use.
const gomCurrent = 'gom.current';

/// The GOM currently in use.
const gpuOperationModeCurrent = 'gpu_operation_mode.current';

/// The GOM that will be used on the next reboot.
const gomPending = 'gom.pending';

/// The GOM that will be used on the next reboot.
const gpuOperationModePending = 'gpu_operation_mode.pending';

/// The fan speed value is the percent of the product's maximum noise tolerance fan speed that the device's fan is currently intended to run at. This value may exceed 100% in certain cases. Note: The reported speed is the intended fan speed. If the fan is physically blocked and unable to spin, this output will not match the actual fan speed. Many parts do not report fan speeds because they rely on cooling via fans in the surrounding enclosure.
const fanSpeed = 'fan.speed';

/// The current performance state for the GPU. States range from P0 (maximum performance) to P12 (minimum performance).
const pstate = 'pstate';

/// Bitmask of supported clock event reasons. See nvml.h for more details.
const clocksEventReasonsSupported = 'clocks_event_reasons.supported';

/// Bitmask of supported clock event reasons. See nvml.h for more details.
const clocksThrottleReasonsSupported = 'clocks_throttle_reasons.supported';

/// Bitmask of active clock event reasons. See nvml.h for more details.
const clocksEventReasonsActive = 'clocks_event_reasons.active';

/// Bitmask of active clock event reasons. See nvml.h for more details.
const clocksThrottleReasonsActive = 'clocks_throttle_reasons.active';

/// Nothing is running on the GPU and the clocks are dropping to Idle state. This limiter may be removed in a later release.
const clocksEventReasonsGpuIdle = 'clocks_event_reasons.gpu_idle';

/// Nothing is running on the GPU and the clocks are dropping to Idle state. This limiter may be removed in a later release.
const clocksThrottleReasonsGpuIdle = 'clocks_throttle_reasons.gpu_idle';

/// GPU clocks are limited by applications clocks setting. E.g. can be changed by nvidia-smi --applications-clocks=
const clocksEventReasonsApplicationsClocksSetting =
    'clocks_event_reasons.applications_clocks_setting';

/// GPU clocks are limited by applications clocks setting. E.g. can be changed by nvidia-smi --applications-clocks=
const clocksThrottleReasonsApplicationsClocksSetting =
    'clocks_throttle_reasons.applications_clocks_setting';

/// SW Power Scaling algorithm is reducing the clocks below requested clocks because the GPU is consuming too much power. E.g. SW power cap limit can be changed with nvidia-smi --power-limit=
const clocksEventReasonsSwPowerCap = 'clocks_event_reasons.sw_power_cap';

/// SW Power Scaling algorithm is reducing the clocks below requested clocks because the GPU is consuming too much power. E.g. SW power cap limit can be changed with nvidia-smi --power-limit=
const clocksThrottleReasonsSwPowerCap = 'clocks_throttle_reasons.sw_power_cap';

/// HW Slowdown (reducing the core clocks by a factor of 2 or more) is engaged. This is an indicator of:
/// HW Thermal Slowdown: temperature being too high
/// HW Power Brake Slowdown: External Power Brake Assertion is triggered (e.g. by the system power supply)
/// * Power draw is too high and Fast Trigger protection is reducing the clocks
/// * May be also reported during PState or clock change
/// * This behavior may be removed in a later release
const clocksEventReasonsHwSlowdown = 'clocks_event_reasons.hw_slowdown';

/// HW Slowdown (reducing the core clocks by a factor of 2 or more) is engaged. This is an indicator of:
/// HW Thermal Slowdown: temperature being too high
/// HW Power Brake Slowdown: External Power Brake Assertion is triggered (e.g. by the system power supply)
/// * Power draw is too high and Fast Trigger protection is reducing the clocks
/// * May be also reported during PState or clock change
/// * This behavior may be removed in a later release
const clocksThrottleReasonsHwSlowdown = 'clocks_throttle_reasons.hw_slowdown';

/// HW Thermal Slowdown (reducing the core clocks by a factor of 2 or more) is engaged. This is an indicator of temperature being too high
const clocksEventReasonsHwThermalSlowdown =
    'clocks_event_reasons.hw_thermal_slowdown';

/// HW Thermal Slowdown (reducing the core clocks by a factor of 2 or more) is engaged. This is an indicator of temperature being too high
const clocksThrottleReasonsHwThermalSlowdown =
    'clocks_throttle_reasons.hw_thermal_slowdown';

/// HW Power Brake Slowdown (reducing the core clocks by a factor of 2 or more) is engaged. This is an indicator of External Power Brake Assertion being triggered (e.g. by the system power supply)
const clocksEventReasonsHwPowerBrakeSlowdown =
    'clocks_event_reasons.hw_power_brake_slowdown';

/// HW Power Brake Slowdown (reducing the core clocks by a factor of 2 or more) is engaged. This is an indicator of External Power Brake Assertion being triggered (e.g. by the system power supply)
const clocksThrottleReasonsHwPowerBrakeSlowdown =
    'clocks_throttle_reasons.hw_power_brake_slowdown';

/// SW Thermal capping algorithm is reducing clocks below requested clocks because GPU temperature is higher than Max Operating Temp.
const clocksEventReasonsSwThermalSlowdown =
    'clocks_event_reasons.sw_thermal_slowdown';

/// SW Thermal capping algorithm is reducing clocks below requested clocks because GPU temperature is higher than Max Operating Temp.
const clocksThrottleReasonsSwThermalSlowdown =
    'clocks_throttle_reasons.sw_thermal_slowdown';

/// Sync Boost This GPU has been added to a Sync boost group with nvidia-smi or DCGM in
/// * order to maximize performance per watt. All GPUs in the sync boost group
/// * will boost to the minimum possible clocks across the entire group. Look at
/// * the event reasons for other GPUs in the system to see why those GPUs are
/// * holding this one at lower clocks.
const clocksEventReasonsSyncBoost = 'clocks_event_reasons.sync_boost';

/// Sync Boost This GPU has been added to a Sync boost group with nvidia-smi or DCGM in
/// * order to maximize performance per watt. All GPUs in the sync boost group
/// * will boost to the minimum possible clocks across the entire group. Look at
/// * the event reasons for other GPUs in the system to see why those GPUs are
/// * holding this one at lower clocks.
const clocksThrottleReasonsSyncBoost = 'clocks_throttle_reasons.sync_boost';

/// Total installed GPU memory.
const memoryTotal = 'memory.total';

/// Total memory reserved by the NVIDIA driver and firmware.
const memoryReserved = 'memory.reserved';

/// Total memory allocated by active contexts.
const memoryUsed = 'memory.used';

/// Total free memory.
const memoryFree = 'memory.free';

/// The compute mode flag indicates whether individual or multiple compute applications may run on the GPU.
/// "0: Default" means multiple contexts are allowed per device.
/// "1: Exclusive_Thread", deprecated, use Exclusive_Process instead
/// "2: Prohibited" means no contexts are allowed per device (no compute apps).
/// "3: Exclusive_Process" means only one context is allowed per device, usable from multiple threads at a time.
const computeMode = 'compute_mode';

/// The CUDA Compute Capability, represented as Major DOT Minor.
const computeCap = 'compute_cap';

/// Percent of time over the past sample period during which one or more kernels was executing on the GPU.
/// The sample period may be between 1 second and 1/6 second depending on the product.
const utilizationGpu = 'utilization.gpu';

/// Percent of time over the past sample period during which global (device) memory was being read or written.
/// The sample period may be between 1 second and 1/6 second depending on the product.
const utilizationMemory = 'utilization.memory';

/// Percent of time over the past sample period during which one or more kernels was executing on the Encoder Engine.
/// The sample period may be between 1 second and 1/6 second depending on the product.
const utilizationEncoder = 'utilization.encoder';

/// Percent of time over the past sample period during which one or more kernels was executing on the Decoder Engine.
/// The sample period may be between 1 second and 1/6 second depending on the product.
const utilizationDecoder = 'utilization.decoder';

/// Percent of time over the past sample period during which one or more kernels was executing on the Jpeg Engine.
/// The sample period may be between 1 second and 1/6 second depending on the product.
const utilizationJpeg = 'utilization.jpeg';

/// Percent of time over the past sample period during which one or more kernels was executing on the Optical Flow Accelerator Engine.
/// The sample period may be between 1 second and 1/6 second depending on the product.
const utilizationOfa = 'utilization.ofa';

/// Number of encoder sessions running on the GPU.
const encoderStatsSessioncount = 'encoder.stats.sessionCount';

/// Average FPS of all sessions running on the GPU.
const encoderStatsAveragefps = 'encoder.stats.averageFps';

/// Average latency in microseconds of all sessions running on the GPU.
const encoderStatsAveragelatency = 'encoder.stats.averageLatency';

/// The ECC mode that the GPU is currently operating under.
const eccModeCurrent = 'ecc.mode.current';

/// The ECC mode that the GPU will operate under after the next reboot.
const eccModePending = 'ecc.mode.pending';

/// Errors detected in global device memory.
const eccErrorsCorrectedVolatileDeviceMemory =
    'ecc.errors.corrected.volatile.device_memory';

/// Errors detected in global device memory.
const eccErrorsCorrectedVolatileDram = 'ecc.errors.corrected.volatile.dram';

/// Errors detected in register file memory.
const eccErrorsCorrectedVolatileRegisterFile =
    'ecc.errors.corrected.volatile.register_file';

/// Errors detected in the L1 cache.
const eccErrorsCorrectedVolatileL1Cache =
    'ecc.errors.corrected.volatile.l1_cache';

/// Errors detected in the L2 cache.
const eccErrorsCorrectedVolatileL2Cache =
    'ecc.errors.corrected.volatile.l2_cache';

/// Parity errors detected in texture memory.
const eccErrorsCorrectedVolatileTextureMemory =
    'ecc.errors.corrected.volatile.texture_memory';

/// Parity errors detected in CBU.
const eccErrorsCorrectedVolatileCbu = 'ecc.errors.corrected.volatile.cbu';

/// Errors detected in global SRAMs.
const eccErrorsCorrectedVolatileSram = 'ecc.errors.corrected.volatile.sram';

/// Total errors detected across entire chip.
const eccErrorsCorrectedVolatileTotal = 'ecc.errors.corrected.volatile.total';

/// Errors detected in global device memory.
const eccErrorsCorrectedAggregateDeviceMemory =
    'ecc.errors.corrected.aggregate.device_memory';

/// Errors detected in global device memory.
const eccErrorsCorrectedAggregateDram = 'ecc.errors.corrected.aggregate.dram';

/// Errors detected in register file memory.
const eccErrorsCorrectedAggregateRegisterFile =
    'ecc.errors.corrected.aggregate.register_file';

/// Errors detected in the L1 cache.
const eccErrorsCorrectedAggregateL1Cache =
    'ecc.errors.corrected.aggregate.l1_cache';

/// Errors detected in the L2 cache.
const eccErrorsCorrectedAggregateL2Cache =
    'ecc.errors.corrected.aggregate.l2_cache';

/// Parity errors detected in texture memory.
const eccErrorsCorrectedAggregateTextureMemory =
    'ecc.errors.corrected.aggregate.texture_memory';

/// Parity errors detected in CBU.
const eccErrorsCorrectedAggregateCbu = 'ecc.errors.corrected.aggregate.cbu';

/// Errors detected in global SRAMs.
const eccErrorsCorrectedAggregateSram = 'ecc.errors.corrected.aggregate.sram';

/// Total errors detected across entire chip.
const eccErrorsCorrectedAggregateTotal = 'ecc.errors.corrected.aggregate.total';

/// Errors detected in global device memory.
const eccErrorsUncorrectedVolatileDeviceMemory =
    'ecc.errors.uncorrected.volatile.device_memory';

/// Errors detected in global device memory.
const eccErrorsUncorrectedVolatileDram = 'ecc.errors.uncorrected.volatile.dram';

/// Errors detected in register file memory.
const eccErrorsUncorrectedVolatileRegisterFile =
    'ecc.errors.uncorrected.volatile.register_file';

/// Errors detected in the L1 cache.
const eccErrorsUncorrectedVolatileL1Cache =
    'ecc.errors.uncorrected.volatile.l1_cache';

/// Errors detected in the L2 cache.
const eccErrorsUncorrectedVolatileL2Cache =
    'ecc.errors.uncorrected.volatile.l2_cache';

/// Parity errors detected in texture memory.
const eccErrorsUncorrectedVolatileTextureMemory =
    'ecc.errors.uncorrected.volatile.texture_memory';

/// Parity errors detected in CBU.
const eccErrorsUncorrectedVolatileCbu = 'ecc.errors.uncorrected.volatile.cbu';

/// Errors detected in global SRAMs.
const eccErrorsUncorrectedVolatileSram = 'ecc.errors.uncorrected.volatile.sram';

/// Total errors detected across entire chip.
const eccErrorsUncorrectedVolatileTotal =
    'ecc.errors.uncorrected.volatile.total';

/// Errors detected in global device memory.
const eccErrorsUncorrectedAggregateDeviceMemory =
    'ecc.errors.uncorrected.aggregate.device_memory';

/// Errors detected in global device memory.
const eccErrorsUncorrectedAggregateDram =
    'ecc.errors.uncorrected.aggregate.dram';

/// Errors detected in register file memory.
const eccErrorsUncorrectedAggregateRegisterFile =
    'ecc.errors.uncorrected.aggregate.register_file';

/// Errors detected in the L1 cache.
const eccErrorsUncorrectedAggregateL1Cache =
    'ecc.errors.uncorrected.aggregate.l1_cache';

/// Errors detected in the L2 cache.
const eccErrorsUncorrectedAggregateL2Cache =
    'ecc.errors.uncorrected.aggregate.l2_cache';

/// Parity errors detected in texture memory.
const eccErrorsUncorrectedAggregateTextureMemory =
    'ecc.errors.uncorrected.aggregate.texture_memory';

/// Parity errors detected in CBU.
const eccErrorsUncorrectedAggregateCbu = 'ecc.errors.uncorrected.aggregate.cbu';

/// Errors detected in global SRAMs.
const eccErrorsUncorrectedAggregateSram =
    'ecc.errors.uncorrected.aggregate.sram';

/// Total errors detected across entire chip.
const eccErrorsUncorrectedAggregateTotal =
    'ecc.errors.uncorrected.aggregate.total';

/// The number of GPU device memory pages that have been retired due to multiple single bit ECC errors.
const retiredPagesSingleBitEccCount = 'retired_pages.single_bit_ecc.count';

/// The number of GPU device memory pages that have been retired due to multiple single bit ECC errors.
const retiredPagesSbe = 'retired_pages.sbe';

/// The number of GPU device memory pages that have been retired due to a double bit ECC error.
const retiredPagesDoubleBitCount = 'retired_pages.double_bit.count';

/// The number of GPU device memory pages that have been retired due to a double bit ECC error.
const retiredPagesDbe = 'retired_pages.dbe';

/// Checks if any GPU device memory pages are pending retirement on the next reboot. Pages that are pending retirement can still be allocated, and may cause further reliability issues.
const retiredPagesPending = 'retired_pages.pending';

/// Core GPU temperature. in degrees C.
const temperatureGpu = 'temperature.gpu';

/// GPU T.Limit temperature. in degrees C.
const temperatureGpuTlimit = 'temperature.gpu.tlimit';

/// HBM memory temperature. in degrees C.
const temperatureMemory = 'temperature.memory';

/// A flag that indicates whether power management is enabled. Either "Supported" or "[Not Supported]". Requires Inforom PWR object version 3.0 or higher or Kepler device.
const powerManagement = 'power.management';

/// The last measured power draw for the entire board, in watts. On Ampere or newer devices, returns average power draw over 1 sec. On older devices, returns instantaneous power draw. Only available if power management is supported. This reading is accurate to within +/- 5 watts.
const powerDraw = 'power.draw';

/// The last measured average power draw for the entire board, in watts. Only available if power management is supported and Ampere (except GA100) or newer devices. This reading is accurate to within +/- 5 watts.
const powerDrawAverage = 'power.draw.average';

/// The last measured instant power draw for the entire board, in watts. Only available if power management is supported. This reading is accurate to within +/- 5 watts.
const powerDrawInstant = 'power.draw.instant';

/// The software power limit in watts. Set by software like nvidia-smi. On Kepler devices Power Limit can be adjusted using [-pl | --power-limit=] switches.
const powerLimit = 'power.limit';

/// The power management algorithm's power ceiling, in watts. Total board power draw is manipulated by the power management algorithm such that it stays under this value. This value is the minimum of various power limiters.
const enforcedPowerLimit = 'enforced.power.limit';

/// The default power management algorithm's power ceiling, in watts. Power Limit will be set back to Default Power Limit after driver unload.
const powerDefaultLimit = 'power.default_limit';

/// The minimum value in watts that power limit can be set to.
const powerMinLimit = 'power.min_limit';

/// The maximum value in watts that power limit can be set to.
const powerMaxLimit = 'power.max_limit';

/// Current frequency of graphics (shader) clock.
const clocksCurrentGraphics = 'clocks.current.graphics';

/// Current frequency of graphics (shader) clock.
const clocksGr = 'clocks.gr';

/// Current frequency of SM (Streaming Multiprocessor) clock.
const clocksCurrentSm = 'clocks.current.sm';

/// Current frequency of SM (Streaming Multiprocessor) clock.
const clocksSm = 'clocks.sm';

/// Current frequency of memory clock.
const clocksCurrentMemory = 'clocks.current.memory';

/// Current frequency of memory clock.
const clocksMem = 'clocks.mem';

/// Current frequency of video encoder/decoder clock.
const clocksCurrentVideo = 'clocks.current.video';

/// Current frequency of video encoder/decoder clock.
const clocksVideo = 'clocks.video';

/// User specified frequency of graphics (shader) clock.
const clocksApplicationsGraphics = 'clocks.applications.graphics';

/// User specified frequency of graphics (shader) clock.
const clocksApplicationsGr = 'clocks.applications.gr';

/// User specified frequency of memory clock.
const clocksApplicationsMemory = 'clocks.applications.memory';

/// User specified frequency of memory clock.
const clocksApplicationsMem = 'clocks.applications.mem';

/// Default frequency of applications graphics (shader) clock.
const clocksDefaultApplicationsGraphics =
    'clocks.default_applications.graphics';

/// Default frequency of applications graphics (shader) clock.
const clocksDefaultApplicationsGr = 'clocks.default_applications.gr';

/// Default frequency of applications memory clock.
const clocksDefaultApplicationsMemory = 'clocks.default_applications.memory';

/// Default frequency of applications memory clock.
const clocksDefaultApplicationsMem = 'clocks.default_applications.mem';

/// Maximum frequency of graphics (shader) clock.
const clocksMaxGraphics = 'clocks.max.graphics';

/// Maximum frequency of graphics (shader) clock.
const clocksMaxGr = 'clocks.max.gr';

/// Maximum frequency of SM (Streaming Multiprocessor) clock.
const clocksMaxSm = 'clocks.max.sm';

/// Maximum frequency of memory clock.
const clocksMaxMemory = 'clocks.max.memory';

/// Maximum frequency of memory clock.
const clocksMaxMem = 'clocks.max.mem';

/// The MIG mode that the GPU is currently operating under.
const migModeCurrent = 'mig.mode.current';

/// The MIG mode that the GPU will operate under after reset.
const migModePending = 'mig.mode.pending';

/// The current status of GSP firmware.
const gspModeCurrent = 'gsp.mode.current';

/// The default status of GSP firmware.
const gspModeDefault = 'gsp.mode.default';

/// A flag the indicates whether the device is in C2C mode, if supported.May be either "Enabled" or "Disabled".
const c2cMode = 'c2c.mode';

/// Total installed GPU conf compute protected memory.
const protectedMemoryTotal = 'protected_memory.total';

/// Total conf compute protected memory allocated by active contexts.
const protectedMemoryUsed = 'protected_memory.used';

/// Total free conf compute protected memory.
const protectedMemoryFree = 'protected_memory.free';

/// Current state of GPU fabric registration process.
const fabricState = 'fabric.state';

/// Error status, valid only if gpu fabric registration state is "completed"
const fabricStatus = 'fabric.status';
