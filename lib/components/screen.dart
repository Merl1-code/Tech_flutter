import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    this.child,
    this.header,
    this.footer,
    this.backgroundColor,
    this.padding,
  });

  final Widget child;
  final Widget header;
  final Widget footer;
  final Color backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final Widget body = Expanded(
      child: SingleChildScrollView(
        padding: padding,
        physics: const AlwaysScrollableScrollPhysics(),
        child: child,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            if (header != null) header,
            if (child != null) body,
            if (footer != null) footer,
          ],
        ),
      ),
    );
  }
}
