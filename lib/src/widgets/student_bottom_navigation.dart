import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StudentBottomNavigation extends HookWidget {
  final int currentIndex;

  StudentBottomNavigation(this.currentIndex);

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
                Navigator.pushReplacementNamed(context, '/visits');
                break;
              case 1:
                Navigator.pushReplacementNamed(context, '/check-in');
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/profile');
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
              label: 'Отметиться'
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