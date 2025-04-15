import 'package:equatable/equatable.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc() : super(const ScanState()) {
    on<StartScanning>(_onStartScanning);
    on<StopScanning>(_onStopScanning);
    on<QRCodeScanned>(_onQRCodeScanned);
  }

  void _onStartScanning(StartScanning event, Emitter<ScanState> emit) {
    emit(state.copyWith(
      status: FormStatus.loading,
      isScanning: true,
    ));
  }

  void _onStopScanning(StopScanning event, Emitter<ScanState> emit) {
    emit(state.copyWith(
      isScanning: false,
    ));
  }

  void _onQRCodeScanned(QRCodeScanned event, Emitter<ScanState> emit) {
    emit(state.copyWith(
      status: event.code == null ? FormStatus.idle : FormStatus.success,
      isScanning: false,
      scannedCode: event.code,
    ));
  }
}
