// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';
import 'package:reminder/Pages/HomePage.dart';

class NewEventPage extends StatefulWidget {
  @override
  State<NewEventPage> createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  var EventName = TextEditingController();
  int eventTimeMin = 0;
  int eventTimeHour = 0;
  int eventTimeTimer = 1;
  double okBtn = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
            ),
            Center(
              child: Text(
                'رویداد جدید',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Text('              ')
          ],
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            /*نام رویداد*/ Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'نام رویداد',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          okBtn = EventName.text.length > 0 ? 1.0 : 0.5;
                        });
                      },
                      controller: EventName,
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'مانند: جشن نوروز',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        fillColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*زمان رویداد*/ Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'زمان رویداد',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              'دقیقه',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45)),
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: NumberPicker(
                              itemWidth: 50,
                              infiniteLoop: true,
                              axis: Axis.horizontal,
                              value: eventTimeMin,
                              minValue: 0,
                              maxValue: 59,
                              onChanged: (value) =>
                                  setState(() => eventTimeMin = value),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          ':',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Text(
                                'ساعت',
                                style: TextStyle(fontSize: 16),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45)),
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: NumberPicker(
                              itemWidth: 50,
                              infiniteLoop: true,
                              axis: Axis.horizontal,
                              value: eventTimeHour,
                              minValue: 0,
                              maxValue: 59,
                              onChanged: (value) =>
                                  setState(() => eventTimeHour = value),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'مدت زمان رویداد(دقیقه)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45)),
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: NumberPicker(
                          itemWidth: 50,
                          infiniteLoop: true,
                          axis: Axis.horizontal,
                          value: eventTimeTimer,
                          minValue: 0,
                          maxValue: 59,
                          onChanged: (value) =>
                              setState(() => eventTimeTimer = value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: okBtn,
              child: GestureDetector(
                onTap: () {
                  print('after plan make model and send to home page');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Text(
                    'ثبت',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
