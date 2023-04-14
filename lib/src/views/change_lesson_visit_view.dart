import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:dropdown_search/dropdown_search.dart';

class ChangeLessonVisitView extends HookWidget {
  const ChangeLessonVisitView({super.key,});

  @override
  Widget build(BuildContext context) {
    final value1 = useState(false);
    final value2 = useState(true);
    final theme = useState(Theme.of(context));
    return WillPopScope(
      onWillPop: () async => false,
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
          title: Column(children: [
            Text(
              'Редактировать посещения',
              style: theme.value.primaryTextTheme.titleMedium,
            ),
          ]),
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Выберите посетивших',
                              style: theme.value.primaryTextTheme.titleMedium,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'КИ20-11Б',
                              style: theme.value.primaryTextTheme.bodySmall,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                color:
                                    theme.value.dividerColor.withOpacity(0.3),
                                thickness: 1,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Брагин Иван',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  child: AnimatedContainer(
                                    height: 18,
                                    width: 18,
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: theme.value.cardColor,
                                        border: Border.all(
                                          color: value1.value
                                              ? theme.value.indicatorColor
                                              : theme.value.primaryColor,
                                        )),
                                    child: value1.value
                                        ? Icon(
                                            Icons.done_rounded,
                                            size: 15,
                                            color: theme.value.indicatorColor,
                                          )
                                        : null,
                                  ),
                                  onTap: () {
                                    value1.value = !value1.value;
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Divider(
                                color:
                                theme.value.dividerColor.withOpacity(0.3),
                                thickness: 1,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Галсанов Булат',
                                        style: theme.value.primaryTextTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  child: AnimatedContainer(
                                    height: 18,
                                    width: 18,
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: theme.value.cardColor,
                                        border: Border.all(
                                          color: value2.value
                                              ? theme.value.indicatorColor
                                              : theme.value.primaryColor,
                                        )),
                                    child: value2.value
                                        ? Icon(
                                            Icons.done_rounded,
                                            size: 15,
                                            color: theme.value.indicatorColor,
                                          )
                                        : null,
                                  ),
                                  onTap: () {
                                    value2.value = !value2.value;
                                  },
                                ),
                              ],
                            ),
                          ]),
                      decoration: BoxDecoration(
                        color: theme.value.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.maxFinite,
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ],
              )),
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
              'Сохранить',
              style: theme.value.primaryTextTheme.labelMedium,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
