import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:u_attend/src/blocs/lesson/lesson_bloc.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/widgets/teacher_bottom_navigation.dart';

class LessonView extends HookWidget {
  final navigationIndex = 1;

  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = useState(Theme.of(context));

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.value.scaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: theme.value.cardColor,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Column(children: [
            Text(
              'Занятие',
              style: theme.value.primaryTextTheme.titleMedium,
            ),
            Text(
              'Создать QR',
              style: theme.value.primaryTextTheme.bodySmall!
                  .copyWith(fontSize: 14),
            ),
          ]),
        ),
        body: BlocProvider<LessonBloc>(
          create: (_) =>
          locator<LessonBloc>()
            ..add(GetLesson()),
          child: BlocBuilder<LessonBloc, LessonState>(
            builder: (context, state) {
              if (state is LessonInitial) {
                return Center(child: CircularProgressIndicator(
                  color: theme.value.secondaryHeaderColor,
                ));
              }
              if (state is LessonReceived) {
                if (state.lessons.length == 0) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/lesson.svg'),
                                SizedBox(height: 40),
                                Text(
                                  'Ближайших занятий нет',
                                  style: theme.value.primaryTextTheme
                                      .titleLarge,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Пока что можно отдохнуть 😌',
                                  style: theme.value.primaryTextTheme.bodySmall,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                        // SizedBox(height: 10),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.lessons.length,
                    itemBuilder: (context, index) {
                      final today = DateTime.now();
                      final tmp_times = state.lessons[index].time.split('-');
                      final start_time = tmp_times[0].split(':');
                      final end_time = tmp_times[1].split(':');
                      final startDateTime = DateTime(today.year, today.month, today.day, int.parse(start_time[0]), int.parse(start_time[1]));
                      final endDateTime = DateTime(today.year, today.month, today.day, int.parse(end_time[0]), int.parse(end_time[1]));
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10,
                            horizontal: 15),
                        width: double.maxFinite,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (today.isAfter(endDateTime))
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Занятие прошло',
                                    style: theme
                                        .value.primaryTextTheme.titleMedium!
                                        .copyWith(
                                        color: theme.value.primaryColor),
                                  ),
                                ]),
                              ),
                            if (!today.isAfter(endDateTime))
                              RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: !today.isBefore(startDateTime) && !today.isAfter(endDateTime) ?'Сейчас' : 'Сегодня',
                                  style: theme.value.primaryTextTheme
                                      .titleMedium?.copyWith(
                                      color: !today.isBefore(startDateTime) && !today.isAfter(endDateTime) ? theme.value.secondaryHeaderColor : theme.value.primaryColor),
                                ),
                                TextSpan(
                                  text: ' должно идти занятие',
                                  style: theme
                                      .value.primaryTextTheme.titleMedium!
                                      .copyWith(
                                      color: theme.value.primaryColor),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                color:
                                theme.value.dividerColor.withOpacity(0.3),
                                thickness: 1,
                              ),
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.lessons[index].subject,
                                        style: theme
                                            .value.primaryTextTheme.titleSmall,
                                      ),
                                      SizedBox(height: 8),
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: state.lessons[index].time +
                                                ' ◦ ',
                                            style: theme.value.primaryTextTheme
                                                .bodySmall,
                                          ),
                                          TextSpan(
                                            text: state.lessons[index].type,
                                            style: theme.value.primaryTextTheme
                                                .bodySmall!
                                                .copyWith(color: state.lessons[index].type == 'пр. занятие' ? theme.value.indicatorColor : theme.value.secondaryHeaderColor),
                                          ),
                                        ]),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        state.lessons[index].groups.join(', '),
                                        style: theme
                                            .value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: SizedBox(
                                width: double.maxFinite,
                                child: MaterialButton(
                                  minWidth: 300,
                                  height: 48,
                                  color: theme.value.secondaryHeaderColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Text(
                                    'QR-код',
                                    style: theme.value.primaryTextTheme
                                        .labelMedium,
                                  ),
                                  onPressed: () => Navigator.pushReplacementNamed(context, '/qr-lesson', arguments: state.lessons[index]),
                                ),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: theme.value.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  );
                }
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.value.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Произошла ошибка',
                              style: theme.value.primaryTextTheme.bodyMedium!
                                  .copyWith(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              child: Text(
                                'Повторить попытку',
                                style: theme.value.primaryTextTheme.labelMedium!
                                    .copyWith(
                                    color:
                                    theme.value.secondaryHeaderColor),
                              ),
                              onPressed: () {
                                BlocProvider.of<LessonBloc>(context)
                                    .add(GetLesson());
                              },
                            ),
                          ],
                        )),
                  ],
                );
              }
            },
          ),
        ),
        bottomNavigationBar: TeacherBottomNavigation(navigationIndex),
      ),
    );
  }
}
