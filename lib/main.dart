import 'package:flutter/material.dart';
import 'package:todo_dodo/pages/home_page.dart';

void main() {
  runApp(const TodoDodo());
}

class TodoDodo extends StatelessWidget {
  const TodoDodo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Pretendard',
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 14, fontFamily: 'Pretendard', fontWeight: FontWeight.w200),
          headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent, // 물결 효과를 없애기 위함
        highlightColor: Colors.transparent, // 물결 효과를 없애기 위함
        splashFactory: NoSplash.splashFactory,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Challenge',
      style: optionStyle,
    ),
    HomePage(),
    Text(
      'Index 2 : MyPage',
      style: optionStyle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports), label: 'Challenge'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'MyPage')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[600],
        showSelectedLabels: false, // 하단의 label을 안보이게 함
        showUnselectedLabels: false, // 하단의 label을 안보이게 함
        onTap: _onItemTapped,
      ),
    );
  }
}
