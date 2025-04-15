import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';
import 'package:recycling_app/features/pages/qr_code/widget/qr_overlay_painter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  static const String routeName = '/qr-code';

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final MobileScannerController _scannerController = MobileScannerController();
  Size size = Size.zero;

  @override
  void initState() {
    super.initState();
    _scannerController.start();
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SCAN YOUR ITEM",
          style: AppTextStyle.nunitoSemiBold
              .copyWith(fontSize: 30.sp, color: AppColors.c1A441D),
        ),
      ),
      body: BlocBuilder<ScanBloc, ScanState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(85.r),
                  child: AspectRatio(
                    aspectRatio: .7.sp,
                    child: Stack(
                      children: [
                        MobileScanner(
                          controller: _scannerController,
                          onDetect: (capture) {
                            for (final barcode in capture.barcodes) {
                              if (barcode.rawValue != null) {
                                setState(() {
                                  size = barcode.size;
                                });
                                context.read<ScanBloc>().add(QRCodeScanned(barcode.rawValue!));
                                break;
                              } else {
                                setState(() {
                                  size = Size.zero;
                                });
                                break;
                              }
                            }
                          },
                        ),
                        CustomPaint(
                          painter: QrOverlayPainter(size: size),
                          child: Container(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              32.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 124.w),
                child: GlobalButton(
                  title: "SCAN",
                  onTap: () {
                    if (state.scannedCode != null) {
                      showDialog(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          backgroundColor: AppColors.cC6E5BA,
                          title: Text(
                            'Scanned QR code',
                            style: AppTextStyle.nunitoSemiBold.copyWith(
                              fontSize: 20.sp,
                              color: AppColors.c1A441D,
                            ),
                          ),
                          content: Text(
                            state.scannedCode!,
                            style: AppTextStyle.nunitoSemiBold.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          actions: [
                            GlobalButton(
                              title: "Close",
                              onTap: () {
                                context.read<ScanBloc>().add(QRCodeScanned(null));
                                AppRouter.router.pop();
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
