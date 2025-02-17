import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/resources.dart';

Shimmer loadingShimmer({required Widget child}) {
  return Shimmer.fromColors(
      baseColor: R.colors.baseColorShimmer,
      highlightColor: R.colors.highlightColorShimmer,
      enabled: true,
      child: child);
}
