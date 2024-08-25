import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../../my_theme_data.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Light Theme Option
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "light".tr(),
                  style: provider.mode == ThemeMode.light
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryColor)
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryDarkColor),

                ),
                if (provider.mode == ThemeMode.light)
                  Icon(
                    Icons.done,
                    size: 30,
                    color: primaryColor,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Dark Theme Option
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "dark".tr(),
                  style: provider.mode == ThemeMode.dark
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: yellowColor)
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(color: primaryDarkColor),

                ),
                if (provider.mode == ThemeMode.dark)
                  Icon(
                    Icons.done,
                    size: 30,
                    color: primaryColor,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
