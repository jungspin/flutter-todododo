import 'package:flutter/material.dart';
import 'package:todo_dodo/model/user_sample.dart';
import 'package:todo_dodo/widgets/battle_status.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // BottomSheetDialog로 올라오는 게 더 좋을 것 같오
  void showTodoDialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
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
      case DateTime.monday:
        weekday = "월요일";
        break;
      case DateTime.tuesday:
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
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 8,
                    child: Text(getCurrentDate(),
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Icon(Icons.notifications),
                  )
                ],
              ),
              SizedBox(height: 24,),
              Container(
                width: double.infinity, // 가로 꽉 차도록
                  child: Text('배틀 현황',
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.start)),
              SizedBox(height: 4,),
              Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: BattleStatus(
                        userSample: UserSample(
                            '붕붕박', 'assets/images/adeliae.png', 10, 3),
                      )),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                      flex: 5,
                      child: BattleStatus(
                        userSample: UserSample(
                            '아델리', 'assets/images/adeliae.png', 5, 2),
                      )),
                ],
              ),
            ],
          ),
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
