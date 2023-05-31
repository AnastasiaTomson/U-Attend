import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:u_attend/src/blocs/visits_teacher/visits_teacher_bloc.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/widgets/teacher_bottom_navigation.dart';

class VisitsTeacherView extends HookWidget {
  final navigationIndex = 0;

  const VisitsTeacherView({super.key});

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
              'Посещения',
              style: theme.value.primaryTextTheme.titleMedium,
            ),
          ]),
        ),
        body: BlocProvider<VisitsTeacherBloc>(
          create: (_) => locator<VisitsTeacherBloc>()..add(GetLessonAttend()),
          child: BlocBuilder<VisitsTeacherBloc, VisitsTeacherState>(
            builder: (context, state) {
              if (state is VisitsTeacherInitial) {
                return Center(child: CircularProgressIndicator(
                  color: theme.value.secondaryHeaderColor,
                ));
              }
              if (state is LessonAttendReceived) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.lessons.length,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                        text: state.lessons[index].date,
                                        style: theme.value.primaryTextTheme.titleMedium,
                                      ),
                                      TextSpan(
                                        text: ', ' + state.lessons[index].lessons[0].weekday,
                                        style: theme
                                            .value.primaryTextTheme.titleMedium!
                                            .copyWith(
                                            color:
                                            theme.value.dividerColor),
                                      ),
                                    ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Divider(
                                      color: theme.value.dividerColor
                                          .withOpacity(0.3),
                                      thickness: 1,
                                    ),
                                  ),
                                  ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: state.lessons[index].lessons.length,
                                      separatorBuilder: (context, index_1){
                                        return Padding(
                                                padding: EdgeInsets.symmetric(vertical: 10),
                                                child: Divider(
                                                  color: theme.value.dividerColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              );
                                      },
                                      itemBuilder: (context, index_1) {
                                        return Row(
                                          children: [
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.lessons[index].lessons[index_1].subject,
                                                    style: theme.value
                                                        .primaryTextTheme.titleSmall,
                                                  ),
                                                  SizedBox(height: 8),
                                                  RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                        text: state.lessons[index].lessons[index_1].time + ' ◦ ',
                                                        style: theme
                                                            .value
                                                            .primaryTextTheme
                                                            .bodySmall,
                                                      ),
                                                      TextSpan(
                                                        text: state.lessons[index].lessons[index_1].type,
                                                        style: theme
                                                            .value
                                                            .primaryTextTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                            color: theme.value
                                                                .indicatorColor),
                                                      ),
                                                    ]),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    state.lessons[index].lessons[index_1].groups.join(', '),
                                                    style: theme.value
                                                        .primaryTextTheme.bodySmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 20),
                                              child: IconButton(
                                                icon:
                                                Icon(Icons.keyboard_arrow_right),
                                                color: theme.value.dividerColor,
                                                onPressed: () {
                                                  Navigator.pushNamed(context, '/lesson-visit', arguments: state.lessons[index].lessons[index_1]);
                                                },
                                              ),
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        );
                                      }),
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
                        ],
                      ),
                    );
                  },
                );
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
                                BlocProvider.of<VisitsTeacherBloc>(context)
                                    .add(GetLessonAttend());
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
