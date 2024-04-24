import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  void showTodoDialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('This is a typical dialog'),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('cancel')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('save')),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  String getCurrentDate() {
    DateTime today = DateTime.now();
    String weekday = "";
    switch (today.weekday) {
      case DateTime.monday :
        weekday = "월요일";
        break;
      case DateTime.tuesday :
        weekday = "화요일";
        break;
      case DateTime.wednesday:
        weekday = "수요일";
        break;
      case DateTime.thursday:
        weekday = "목요일";
        break;
      case DateTime.friday:
        weekday = "금요일";
        break;
      case DateTime.saturday:
        weekday = "토요일";
        break;
      case DateTime.sunday:
        weekday = "일요일";
        break;
    }
    return "${today.year}년 ${today.month}월 ${today.day}일\n$weekday";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 24, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(getCurrentDate(),
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Icon(Icons.notifications),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showTodoDialog,
        tooltip: 'add todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
