import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class ErrorView extends HookWidget {
  final String message;
  const ErrorView({super.key, required this.message});

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
              SvgPicture.asset('assets/images/Failed.svg'),
              SizedBox(height: 40),
              Text(
                'Не удалось отметиться',
                style: theme.value.primaryTextTheme.titleLarge,
              ),
              SizedBox(height: 12),
              Text(
                message,
                style: theme.value.primaryTextTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              TextButton(
                child: Text(
                  'Отмена',
                  style: theme.value.primaryTextTheme.labelMedium!.copyWith(color: theme.value.secondaryHeaderColor),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/check-in');
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: theme.value.cardColor,
          padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 30),
          child:
              MaterialButton(
                minWidth: 300,
                height: 48,
                color: theme.value.secondaryHeaderColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  'Попробовать снова',
                  style: theme.value.primaryTextTheme.labelMedium,
                ),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/qr-scanner'),
              )
        ),
      ),
    );
  }
}
//
