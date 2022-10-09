import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/theme.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff2C0B4A).withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
          BoxShadow(
            color: const Color(0xff280446).withOpacity(0.12),
            blurRadius: 48,
            offset: const Offset(0, 16), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                      child: Assets.illustrations.modules.selfHarm.svg(),
                    ),
                    Assets.icons.navigation.arrowRight.svg(width: 16, height: 16)
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Chci si ublížit",
                      style: NepanikarTheme.bodyHeavy,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
