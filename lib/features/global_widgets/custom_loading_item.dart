import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomShimmerEffect extends StatelessWidget {
  final Widget child;
  final bool? isLoading;
  final bool? leaf;

  const CustomShimmerEffect(
      {super.key,
      required this.child,
      this.isLoading = false,
      this.leaf = false});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        highlightColor: Colors.grey.shade50,
        baseColor: Colors.grey.shade200,
        // begin: Alignment.topLeft,
        begin: const Alignment(-1, -1),
        end: const Alignment(1, -0.7),
        duration: const Duration(seconds: 2),
      ),
      enabled: isLoading ?? false,
      child: leaf ?? false ? Skeleton.leaf(child: child) : child,
    );
  }

}

class CustomShimmerEffectSliver extends StatelessWidget {
  final Widget child;
  final bool? isLoading;

  const CustomShimmerEffectSliver(
      {super.key, required this.child, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      effect: ShimmerEffect(
        highlightColor: Colors.grey.shade50,
        baseColor: Colors.grey.shade200,
        // begin: Alignment.topLeft,
        begin: const Alignment(-1, -1),
        end: const Alignment(1, -0.7),
        duration: const Duration(seconds: 2),
      ),
      enabled: isLoading ?? false,
      child: child,
    );
  }
}
