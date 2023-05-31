import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:u_attend/src/blocs/authentication/authentication_bloc.dart';
import 'package:u_attend/src/locator.dart';

class AuthenticationView extends HookWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = useState(Theme.of(context));
    final isTeacher = useState(false);
    final loginController = useTextEditingController();
    final passwordController = useTextEditingController();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.value.cardColor,
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: BlocProvider<AuthenticationBloc>(
            create: (_) => locator<AuthenticationBloc>(),
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if(state is Authenticated) {
                  isTeacher.value
                  ? Navigator.pushReplacementNamed(context, '/teacher-profile')
                  : Navigator.pushReplacementNamed(context, '/profile');
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/logo_auth.svg'),
                    SizedBox(height: 60),
                    Text(
                      'Личный кабинет',
                      style: theme.value.primaryTextTheme.titleLarge,
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: TextFormField(
                        controller: loginController,
                        style: theme.value.primaryTextTheme.bodyMedium,
                        decoration: InputDecoration(
                          fillColor: theme.value.disabledColor,
                          filled: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          labelText: 'Логин',
                          labelStyle: theme.value.primaryTextTheme.bodyMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: theme.value.disabledColor
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: theme.value.primaryColor
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: theme.value.primaryTextTheme.bodyMedium,
                        decoration: InputDecoration(
                          fillColor: theme.value.disabledColor,
                          filled: true,
                          isCollapsed: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          labelText: 'Пароль',
                          labelStyle: theme.value.primaryTextTheme.bodyMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: theme.value.disabledColor
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: theme.value.primaryColor
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 300,
                      child: GestureDetector(
                        onTap: () {
                          isTeacher.value = !isTeacher.value;
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              height: 20,
                              width: 20,
                              duration: Duration(microseconds: 500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: isTeacher.value
                                      ? theme.value.secondaryHeaderColor
                                      : theme.value.cardColor,
                                  border: Border.all(
                                    width: 1.5,
                                    color: isTeacher.value
                                        ? theme.value.secondaryHeaderColor
                                        : theme.value.secondaryHeaderColor,
                                  )
                              ),
                              child: isTeacher.value
                                  ? Icon(
                                Icons.done_rounded,
                                size: 15,
                                color: Colors.white,
                              )
                                  : null,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Я преподаватель',
                              style: theme.value.primaryTextTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    MaterialButton(
                      minWidth: 300,
                      height: 40,
                      color: theme.value.secondaryHeaderColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Text(
                        'Войти',
                        style: theme.value.primaryTextTheme.labelMedium,
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context).add(
                          Authenticate(
                            loginController.text,
                            passwordController.text,
                            isTeacher.value,
                          )
                        );
                      },
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Забыли пароль? Восстановить пароль\n   можно на сайте «Мой аккаунт СФУ»',
                      style: theme.value.primaryTextTheme.bodySmall,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}