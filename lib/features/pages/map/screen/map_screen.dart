import 'package:flutter/material.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';
import 'package:recycling_app/features/pages/map/widgets/marker_item.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  static const String routeName = '/map';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController textEditingController = TextEditingController();
  Size screenSize = Size.zero;

  @override
  void didChangeDependencies() {
    screenSize = MediaQuery.of(context).size;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(45.r)),
        ),
        centerTitle: true,
        title: Text(
          "BIN LOCATOR",
          style: AppTextStyle.nunitoSemiBold.copyWith(fontSize: 30.sp),
        ),
      ),
      body: SafeArea(
        top: false,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  indoorViewEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: state.userLocationStatus.isSuccess &&
                            state.userLocation != null
                        ? state.userLocation!
                        : const LatLng(41.311081, 69.240562),
                    zoom: 15,
                  ),
                  myLocationEnabled: true,
                  markers: _createMarkers(state.markers),
                  polylines: state.polyLines ?? {},
                  onMapCreated: (controller) {
                    context.read<MapBloc>().setMapController(controller);
                    context.read<MapBloc>().add(LoadUserLocation());
                  },
                ),
                if (state.userLocation == null &&
                    state.userLocationStatus.isLoading)
                   Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: AppColors.c70B458,
                    ),
                  ),
                Positioned(
                  top: screenSize.height * .11.sp,
                  left: 0,
                  right: 0,
                  child: GlobalTextField(
                    hintText: "EX) STATE COLLEGE, PA",
                    textEditingController: textEditingController,
                  ),
                ),
                Positioned(
                  bottom: screenSize.height * .02.sp,
                  right: screenSize.width * .2.sp,
                  left: screenSize.width * .2.sp,
                  child: GlobalButton(
                      isLoading: state.polyLineStatus.isLoading,
                      title: "LOCATE NEAREST",
                      onTap: () {
                        context
                            .read<MapBloc>()
                            .add(DrawPolylineToNearestMarker());
                      }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Set<Marker> _createMarkers(List<MarkersModel> markers) {
    Set<Marker> markerSet = {};
    int i = 0;
    for (MarkersModel markerModel in markers) {
      markerSet.add(
        Marker(
            markerId: MarkerId(i.toString()),
            icon: AssetMapBitmap(AppImages.location, height: 38.h),
            position: markerModel.latLng,
            onTap: () {
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                useSafeArea: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => RecyclingModal(markerModel: markerModel),
              );
            }),
      );
      i++;
    }
    return markerSet;
  }
}
