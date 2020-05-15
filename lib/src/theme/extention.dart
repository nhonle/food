import 'package:flutter/material.dart';

extension PaddingHelper on Widget {
  Padding get p16 => Padding(padding: EdgeInsets.all(16), child: this);

  Padding get p8 => Padding(padding: EdgeInsets.all(8), child: this);
  /// Set padding according to `value`
  Padding p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
}

extension ExAlignment on Widget{
  Widget get alignTopCenter => Align(child: this,alignment: Alignment.topCenter,);
  Widget get alignCenter => Align(child: this,alignment: Alignment.center,);
  Widget get alignBottomCenter => Align(child: this,alignment: Alignment.bottomCenter,);
  Widget get alignBottomLeft => Align(child: this,alignment: Alignment.bottomLeft,);
}

extension OnPressed on Widget {
  Widget  ripple(Function onPressed) => Stack(
      children: <Widget>[
        this,
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: FlatButton(
            highlightColor: Colors.white.withAlpha(150),
            splashColor: Colors.red.withAlpha(200),
              onPressed: () {
                if (onPressed != null) {
                  onPressed();
                }
              },
              child: Container()),
        )
      ],
    );
}