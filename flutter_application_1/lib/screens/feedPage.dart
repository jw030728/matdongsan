import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/palette.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  int heart = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 246, 234),
        title: Text('피드', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black), //전체아이콘색깔
      ),
      body: Container(
        color: Colors.grey, //맨뒤 색깔
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(10, (index) {
                    return GestureDetector(
                      // 각 항목에 탭을 감지하는 GestureDetector 추가
                      onTap: () {
                        // 해당 항목을 탭할 때 실행할 동작을 정의
                        print('누르기 $index'); // 콘솔에 해당 항목이 탭되었음을 출력
                      },

                      child: Container(
                        // 각 항목을 담는 컨테이너
                        width: 400, // 너비 200 설정
                        height: 400, // 높이 200 설정
                        margin: EdgeInsets.all(8), // 외부 여백 설정
                        color: Colors.white,
                        // decoration: BoxDecoration( //에러뜨는데 이유를 모르겠음..
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Image.asset(
                              'image/flower.jpg',
                              width: 230,
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.favorite),
                                    onPressed: () {
                                      setState(
                                        () {
                                          print(heart);
                                          heart++;
                                          // 아이콘 누를 때 숫자 증가
                                        },
                                      );
                                    },
                                  ),
                                  Text('$heart'),
                                ],
                              ),
                            ),
                          ],
                        ), // 중앙에 'Item $index' 텍스트를 가진 위젯
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
