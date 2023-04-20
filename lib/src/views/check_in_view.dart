import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:u_attend/src/widgets/student_bottom_navigation.dart';

class CheckInView extends HookWidget {
  final navigationIndex = 1;

  const CheckInView({super.key});

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
            'Отметиться',
            style: theme.value.primaryTextTheme.titleMedium,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/check_in.svg'),
                    SizedBox(height: 40),
                    Text(
                      'Отметить посещение',
                      style: theme.value.primaryTextTheme.titleLarge,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Отсканируйте QR-код у преподавателя, чтобы отметить посещение',
                      style: theme.value.primaryTextTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: MaterialButton(
                  minWidth: 300,
                  height: 40,
                  color: theme.value.secondaryHeaderColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    'Отсканировать QR-код',
                    style: theme.value.primaryTextTheme.labelMedium,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/qr-scanner');
                  },
                ),
              ),
              // SizedBox(height: 10),
            ],
          ),
        ),
        bottomNavigationBar: StudentBottomNavigation(navigationIndex),
      ),
    );
  }
}
