import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/palette.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List<bool> switchValues = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 1 / 9;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 246, 234),
        title: Text(
          '알람',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black), //전체아이콘색깔
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(switchValues.length, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$index 동아리',
                          style: TextStyle(fontSize: 20),
                        ),
                        Switch(
                          value: switchValues[index],
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              switchValues[index] = value;
                            });
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),

      //afaf
    );
  }
}
