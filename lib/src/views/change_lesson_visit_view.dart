import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:u_attend/src/blocs/change_lesson_visit/change_lesson_visit_bloc.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/models/Lesson.dart';
// import 'package:dropdown_search/dropdown_search.dart';

class ChangeLessonVisitView extends HookWidget {
  final Lesson lesson;

  const ChangeLessonVisitView({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final students_id = useState<List<String>>([]);
    final theme = useState(Theme.of(context));
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocProvider<ChangeLessonVisitBloc>(
        create: (_) =>
            locator<ChangeLessonVisitBloc>()..add(GetChangeLessonVisit(lesson)),
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
                'Редактировать посещения',
                style: theme.value.primaryTextTheme.titleMedium,
              ),
            ]),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Выберите посетивших',
                                style: theme.value.primaryTextTheme.titleMedium,
                              ),
                              SizedBox(height: 4),
                              // Text(
                              //   'КИ20-11Б',
                              //   style: theme.value.primaryTextTheme.bodySmall,
                              // ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(
                                  color:
                                      theme.value.dividerColor.withOpacity(0.3),
                                  thickness: 1,
                                ),
                              ),
                              BlocBuilder<ChangeLessonVisitBloc,
                                  ChangeLessonVisitState>(
                                builder: (context, state) {
                                  if (state is ChangeLessonVisitInitial) {
                                    return Text('');
                                  }
                                  if (state is ChangeLessonVisitReceived) {
                                    if (state.attends.length == 0) {
                                      return Text(
                                        'В системе нет студентов из данных групп',
                                        textAlign: TextAlign.center,
                                        style: theme
                                            .value.primaryTextTheme.bodyMedium,
                                      );
                                    } else {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.attends.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              state
                                                                      .attends[
                                                                          index]
                                                                      .surname +
                                                                  ' ' +
                                                                  state
                                                                      .attends[
                                                                          index]
                                                                      .first_name,
                                                              style: theme
                                                                  .value
                                                                  .primaryTextTheme
                                                                  .bodyMedium,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      AnimatedContainer(
                                                        height: 18,
                                                        width: 18,
                                                        duration: Duration(
                                                            microseconds: 500),
                                                        curve: Curves
                                                            .fastLinearToSlowEaseIn,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                                color: theme
                                                                    .value
                                                                    .cardColor,
                                                                border:
                                                                    Border.all(
                                                                  color: students_id.value.contains(state
                                                                          .attends[
                                                                              index]
                                                                          .id
                                                                          .toString())
                                                                      ? !state
                                                                              .attends[
                                                                                  index]
                                                                              .is_attend
                                                                          ? theme
                                                                              .value
                                                                              .indicatorColor
                                                                          : theme
                                                                              .value
                                                                              .primaryColor
                                                                      : state
                                                                              .attends[
                                                                                  index]
                                                                              .is_attend
                                                                          ? theme
                                                                              .value
                                                                              .indicatorColor
                                                                          : theme
                                                                              .value
                                                                              .primaryColor,
                                                                )),
                                                        child: students_id.value
                                                                .contains(state
                                                                    .attends[
                                                                        index]
                                                                    .id
                                                                    .toString())
                                                            ? !state
                                                                    .attends[
                                                                        index]
                                                                    .is_attend
                                                                ? Icon(
                                                                    Icons
                                                                        .done_rounded,
                                                                    size: 15,
                                                                    color: theme
                                                                        .value
                                                                        .indicatorColor,
                                                                  )
                                                                : null
                                                            : state
                                                                    .attends[
                                                                        index]
                                                                    .is_attend
                                                                ? Icon(
                                                                    Icons
                                                                        .done_rounded,
                                                                    size: 15,
                                                                    color: theme
                                                                        .value
                                                                        .indicatorColor,
                                                                  )
                                                                : null,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () {
                                                  // state.attends[index].is_attend = !state.attends[index].is_attend;
                                                  if (students_id.value
                                                      .contains(state
                                                          .attends[index].id
                                                          .toString())) {
                                                    students_id.value = [
                                                      ...students_id.value
                                                        ..remove(state
                                                            .attends[index].id
                                                            .toString())
                                                    ];
                                                  } else {
                                                    students_id.value = [
                                                      ...students_id.value
                                                        ..add(state
                                                            .attends[index].id
                                                            .toString())
                                                    ];
                                                  }
                                                  print(students_id);
                                                },
                                              ),
                                              Divider(
                                                color: theme.value.dividerColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  } else {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: double.maxFinite,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: theme.value.cardColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Произошла ошибка',
                                                  style: theme
                                                      .value
                                                      .primaryTextTheme
                                                      .bodyMedium!
                                                      .copyWith(fontSize: 18),
                                                ),
                                                SizedBox(height: 10),
                                                TextButton(
                                                  child: Text(
                                                    'Повторить попытку',
                                                    style: theme
                                                        .value
                                                        .primaryTextTheme
                                                        .labelMedium!
                                                        .copyWith(
                                                            color: theme.value
                                                                .secondaryHeaderColor),
                                                  ),
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                ChangeLessonVisitBloc>(
                                                            context)
                                                        .add(
                                                            GetChangeLessonVisit(
                                                                lesson));
                                                  },
                                                ),
                                              ],
                                            )),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ]),
                        decoration: BoxDecoration(
                          color: theme.value.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.maxFinite,
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: BlocConsumer<ChangeLessonVisitBloc, ChangeLessonVisitState>(
              listener: (context, state) {
                if(state is SuccessChangeLessonVisitReceived) {
                  Navigator.pushReplacementNamed(context, '/lesson-visit', arguments: lesson);
                }
              },
              builder: (context, state) {
                return MaterialButton(
                  minWidth: 300,
                  height: 48,
                  color: theme.value.secondaryHeaderColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    'Сохранить',
                    style: theme.value.primaryTextTheme.labelMedium,
                  ),
                  onPressed: () {
                    BlocProvider.of<ChangeLessonVisitBloc>(context).add(
                        ChangeLessonVisit(lesson, students_id.value));
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
