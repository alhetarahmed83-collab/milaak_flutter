import 'package:flutter/material.dart';

import '../../app/theme.dart';
import 'milaak_ui.dart';

Future<T?> showMilaakSheet<T>(BuildContext context, Widget child) {
  final media = MediaQuery.of(context);
  final bottomSafe = media.padding.bottom;

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      final sheetMedia = MediaQuery.of(context);
      final sheetBottomSafe = sheetMedia.padding.bottom;
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: sheetBottomSafe),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: sheetMedia.size.height * .92,
              ),
              child: MilaakGlassPanel(
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.fromLTRB(
                  18,
                  14,
                  18,
                  sheetMedia.viewInsets.bottom + bottomSafe + 18,
                ),
                blurSigma: 20,
                radius: 30,
                fillColor: MilaakColors.glassSurfaceFor(context, strong: true),
                borderColor: MilaakColors.glassBorderFor(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 48,
                      height: 5,
                      decoration: BoxDecoration(
                        color: MilaakColors.glassBorderFor(context),
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Flexible(child: child),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w800),
      ),
    );
  }
}
