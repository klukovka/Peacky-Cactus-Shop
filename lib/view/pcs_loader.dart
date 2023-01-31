import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class PcsLoader extends StatelessWidget {
  final double? size;

  const PcsLoader({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: size ?? 8.w,
      color: Theme.of(context).primaryColor,
    );
  }
}
