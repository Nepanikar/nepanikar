import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/screens/contacts/crisis_message_screen.dart';

class EmailCounsellingRoute extends GoRouteData {
  const EmailCounsellingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // TODO: Unsafe cast
    final extra = state.extra! as CrisisMessageRouteExtraData;
    return CrisisMessageContent(
      contactAddress: extra.contactAddress,
      subjectMessage: extra.subjectMessage,
    );
  }
}
