import 'package:flutter/material.dart';
import 'package:tzaker_task/core/constants/screens.dart' as routes;
import 'package:tzaker_task/ticket/view/pages/create_ticket_page.dart';
import 'package:tzaker_task/ticket/view/pages/open_image_page.dart';
import 'package:tzaker_task/ticket/view/pages/tickets_details_page.dart';
import 'package:tzaker_task/ticket/view/pages/tickets_page.dart';

import 'custom_page_route.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const TicketsPage();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case routes.ticketDetailsRoute:
        return MaterialPageRoute(builder: (_) => const TicketDetailsPage());
      case routes.createTicketRoute:
        return MaterialPageRoute(builder: (_) => const CreateTicketPage());
      case routes.ticketsRoute:
        return MaterialPageRoute(builder: (_) => const TicketsPage());
      case routes.openImageRoute:
        final String imageUrl = settings.arguments as String;
        return CustomPageRoute(
          child:
              OpenImagePage(
            imageUrl: imageUrl,
          ),


        );
      default:
        return null;
    }
  }
}
