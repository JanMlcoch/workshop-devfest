import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Screen extends StatelessWidget {
  const Screen({Key key, @required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: child,
      ),
    );
  }
}
