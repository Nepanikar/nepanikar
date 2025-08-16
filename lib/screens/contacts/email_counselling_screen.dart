import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/screens/contacts/crisis_message_screen.dart';
part 'email_counselling_screen.g.dart';

@TypedGoRoute<EmailCounsellingRoute>(
  path: '/contacts/email-counselling',
)
class EmailCounsellingRoute extends GoRouteData with _$EmailCounsellingRoute {

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
