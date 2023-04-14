import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TeacherProfileView extends HookWidget {
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
                    'Преподаватель',
                    style: theme.value.primaryTextTheme.titleSmall,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Кушнаренко Андрей Викторович',
                      style: theme.value.primaryTextTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
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
                      Flexible(
                        child: Text(
                          'Кафедра Систем искусственного интеллекта',
                          style: theme.value.primaryTextTheme.bodyMedium,
                        ),
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
                      Icon(Icons.mail_outline),
                      SizedBox(width: 15),
                      Text(
                        'akushnarenko@sfu-kras.ru',
                        style: theme.value.primaryTextTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
          currentIndex: 2,
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
