import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:u_attend/src/blocs/visits/visits_bloc.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/widgets/student_bottom_navigation.dart';


class VisitsView extends HookWidget {
  final navigationIndex = 0;

  const VisitsView({super.key});

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
          title: Column(
            children: [
              Text(
                'Посещения',
                style: theme.value.primaryTextTheme.titleMedium,
              ),
              Text(
                'Личная посещаемость',
                style: theme.value.primaryTextTheme.bodySmall!.copyWith(fontSize: 14),
              ),
            ]
          ),
        ),
        body: BlocProvider<VisitsBloc>(
          create: (_) => locator<VisitsBloc>()..add(GetLessonAttend()),
          child: BlocBuilder<VisitsBloc, VisitsState>(
            builder: (context, state) {
              if (state is VisitsInitial) {
                return Center(child: CircularProgressIndicator(
                  color: theme.value.secondaryHeaderColor,
                ));
              }
              if (state is VisitsReceived) {
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
                                                    state.lessons[index].lessons[index_1].teacher.toString(),
                                                    style: theme.value
                                                        .primaryTextTheme.bodySmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 20),
                                              child: Column(
                                                children: [
                                                  SvgPicture.asset(state.lessons[index].lessons[index_1].is_attend! ? 'assets/images/check_yes.svg' :  'assets/images/check_no.svg'),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    state.lessons[index].lessons[index_1].is_attend! ? 'Посетил(-а)' : 'Не посетил(-а)',
                                                    style: theme.value.primaryTextTheme.bodySmall,
                                                  ),
                                                ],
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
                                BlocProvider.of<VisitsBloc>(context)
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
        bottomNavigationBar: StudentBottomNavigation(navigationIndex),
      ),
    );
  }
}
