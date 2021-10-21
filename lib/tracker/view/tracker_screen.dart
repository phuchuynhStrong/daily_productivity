import 'dart:math';

import 'package:daily_productivity/l10n/l10n.dart';
import 'package:daily_productivity/styles.dart';
import 'package:daily_productivity/tracker/view/social_network_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({Key? key}) : super(key: key);

  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final random = Random();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final tasks = random.nextDouble() * 1000;
    final percent = tasks ~/ 10;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(Insets.lg * 1.5),
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      padding: EdgeInsets.all(Insets.lg),
                      child: const Icon(
                        FontAwesomeIcons.angleLeft,
                        size: IconSizes.sm,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Insets.xl,
            ),
            Text(
              l10n.myTracker,
              style: textTheme.button,
            ),
            SizedBox(
              height: Insets.lg,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Insets.lg * 4,
              ),
              child: Text(
                'You finished $percent% of your task',
                textAlign: TextAlign.center,
                style: textTheme.headline4?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: Insets.xl * 2),
            SleekCircularSlider(
              max: 1000,
              initialValue: tasks,
              appearance: CircularSliderAppearance(
                startAngle: 140,
                angleRange: 260,
                customColors: CustomSliderColors(
                  trackColor: Colors.grey.withOpacity(0.1),
                  progressBarColor: Colors.orange,
                  dotColor: Colors.orange,
                ),
                customWidths: CustomSliderWidths(
                  trackWidth: 15,
                  progressBarWidth: 16,
                ),
              ),
              onChange: (double value) {},
              onChangeStart: (double startValue) {},
              onChangeEnd: (double endValue) {},
              innerWidget: (double value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.fire,
                      color: Colors.orange,
                    ),
                    SizedBox(height: Insets.sm),
                    Text(
                      tasks.toInt().toString(),
                      style: textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      l10n.fantastic,
                      style: textTheme.caption,
                    )
                  ],
                );
              },
            ),
            SizedBox(height: Insets.xl * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SocialNetworkButton(
                  icon: FontAwesomeIcons.facebook,
                  title: 'Facebook',
                ),
                SocialNetworkButton(
                  icon: FontAwesomeIcons.twitter,
                  title: 'Twitter',
                ),
                SocialNetworkButton(
                  icon: FontAwesomeIcons.instagram,
                  title: 'Instagram',
                ),
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(Corners.radiusVal * 3),
                  onTap: () {},
                  child: Card(
                    color: const Color(0xff06122c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Corners.radiusVal * 3,
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(Insets.lg * 2),
                      child: Text(
                        l10n.viewDetail,
                        textAlign: TextAlign.center,
                        style: textTheme.subtitle1?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Insets.xl * 2,
            ),
          ],
        ),
      ),
    );
  }
}
