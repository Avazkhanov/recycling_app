part of 'scan_bloc.dart';

class ScanState extends Equatable {
  final FormStatus status;
  final bool isScanning;
  final String? scannedCode;
  final String? errorMessage;

  const ScanState({
    this.status = FormStatus.idle,
    this.isScanning = false,
    this.scannedCode,
    this.errorMessage,
  });

  ScanState copyWith({
    FormStatus? status,
    bool? isScanning,
    String? scannedCode,
    String? errorMessage,
  }) {
    return ScanState(
      status: status ?? this.status,
      isScanning: isScanning ?? this.isScanning,
      scannedCode: scannedCode ?? this.scannedCode,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, isScanning, scannedCode, errorMessage];
}
