import 'package:flutter/material.dart';
import 'package:Tech_flutter/components/screen.dart';
import 'package:Tech_flutter/components/header.dart';
import 'package:Tech_flutter/components/navbar.dart';

class Route {
  const Route(this.route, this.widget, this.icon);

  final String route;
  final Widget widget;
  final IconData icon;
}

class NavScreen extends StatefulWidget {
  const NavScreen({
    this.initiaRoute,
    this.routes,
  });

  final String initiaRoute;
  final List<Route> routes;

  @override
  _NavScreenState createState() {
    final Map<String, IconData> navbarRoutes = <String, IconData>{
      for (final Route route in routes) route.route: route.icon
    };
    return _NavScreenState(initiaRoute, navbarRoutes);
  }
}

class _NavScreenState extends State<NavScreen> {
  _NavScreenState(this.currentRoute, this.navbarRoutes);

  String currentRoute;
  final Map<String, IconData> navbarRoutes;

  void _onNavigate(String to) {
    setState(() {
      currentRoute = to;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      header: Header(),
      footer: Navbar(
        currentRoute: currentRoute,
        routes: navbarRoutes,
        onNavigate: _onNavigate,
      ),
      body: widget.routes
          .singleWhere((final Route r) => r.route == currentRoute)
          .widget,
    );
  }
}
