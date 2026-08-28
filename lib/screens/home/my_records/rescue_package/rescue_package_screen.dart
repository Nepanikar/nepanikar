import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/external_link_button.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_package_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'rescue_package_screen.g.dart';

@TypedGoRoute<RescuePackageRoute>(path: '/home/my-records/rescue-package')
class RescuePackageRoute extends GoRouteData with $RescuePackageRoute {
  const RescuePackageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const RescuePackageScreen();
}

/// "Záchranný balíček" — the exercises the user saved from the programme to come
/// back to when they need them.
class RescuePackageScreen extends StatelessWidget {
  const RescuePackageScreen({super.key});

  BpdRescuePackageDao get _dao => registry.get<BpdRescuePackageDao>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return NepanikarScreenWrapper(
      appBarTitle: 'Záchranný balíček',
      children: [
        StreamBuilder<List<BpdRescueItem>>(
          stream: _dao.watchAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final items = snapshot.data ?? [];
            if (items.isEmpty) return const _EmptyState();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top padding clears the 50px colored strip the wrapper
                // paints behind the page content.
                Padding(
                  padding: const EdgeInsets.only(top: 44, bottom: 14),
                  child: Text(
                    'Cvičení, která sis uložil/a v programu. Vrať se k nim, '
                    'kdykoliv je budeš potřebovat.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),
                ),
                ...items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _RescueItemCard(item: item, onRemove: () => _dao.remove(item.id)),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _RescueItemCard extends StatelessWidget {
  const _RescueItemCard({required this.item, required this.onRemove});

  final BpdRescueItem item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(item.icon, color: primaryColor, size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                      ),
                    ),
                    if (item.sourceLabel.isNotEmpty)
                      Text(item.sourceLabel, style: TextStyle(fontSize: 13, color: primaryColor)),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  size: 22,
                  color: isDarkMode ? Colors.white54 : NepanikarColors.dark.withOpacity(0.5),
                ),
                tooltip: 'Odebrat z balíčku',
                onPressed: onRemove,
              ),
            ],
          ),
          if (item.description.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              item.description,
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
              ),
            ),
          ],
          if (item.videoUrl != null) ...[
            const SizedBox(height: 4),
            ExternalLinkText(label: 'Vedené cvičení ve videu', url: item.videoUrl!),
          ],
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.medical_services_outlined, size: 40, color: primaryColor),
          ),
          const SizedBox(height: 20),
          Text(
            'Balíček je zatím prázdný',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Až si v programu uložíš nějaké cvičení, najdeš ho tady — po ruce '
            'na chvíle, kdy ho budeš potřebovat.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
