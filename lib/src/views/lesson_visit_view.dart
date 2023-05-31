import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:u_attend/src/blocs/lesson_visit/lesson_visit_bloc.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Lesson.dart';

class LessonVisitView extends HookWidget {
  final Lesson lesson;

  const LessonVisitView({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final theme = useState(Theme.of(context));

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: theme.value.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: BackButton(
            color: theme.value.secondaryHeaderColor,
            onPressed: () => Navigator.pop(context),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: theme.value.cardColor,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Column(children: [
            Text(
              'Посещаемость занятия',
              style: theme.value.primaryTextTheme.titleMedium,
            ),
          ]),
        ),
        body: BlocProvider<LessonVisitBloc>(
          create: (_) =>
              locator<LessonVisitBloc>()..add(GetLessonVisit(lesson)),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: lesson.date,
                                    style: theme
                                        .value.primaryTextTheme.titleMedium,
                                  ),
                                  TextSpan(
                                    text: ', ' + lesson.weekday,
                                    style: theme
                                        .value.primaryTextTheme.titleMedium!
                                        .copyWith(
                                            color: theme.value.dividerColor),
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
                                          lesson.subject,
                                          style: theme.value.primaryTextTheme
                                              .titleSmall,
                                        ),
                                        SizedBox(height: 8),
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: lesson.time + ' ◦ ',
                                              style: theme.value
                                                  .primaryTextTheme.bodySmall,
                                            ),
                                            TextSpan(
                                              text: lesson.type,
                                              style: theme.value
                                                  .primaryTextTheme.bodySmall!
                                                  .copyWith(
                                                      color: theme.value
                                                          .indicatorColor),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          lesson.groups.join(', '),
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
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: theme.value.cardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.maxFinite,
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                      BlocBuilder<LessonVisitBloc, LessonVisitState>(
                          builder: (context, state){
                            if (state is LessonVisitInitial) {
                              return Text('');
                            }
                            if (state is LessonVisitReceived) {
                              if (state.attends.length == 0){
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: theme.value.cardColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: double.maxFinite,
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Посещения',
                                              style: theme.value.primaryTextTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Divider(
                                            color: theme.value.dividerColor.withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Text(
                                          'В системе нет студентов из данных групп',
                                          textAlign: TextAlign.center,
                                          style: theme.value
                                              .primaryTextTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }else {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                        text: state.count_student_attend.toString(),
                                                        style: theme.value.primaryTextTheme.titleMedium,
                                                      ),
                                                      TextSpan(
                                                        text: ' из ',
                                                        style: theme.value.primaryTextTheme.bodySmall,
                                                      ),
                                                      TextSpan(
                                                        text: state.count_student_all.toString(),
                                                        style: theme.value.primaryTextTheme.titleMedium,
                                                      ),
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Text(
                                                state.percent_attend_students.toString() + '%',
                                                style: theme.value.primaryTextTheme.titleMedium!.copyWith(color: state.percent_attend_students >= 50 ? theme.value.indicatorColor : theme.value.secondaryHeaderColor),
                                              ),
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        ),
                                        decoration: BoxDecoration(
                                          color: theme.value.cardColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        width: double.maxFinite,
                                        padding: EdgeInsets.all(20),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: theme.value.cardColor,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        width: double.maxFinite,
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Посещения',
                                                  style: theme.value.primaryTextTheme.titleMedium,
                                                ),
                                                TextButton(
                                                  child: Text(
                                                    'Изменить',
                                                    style: theme
                                                        .value.primaryTextTheme.titleSmall!
                                                        .copyWith(
                                                        fontWeight: FontWeight.w500,
                                                        color:
                                                        theme.value.secondaryHeaderColor),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushReplacementNamed(
                                                        context, '/change-lesson-visit', arguments: lesson);
                                                  },
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(vertical: 10),
                                              child: Divider(
                                                color: theme.value.dividerColor.withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: state.attends.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                state.attends[index]
                                                                    .surname + ' ' +
                                                                    state
                                                                        .attends[index]
                                                                        .first_name,
                                                                style: theme.value
                                                                    .primaryTextTheme
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(
                                                              left: 20),
                                                          child: Column(
                                                            children: [
                                                              SvgPicture.asset(
                                                                state.attends[index]
                                                                    .is_attend
                                                                    ? 'assets/images/check_yes.svg'
                                                                    : 'assets/images/check_no.svg',
                                                                height: 18,
                                                                width: 18,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          vertical: 10),
                                                      child: Divider(
                                                        color: theme.value
                                                            .dividerColor.withOpacity(
                                                            0.3),
                                                        thickness: 1,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            } else {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: double.maxFinite,
                                      margin:
                                      EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: theme.value.cardColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Произошла ошибка',
                                            style: theme.value.primaryTextTheme
                                                .bodyMedium!
                                                .copyWith(fontSize: 18),
                                          ),
                                          SizedBox(height: 10),
                                          TextButton(
                                            child: Text(
                                              'Повторить попытку',
                                              style: theme.value.primaryTextTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                  color: theme.value
                                                      .secondaryHeaderColor),
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<LessonVisitBloc>(
                                                  context)
                                                  .add(GetLessonVisit(lesson));
                                            },
                                          ),
                                        ],
                                      )),
                                ],
                              );
                            }
                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: MaterialButton(
            minWidth: 300,
            height: 48,
            color: theme.value.secondaryHeaderColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              'Закрыть',
              style: theme.value.primaryTextTheme.labelMedium,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
