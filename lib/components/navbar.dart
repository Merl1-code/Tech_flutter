import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Tech_flutter/theme.dart' as theme;

const double ICON_SIZE = 34;

class Navbar extends StatelessWidget {
  Navbar({this.routes, this.currentRoute, this.onNavigate});

  final Map<String, IconData> routes;
  final String currentRoute;
  final void Function(String) onNavigate;
  final Color _selectedColor = theme.colors.primary;
  final Color _defaultColor = theme.colors.secondary;

  Color _getColor(String icon) {
    if (icon == currentRoute) {
      return _selectedColor;
    }
    return _defaultColor;
  }

  Widget _buildRouteIcon(String route, IconData icon) {
    return FlatButton(
      onPressed: () => onNavigate(route),
      child: Icon(
        icon,
        size: ICON_SIZE,
        color: _getColor(route),
      ),
    );
  }

  List<Widget> _buildAllIcons() {
    final List<Widget> icons = <Widget>[];
    routes.forEach((String route, IconData icon) {
      icons.add(_buildRouteIcon(route, icon));
    });
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 55,
      color: theme.colors.background,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildAllIcons()),
    );
  }
}
