import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:u_attend/src/blocs/authentication/authentication_bloc.dart';
import 'package:u_attend/src/locator.dart';

class ProfileView extends HookWidget {
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
        body: Column(
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
                    'Галсанов Булат',
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.people_outline_rounded,
                        size: 22,
                      ),
                      SizedBox(width: 15),
                      Text(
                        'КИ20-13Б',
                        style: theme.value.primaryTextTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: theme.value.dividerColor.withOpacity(0.3),
                    thickness: 1,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.assignment_ind_outlined),
                      SizedBox(width: 15),
                      Text(
                        '032049891',
                        style: theme.value.primaryTextTheme.bodyMedium,
                      ),
                    ],
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
                'Староста: Нет',
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/visits');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.checklist_rounded,
                        color: theme.value.dividerColor,
                      ),
                      Text(
                        'Посещения',
                        style: theme.value.primaryTextTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/check-in');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code_rounded,
                        color: theme.value.dividerColor,
                      ),
                      Text(
                        'Отметиться',
                        style: theme.value.primaryTextTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    // Navigator.pushReplacementNamed(context, '/profile');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        color: theme.value.secondaryHeaderColor,
                      ),
                      Text(
                        'Профиль',
                        style: theme.value.primaryTextTheme.bodySmall!.copyWith(color: theme.value.secondaryHeaderColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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
