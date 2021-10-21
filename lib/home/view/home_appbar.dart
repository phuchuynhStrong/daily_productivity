import 'package:daily_productivity/l10n/l10n.dart';
import 'package:daily_productivity/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget implements PreferredSize {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Container(
        margin:
            EdgeInsets.symmetric(vertical: Insets.xs, horizontal: Insets.lg),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: l10n.searchBarHint,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: Insets.lg,
                    horizontal: Insets.lg,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: IconSizes.lg,
                    color: Colors.black,
                  ),
                  hintStyle: textTheme.caption,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Corners.radiusVal * 3),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Corners.radiusVal * 3),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: Insets.lg),
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.all(Insets.sm),
              icon: const Icon(
                FontAwesomeIcons.solidBell,
                size: IconSizes.med,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
