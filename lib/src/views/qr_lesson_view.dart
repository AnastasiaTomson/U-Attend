import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRLessonView extends HookWidget {
  const QRLessonView({super.key});

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
                  'Текущее занятие',
                  style: theme.value.primaryTextTheme.bodySmall!.copyWith(fontSize: 14),
                ),
              ]
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: theme.value.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Выберите посетивших',
                    style: theme.value.primaryTextTheme.titleMedium,
                  ),
                  IconButton(
                    icon: Icon(
                        Icons.keyboard_arrow_right
                    ),
                    color: theme.value.dividerColor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/lesson-visit');
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: theme.value.dividerColor.withOpacity(0.3),
                  thickness: 1,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Инструментальные средства информационных систем',
                          style: theme.value.primaryTextTheme.titleSmall,
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '12:00-13:35 ◦ ',
                                  style: theme.value.primaryTextTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: 'пр. занятие',
                                  style: theme.value.primaryTextTheme.bodySmall!.copyWith(color: theme.value.indicatorColor),
                                ),
                              ]
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'КИ20-11Б',
                          style: theme.value.primaryTextTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: QrImage(
                  backgroundColor: theme.value.cardColor,
                  data: 'QR-код занятия',
                  version: QrVersions.auto,
                  size: 250,
                ),
              ),
              Text(
                'QR-код занятия',
                style: theme.value.primaryTextTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                'Студенты должны отсканировать QR-код, чтобы отметить посещение занятия',
                style: theme.value.primaryTextTheme.bodyMedium!.copyWith(color: theme.value.dividerColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/visits-teacher');
            }
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/lesson');
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