import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class LessonView extends HookWidget {
  const LessonView({super.key});

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
                  'Занятие',
                  style: theme.value.primaryTextTheme.titleMedium,
                ),
                Text(
                  'Создать QR',
                  style: theme.value.primaryTextTheme.bodySmall!.copyWith(fontSize: 14),
                ),
              ]
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
                    SvgPicture.asset('assets/images/lesson.svg'),
                    SizedBox(height: 40),
                    Text(
                      'Ближайших занятий нет',
                      style: theme.value.primaryTextTheme.titleLarge,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Пока что можно отдохнуть 😌',
                      style: theme.value.primaryTextTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ),
              // SizedBox(height: 10),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/visits-teacher');
            }
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/qr-lesson');
            }
            if (index == 2) {
              Navigator.pushReplacementNamed(context, '/teacher-profile');
            }
          },
          currentIndex: 1,
          selectedItemColor: theme.value.secondaryHeaderColor,
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.checklist_rounded,
                ),
                label: 'Посещения'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code_rounded,
                ),
                label: 'Занятие'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                ),
                label: 'Профиль'),
          ],
        ),
      ),
    );
  }
}
