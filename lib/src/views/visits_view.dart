import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:dropdown_search/dropdown_search.dart';

class VisitsView extends HookWidget {
  const VisitsView({super.key});

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
                'Посещения',
                style: theme.value.primaryTextTheme.titleMedium,
              ),
              Text(
                'Личная посещаемость',
                style: theme.value.primaryTextTheme.bodySmall!.copyWith(fontSize: 14),
              ),
            ]
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:[
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '16.02.2023',
                                      style: theme.value.primaryTextTheme.titleMedium,
                                    ),
                                    TextSpan(
                                      text: ', Чт',
                                      style: theme.value.primaryTextTheme.titleMedium!.copyWith(color: theme.value.dividerColor),
                                    ),
                                  ]
                              ),
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
                                        'Кустов Д. В.',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset('assets/images/check_yes.svg'),
                                      SizedBox(height: 4),
                                      Text(
                                        'Посетил(-а)',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
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
                                        'Методы и средства проектирования информационных систем и технологий',
                                        style: theme.value.primaryTextTheme.titleSmall,
                                      ),
                                      SizedBox(height: 8),
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '14:10-15:45 ◦ ',
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
                                        'Брежнев Р. В.',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset('assets/images/check_yes.svg'),
                                      SizedBox(height: 4),
                                      Text(
                                        'Посетил(-а)',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
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
                                                text: '15:55-17:30 ◦ ',
                                                style: theme.value.primaryTextTheme.bodySmall,
                                              ),
                                              TextSpan(
                                                text: 'лекция',
                                                style: theme.value.primaryTextTheme.bodySmall!.copyWith(color: theme.value.secondaryHeaderColor),
                                              ),
                                            ]
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Кустов Д. В.',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset('assets/images/check_no.svg'),
                                      SizedBox(height: 4),
                                      Text(
                                        'Не посетил(-а)',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: theme.value.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.maxFinite,
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '16.02.2023',
                                      style: theme.value.primaryTextTheme.titleMedium,
                                    ),
                                    TextSpan(
                                      text: ', Чт',
                                      style: theme.value.primaryTextTheme.titleMedium!.copyWith(color: theme.value.dividerColor),
                                    ),
                                  ]
                              ),
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
                                        'Кустов Д. В.',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset('assets/images/check_yes.svg'),
                                      SizedBox(height: 4),
                                      Text(
                                        'Посетил(-а)',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
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
                                        'Методы и средства проектирования информационных систем и технологий',
                                        style: theme.value.primaryTextTheme.titleSmall,
                                      ),
                                      SizedBox(height: 8),
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '14:10-15:45 ◦ ',
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
                                        'Брежнев Р. В.',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset('assets/images/check_yes.svg'),
                                      SizedBox(height: 4),
                                      Text(
                                        'Посетил(-а)',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
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
                                                text: '15:55-17:30 ◦ ',
                                                style: theme.value.primaryTextTheme.bodySmall,
                                              ),
                                              TextSpan(
                                                text: 'лекция',
                                                style: theme.value.primaryTextTheme.bodySmall!.copyWith(color: theme.value.secondaryHeaderColor),
                                              ),
                                            ]
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Кустов Д. В.',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset('assets/images/check_no.svg'),
                                      SizedBox(height: 4),
                                      Text(
                                        'Не посетил(-а)',
                                        style: theme.value.primaryTextTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: theme.value.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.maxFinite,
                        padding: EdgeInsets.all(20),
                      ),
                    )
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
              Navigator.pushReplacementNamed(context, '/visits');
            }
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/check-in');
            }
            if (index == 2) {
              Navigator.pushReplacementNamed(context, '/profile');
            }
          },
          currentIndex: 0,
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
                label: 'Отметиться'),
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
