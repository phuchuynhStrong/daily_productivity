import 'package:daily_productivity/styles.dart';
import 'package:flutter/material.dart';

class SocialNetworkButton extends StatelessWidget {
  const SocialNetworkButton({Key? key, required this.icon, this.title})
      : super(key: key);
  final IconData icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.1),
            ),
            padding: EdgeInsets.all(Insets.lg),
            child: Icon(
              icon,
              size: IconSizes.sm * 2,
            ),
          ),
          if (title != null)
            Container(
              margin: EdgeInsets.only(
                top: Insets.lg,
              ),
              child: Text(title!, style: textTheme.button),
            ),
        ],
      ),
    );
  }
}
