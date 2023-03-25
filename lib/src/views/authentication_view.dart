import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationView extends HookWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = useState(Theme.of(context));
    final isTeacher = useState(false);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/logo_auth.svg'),
              SizedBox(height: 60),
              Text(
                'Личный кабинет',
                style: theme.value.primaryTextTheme.titleMedium,
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 40,
                child: TextFormField(
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
                child: Row(
                  children: [
                    GestureDetector(
                      child: AnimatedContainer(
                        height: 20,
                        width: 20,
                        duration: Duration(microseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: isTeacher.value
                              ? theme.value.secondaryHeaderColor
                              : theme.value.disabledColor,
                          border: Border.all(
                            color: isTeacher.value
                              ? theme.value.secondaryHeaderColor
                              : theme.value.primaryColor.withOpacity(0.7),
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
                      onTap: () {
                        isTeacher.value = !isTeacher.value;
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Я преподаватель',
                      style: theme.value.primaryTextTheme.bodyMedium,
                    ),
                  ],
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
                onPressed: () {},
              ),
              SizedBox(height: 30),
              Text(
                'Забыли пароль? Восстановить пароль\n   можно на сайте «Мой аккаунт СФУ»',
                style: theme.value.primaryTextTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}