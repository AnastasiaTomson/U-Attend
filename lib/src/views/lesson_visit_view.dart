import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:dropdown_search/dropdown_search.dart';

class LessonVisitView extends HookWidget {
  const LessonVisitView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = useState(Theme.of(context));

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: theme.value.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: BackButton(
            color: theme.value.secondaryHeaderColor,
            onPressed: () => Navigator.pop(context),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: theme.value.cardColor,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Посещаемость занятия',
                style: theme.value.primaryTextTheme.titleMedium,
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
                      height: 0,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Посещения',
                                  style: theme.value.primaryTextTheme.titleMedium,
                                ),
                                TextButton(
                                  child: Text(
                                    'Изменить',
                                    style: theme.value.primaryTextTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500, color: theme.value.secondaryHeaderColor),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/change-lesson-visit');
                                  },
                                )
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Брагин Иван',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_no.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Галсанов Булат',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_yes.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Гува Андрей',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_yes.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Джегло Дмитрий',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_yes.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Дронгаль Наталия',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_yes.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Жмурко Анастасия',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_yes.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Конохова Юлия',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_no.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Карасев Андрей',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_no.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Кузьмин Вячеслав',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_yes.svg',
                                        height: 18,
                                        width: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Муратов Марат',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/check_yes.svg',
                                        height: 18,
                                        width: 18,
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
                  ],
                )
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: MaterialButton(

            minWidth: 300,
            height: 48,
            color: theme.value.secondaryHeaderColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Text(
              'Закрыть',
              style: theme.value.primaryTextTheme.labelMedium,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
