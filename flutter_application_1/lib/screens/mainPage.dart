import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/palette.dart';
import 'package:flutter_application_1/screens/feedPage.dart';
import 'alramPage.dart';
import 'searchPage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndex = 0, _bodyIndex = 0, _bottomIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index != 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            switch (index) {
              case 0:
                return MyWidget(); // 0번째 아이템을 누르면 홈 페이지를 보여줍니다.
              case 1:
                return PageTwo(); // 1번째 아이템을 누르면 피드 페이지를 보여줍니다.
              case 2:
                return PageThree(); // 2번째 아이템을 누르면 알람 페이지를 보여줍니다.
              default:
                return Container(); // 기본적으로 빈 컨테이너를 반환합니다.
            }
          }),
        );
      }
    });
  }

  void _onBodyTapped(int index) {
    setState(() {
      _bodyIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          switch (index) {
            case 0:
              return MyWidget();
            default:
              return Container();
          }
        }),
      );
    });
  }

  void _onAppBarTapped(int index) {
    setState(() {
      _bodyIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          switch (index) {
            case 0:
              return MyWidget(); //여기 뭔가 계속 메모리 터질거같음 바꿔야할거같음
            case 1:
              return SearchPage();
            default:
              return Container();
          }
        }),
      );
    });
  }

  //body에 ontap으로 두개 화면 해서 하기 클릭했을떄 들어갈 페이지도 만들기
  //앱바에 사용자 메뉴 들어가는거 해놓기 왼쪽상단 //우측상단 검색 누르면 키보드 뜨게하기
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 225),
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Color.fromARGB(255, 37, 33, 243)), //전체아이콘색깔
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // 검색 아이콘을 눌렀을 때 수행할 작업=
              _onAppBarTapped(1);
            },
          ),
        ],
        actionsIconTheme: IconThemeData(
          size: 30, // 아이콘 크기를 30로 설정
        ),
        flexibleSpace: Image(
          image: AssetImage('image/logo.png'),
          width: null,
          height: null,
        ),
        backgroundColor: const Color.fromARGB(255, 247, 246, 234),
      ),
      //사이드바
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 247, 246, 234),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
            // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                // 현재 계정 이미지 set
                backgroundImage: AssetImage('image/flower.jpg'),
                // radius: 1,
                backgroundColor: Colors.blue,
              ),
              accountName: Text('juwon'),
              accountEmail: Text('juwon@email.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.home,
            //     color: Colors.grey[850],
            //   ),
            //   title: Text('Home'),
            //   onTap: () {
            //     print('Home is clicked');
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Setting'),
              onTap: () {
                print('Setting is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Q&A'),
              onTap: () {
                print('Q&A is clicked');
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal, //ListView와 같은 위젯에서 스크롤 방향을 수평으로 설정하는 데 사용
              child: Row(
                children: List.generate(10, (index) {
                  return GestureDetector(
                    // 각 항목에 탭을 감지하는 GestureDetector 추가
                    onTap: () {
                      // 해당 항목을 탭할 때 실행할 동작을 정의
                      print('누르기 $index'); // 콘솔에 해당 항목이 탭되었음을 출력
                    },

                    child: Container(
                      // 각 항목을 담는 컨테이너
                      width: 200, // 너비 200 설정
                      height: 200, // 높이 200 설정
                      margin: EdgeInsets.all(8), // 외부 여백 설정
                      // color: Colors.lightBlueAccent, // 파란색 배경
                      decoration: BoxDecoration(
                        //이것도 안댐
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text('공지 $index')), // 중앙에 'Item $index'텍스트
                    ),
                  );
                }),
              ),
            ),
          ),
          Container(
            height: 200, // or adjust to the size you need
            color: Colors.blueAccent,
            child: Center(child: Text('동아리 카테고리')),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // activeIcon: Icon(Icons.home, color: Color.fromARGB(255, 21, 101, 192)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
