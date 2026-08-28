import 'package:flutter/material.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_package_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// "Uložit do záchranného balíčku" toggle for one exercise, used on the Week 2
/// breathing + mindfulness technique pages.
///
/// Reflects whether the exercise is already saved, so re-opening a technique
/// shows the current state instead of offering to save it twice.
class RescueSaveButton extends StatefulWidget {
  const RescueSaveButton({super.key, required this.item});

  final BpdRescueItem item;

  @override
  State<RescueSaveButton> createState() => _RescueSaveButtonState();
}

class _RescueSaveButtonState extends State<RescueSaveButton> {
  bool? _isSaved;

  BpdRescuePackageDao get _dao => registry.get<BpdRescuePackageDao>();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final saved = await _dao.contains(widget.item.id);
    if (mounted) setState(() => _isSaved = saved);
  }

  Future<void> _toggle() async {
    final saved = await _dao.toggle(widget.item);
    if (!mounted) return;
    setState(() => _isSaved = saved);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(saved ? 'Uloženo do záchranného balíčku' : 'Odebráno ze záchranného balíčku'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final isSaved = _isSaved ?? false;

    return OutlinedButton(
      onPressed: _isSaved == null ? null : _toggle,
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        backgroundColor: isSaved ? primaryColor.withOpacity(0.1) : null,
        minimumSize: const Size(double.infinity, 48),
        side: BorderSide(color: primaryColor.withOpacity(0.5), width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isSaved ? Icons.check : Icons.medical_services_outlined, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              isSaved ? 'V záchranném balíčku' : 'Uložit do záchranného balíčku',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
