import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TeacherBottomNavigation extends HookWidget {
  final int currentIndex;

  TeacherBottomNavigation(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    final theme = useState(Theme.of(context));
    return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: theme.value.cardColor,
          unselectedItemColor: theme.value.dividerColor,
          selectedItemColor: theme.value.secondaryHeaderColor,
          selectedFontSize: 12.0,
          currentIndex: currentIndex,
          onTap: (index) {
            if(currentIndex != index) {
              switch(index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/visits-teacher');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/lesson');
                  break;
                case 2:
                  Navigator.pushReplacementNamed(context, '/teacher-profile');
                  break;
              }
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.checklist_rounded,
                ),
                label: 'Посещения'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code_rounded,
                ),
                label: 'Занятие'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_rounded,
                ),
                label: 'Профиль'
            ),
          ],
        )
    );
  }
}