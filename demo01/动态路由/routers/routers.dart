import 'package:flutter/material.dart';
import "../home.dart";
import "../myPage.dart";

final Map<String,Function> routes = {
  "/":(contxt)=>const Home(),
  "/myPageA":(contxt)=>const MyPageA(),
};

var onGenerateRoute = (RouteSettings settings) {
	// 统一处理
	final String? name = settings.name;
	final Function? pageContentBuilder = routes[name];
	if (pageContentBuilder != null) {
        if (settings.arguments != null) {
            final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
            return route;
        } else {
            final Route route =
                MaterialPageRoute(builder: (context) => pageContentBuilder(context));
            return route;
        }
	}
	return null;
};

