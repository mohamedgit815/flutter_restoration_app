import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_restoration_app/next_page.dart';

class RouteGenerators {

  static const String routeNextPage = '/NextPage';

  static MaterialPageRoute<dynamic> _materialPageRoute(Widget page){
    return MaterialPageRoute(builder: (_)=>page);
  }

  static CupertinoPageRoute<dynamic> _cupertinoPageRoute(Widget page){
    return CupertinoPageRoute(builder: (_)=>page);
  }


  static Route<dynamic>? onGenerate(RouteSettings settings) {
    switch(settings.name) {

      case routeNextPage : return _cupertinoPageRoute(const NextPage());
    }
    return null;
  }
}