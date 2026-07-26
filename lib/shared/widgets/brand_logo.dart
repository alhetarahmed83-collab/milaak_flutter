import 'package:flutter/material.dart';

import '../../app/theme.dart';
import 'milaak_ui.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 44, this.showText = true});

  final double size;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    return MilaakLogoMark(
      size: size,
      showText: showText,
      darkTile: MilaakColors.isDark(context),
    );
  }
}
