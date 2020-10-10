import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    this.body,
    this.header,
    this.footer,
    this.backgroundColor,
    this.padding,
  });

  final Widget body;
  final Widget header;
  final Widget footer;
  final Color backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final Widget wrappedBody = Expanded(
      child: SingleChildScrollView(
        padding: padding,
        physics: const AlwaysScrollableScrollPhysics(),
        child: body,
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            if (header != null) header,
            if (body != null) wrappedBody,
            if (footer != null) footer,
          ],
        ),
      ),
    );
  }
}
