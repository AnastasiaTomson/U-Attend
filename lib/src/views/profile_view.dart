import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:u_attend/src/blocs/authentication/authentication_bloc.dart';
import 'package:u_attend/src/blocs/student_profile/student_profile_bloc.dart';
import 'package:u_attend/src/locator.dart';
import 'package:u_attend/src/widgets/student_bottom_navigation.dart';

class ProfileView extends HookWidget {
  final navigationIndex = 2;

  const ProfileView({super.key});

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
        body: BlocProvider<StudentProfileBloc>(
          create: (_) => locator<StudentProfileBloc>()..add(GetStudent()),
          child: BlocBuilder<StudentProfileBloc, StudentProfileState>(
            builder: (context, state) {
              if(state is StudentProfileInitial) {
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
                            'Студент',
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
                    SizedBox(height: 10),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: theme.value.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline_rounded,
                            size: 22,
                          ),
                          SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: theme.value.disabledColor,
                            ),
                            width: 50,
                            height: 14,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: theme.value.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Староста: ',
                            style: theme.value.primaryTextTheme.bodyMedium,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: theme.value.disabledColor,
                            ),
                            width: 20,
                            height: 14,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }
              if(state is StudentReceived) {
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
                            'Студент',
                            style: theme.value.primaryTextTheme.titleSmall,
                          ),
                          SizedBox(height: 10),
                          Text(
                            state.student.surname + ' ' + state.student.first_name,
                            textAlign: TextAlign.center,
                            style: theme.value.primaryTextTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: theme.value.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline_rounded,
                            size: 22,
                          ),
                          SizedBox(width: 15),
                          Text(
                            state.student.group,
                            style: theme.value.primaryTextTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: theme.value.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Староста: ${state.student.is_headman ? 'Да' : 'Нет'}',
                        style: theme.value.primaryTextTheme.bodyMedium,
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
                                BlocProvider.of<StudentProfileBloc>(context).add(GetStudent());
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
        bottomNavigationBar: StudentBottomNavigation(navigationIndex),
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    final theme = Theme.of(context);
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (_) => locator<AuthenticationBloc>(),
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if(state is UnAuthenticated) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/authentication', (route) => false);
              }
            },
            builder: (context, state) {
              return AlertDialog(
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
                      BlocProvider.of<AuthenticationBloc>(context).add(Logout());
                    },
                    child: Text(
                      'Выйти',
                      style: theme.primaryTextTheme.bodyMedium!
                        .copyWith(color: theme.secondaryHeaderColor),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }
    );
  }
}
