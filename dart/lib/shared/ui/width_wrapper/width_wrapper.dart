import 'package:flutter/cupertino.dart';

class WidthWrapper extends StatelessWidget{
  final Widget child;
  final double maxWidth;

  const WidthWrapper({
    required this.child,
    this.maxWidth = 800,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: this.maxWidth),
        child: this.child,
      )
    );
  }

}