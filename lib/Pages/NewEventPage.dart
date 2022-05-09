// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class NewEventPage extends StatefulWidget {
  @override
  State<NewEventPage> createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  var EventName = TextEditingController();

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
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
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
                  TextField(
                    controller: EventName,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      hintText: 'مانند: جشن نوروز',

                      // suffixIcon: Icon(Icons.airport_shuttle),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: TextField(
                controller: EventName,
                // keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'مانند: جشن نوروز',

                  labelText: "نام رویداد",
                  // suffixIcon: Icon(Icons.airport_shuttle),
                ),
              ),
            ),
            Container(
              child: Text('دکمه ثبت'),
            ),
          ],
        ),
      ),
    );
  }
}
