import "package:flutter/material.dart";
import "package:flutter_application_1/config/palette.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '검색',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (value) {
                // 검색어 제출 시 수행할 작업
                // value는 입력된 검색어
                print('검색어: $value');
                // 여기에 검색 결과 표시 또는 다른 작업 수행
              },
            ),
          ),
        ),
        // backgroundColor: Colors.blue,
      ),
    );
  }
}
