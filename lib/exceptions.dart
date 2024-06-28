class NvidiaSmiException implements Exception {
  final int exitCode;
  final String stderr;
  final String stdout;

  NvidiaSmiException({
    required this.exitCode,
    required this.stderr,
    required this.stdout,
  });

  @override
  String toString() => 'NvidiaSmiException($exitCode)';
}
