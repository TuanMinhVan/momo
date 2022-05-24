import 'dart:math' as math;

import 'package:flutter/foundation.dart';

import '../../core/styles/style.dart';

const double _kOffset = 30.0;
const double _kHeight = 8.0;
const double _kBottomOffset = _kOffset + 0.707 * _kHeight;
const Rect _kRect =
    Rect.fromLTWH(-_kOffset * 2, _kOffset - _kHeight, _kOffset * 4.0, _kHeight);

class BannerPainter extends CustomPainter {
  BannerPainter({
    required this.textDirection,
    required this.location,
    required this.layoutDirection,
    required this.color,
  }) : super(repaint: PaintingBinding.instance!.systemFonts);

  final TextDirection textDirection;

  final BannerLocation location;

  final TextDirection layoutDirection;
  final Color color;

  static const BoxShadow _shadow = BoxShadow(
    color: Color(0x7F000000),
    blurRadius: 6.0,
  );

  bool _prepared = false;
  late Paint _paintShadow;
  late Paint _paintBanner;

  void _prepare() {
    _paintShadow = _shadow.toPaint();
    _paintBanner = Paint()..color = color;
    _prepared = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (!_prepared) _prepare();
    canvas
      ..translate(_translationX(size.width), _translationY(size.height))
      ..rotate(_rotation)
      ..drawRect(_kRect, _paintShadow)
      ..drawRect(_kRect, _paintBanner);
  }

  @override
  bool shouldRepaint(BannerPainter oldDelegate) {
    return location != oldDelegate.location || color != oldDelegate.color;
  }

  @override
  bool hitTest(Offset position) => false;

  double _translationX(double width) {
    switch (layoutDirection) {
      case TextDirection.rtl:
        switch (location) {
          case BannerLocation.bottomEnd:
            return _kBottomOffset;
          case BannerLocation.topEnd:
            return 0.0;
          case BannerLocation.bottomStart:
            return width - _kBottomOffset;
          case BannerLocation.topStart:
            return width;
        }
      case TextDirection.ltr:
        switch (location) {
          case BannerLocation.bottomEnd:
            return width - _kBottomOffset;
          case BannerLocation.topEnd:
            return width;
          case BannerLocation.bottomStart:
            return _kBottomOffset;
          case BannerLocation.topStart:
            return 0.0;
        }
    }
  }

  double _translationY(double height) {
    switch (location) {
      case BannerLocation.bottomStart:
      case BannerLocation.bottomEnd:
        return height - _kBottomOffset;
      case BannerLocation.topStart:
      case BannerLocation.topEnd:
        return 0.0;
    }
  }

  double get _rotation {
    switch (layoutDirection) {
      case TextDirection.rtl:
        switch (location) {
          case BannerLocation.bottomStart:
          case BannerLocation.topEnd:
            return -math.pi / 4.0;
          case BannerLocation.bottomEnd:
          case BannerLocation.topStart:
            return math.pi / 4.0;
        }
      case TextDirection.ltr:
        switch (location) {
          case BannerLocation.bottomStart:
          case BannerLocation.topEnd:
            return math.pi / 4.0;
          case BannerLocation.bottomEnd:
          case BannerLocation.topStart:
            return -math.pi / 4.0;
        }
    }
  }
}

class BannerCustom extends StatelessWidget {
  const BannerCustom({
    Key? key,
    this.child,
    this.textDirection,
    required this.location,
    this.layoutDirection,
    required this.color,
  }) : super(key: key);
  final Widget? child;

  final TextDirection? textDirection;

  final BannerLocation location;

  final TextDirection? layoutDirection;

  final Color color;

  @override
  Widget build(BuildContext context) {
    assert((textDirection != null && layoutDirection != null) ||
        debugCheckHasDirectionality(context));
    return CustomPaint(
      foregroundPainter: BannerPainter(
        textDirection: textDirection ?? Directionality.of(context),
        location: location,
        layoutDirection: layoutDirection ?? Directionality.of(context),
        color: color,
      ),
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<TextDirection>('textDirection', textDirection,
        defaultValue: null));
    properties.add(EnumProperty<BannerLocation>('location', location));
    properties.add(EnumProperty<TextDirection>(
        'layoutDirection', layoutDirection,
        defaultValue: null));
    properties.add(ColorProperty('color', color, showName: false));
  }
}
