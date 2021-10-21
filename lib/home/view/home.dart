import 'package:daily_productivity/home/cubit/home_cubit.dart';
import 'package:daily_productivity/home/view/home_appbar.dart';
import 'package:daily_productivity/l10n/l10n.dart';
import 'package:daily_productivity/resources/resources.dart';
import 'package:daily_productivity/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<HomeCubit>();
    return Column(
      children: [
        const HomeAppBar(),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(Insets.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Corners.radiusVal * 3),
                  ),
                  child: InkWell(
                    onTap: cubit.openTheWayToMyWorld,
                    child: Padding(
                      padding: EdgeInsets.all(Insets.lg),
                      child: Column(
                        children: [
                          const Icon(
                            FontAwesomeIcons.placeOfWorship,
                            size: IconSizes.lg,
                            color: Colors.white,
                          ),
                          SizedBox(height: Insets.med),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l10n.welcomeToMyWorld,
                                style: textTheme.headline6?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                l10n.androidker,
                                style: textTheme.headline6?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Insets.xl,
                  ),
                  child: Text(
                    l10n.todayTask,
                    style: textTheme.headline5,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Card(
                                color: const Color(0xfff9f9f9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Corners.radiusVal * 3),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(Insets.lg * 2),
                                  alignment: Alignment.center,
                                  child: Text(
                                    l10n.newTask,
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodyText2?.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: Insets.lg),
                            Expanded(
                              flex: 2,
                              child: Card(
                                color: const Color(0xfff8f1e5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Corners.radiusVal * 3),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(Insets.lg * 2),
                                  alignment: Alignment.center,
                                  child: Image.asset(Images.blueBook),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: Insets.lg),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Card(
                                color: const Color(0xffe7f9f4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Corners.radiusVal * 3),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(Insets.lg * 2),
                                  child: Image.asset(Images.ballons),
                                ),
                              ),
                            ),
                            SizedBox(height: Insets.lg),
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(
                                    Corners.radiusVal * 3),
                                onTap: () => cubit.onViewTasksPressed(context),
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          l10n.viewTask,
                                          textAlign: TextAlign.center,
                                          style: textTheme.subtitle1?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: Insets.sm),
                                        Text(
                                          '+8 ${l10n.task}',
                                          textAlign: TextAlign.center,
                                          style: textTheme.caption?.copyWith(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
