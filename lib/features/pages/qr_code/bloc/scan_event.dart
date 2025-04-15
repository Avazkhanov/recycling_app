part of 'scan_bloc.dart';

abstract class ScanEvent {}

class StartScanning extends ScanEvent {}

class StopScanning extends ScanEvent {}

class QRCodeScanned extends ScanEvent {
  final String? code;
  QRCodeScanned(this.code);
}
