import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:u_attend/src/blocs/teacher_profile/teacher_profile_bloc.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/widgets/teacher_bottom_navigation.dart';

class TeacherProfileView extends HookWidget {
  final navigationIndex = 2;

  const TeacherProfileView({super.key});

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
          title: Text(
            'Личный кабинет',
            style: theme.value.primaryTextTheme.titleMedium,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout_rounded,
                color: theme.value.secondaryHeaderColor,
              ),
              onPressed: () {
                _showAlertDialog(context);
              },
            )
          ],
        ),
        body: BlocProvider<TeacherProfileBloc>(
          create: (_) => locator<TeacherProfileBloc>()..add(GetTeacher()),
          child: BlocBuilder<TeacherProfileBloc, TeacherProfileState>(
            builder: (context, state) {
              if(state is TeacherProfileInitial) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: theme.value.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            size: 40,
                          ),
                          Text(
                            'Преподаватель',
                            style: theme.value.primaryTextTheme.titleSmall,
                          ),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: theme.value.disabledColor,
                            ),
                            width: 200,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if(state is TeacherReceived) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: theme.value.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            size: 40,
                          ),
                          Text(
                            'Преподаватель',
                            style: theme.value.primaryTextTheme.titleSmall,
                          ),
                          SizedBox(height: 10),
                          Text(
                            state.teacher.surname + ' ' + state.teacher.first_name + ' ' + state.teacher.patronymic,
                            textAlign: TextAlign.center,
                            style: theme.value.primaryTextTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              else {
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
                            style: theme.value.primaryTextTheme.bodyMedium!.copyWith(
                              fontSize: 18
                            ),
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            child: Text(
                              'Повторить попытку',
                              style: theme.value.primaryTextTheme.labelMedium!.copyWith(
                                color: theme.value.secondaryHeaderColor
                              ),
                            ),
                            onPressed: () {
                              BlocProvider.of<TeacherProfileBloc>(context).add(GetTeacher());
                            },
                          ),
                        ],
                      )
                    ),
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

  Future<void> _showAlertDialog(BuildContext context) async {
    final theme = Theme.of(context);
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Выход',
                style: theme.primaryTextTheme.titleMedium,
              ),
              content: Text(
                'Вы точно хотите выйти?',
                style: theme.primaryTextTheme.bodyMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Отмена',
                    style: theme.primaryTextTheme.bodyMedium!
                        .copyWith(color: theme.dividerColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/authentication', (route) => false);
                  },
                  child: Text(
                    'Выйти',
                    style: theme.primaryTextTheme.bodyMedium!
                        .copyWith(color: theme.secondaryHeaderColor),
                  ),
                ),
              ],
            ));
  }
}
