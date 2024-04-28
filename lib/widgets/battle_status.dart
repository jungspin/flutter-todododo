import 'package:flutter/material.dart';
import 'package:todo_dodo/model/user_sample.dart';

class BattleStatus extends StatefulWidget {
  const BattleStatus({super.key, required this.userSample});

  final UserSample userSample;

  @override
  State<StatefulWidget> createState() => _BattleStatus();
}

class _BattleStatus extends State<BattleStatus> {
  int getPercentage(int total, int completed) {
    return (completed * 100 / total).round();
  }

  double getPercent(int total, int completed) {
    return completed / total;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0, // 1:1 비율로 설정
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Color(0xffF0F0F0),
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      flex: 7, child: Text('${widget.userSample.nickname}')),
                  Expanded(
                      flex: 3,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image.asset(
                            '${widget.userSample.userImageUrl}',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Text(
                    '${widget.userSample.completedTodo}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    '/',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    '${widget.userSample.totalTodo}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: LinearProgressIndicator(
                      value: getPercent(widget.userSample.totalTodo,
                          widget.userSample.completedTodo),
                      // between 0.0 and 1.0.
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 4),
                          child: Text(
                            '${getPercentage(widget.userSample.totalTodo, widget.userSample.completedTodo)}%',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
