import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class SuccessView extends HookWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = useState(Theme.of(context));

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.value.scaffoldBackgroundColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          height: double.maxFinite,
          width: double.maxFinite,
          color: theme.value.cardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Success.svg'),
              SizedBox(height: 40),
              Text(
                'Вы отметились на занятии',
                style: theme.value.primaryTextTheme.titleLarge,
              ),
              SizedBox(height: 12),
              Text(
                'Методологии разработки программного обеспечения',
                style: theme.value.primaryTextTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: theme.value.cardColor,
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
          child: MaterialButton(
            minWidth: 300,
            height: 48,
            color: theme.value.secondaryHeaderColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              'Продолжить',
              style: theme.value.primaryTextTheme.labelMedium,
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/visits'),
          ),
        ),
      ),
    );
  }
}
