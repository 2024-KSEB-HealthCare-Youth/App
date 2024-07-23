import 'package:flutter/material.dart';

class PastResultsScreen extends StatefulWidget {
  const PastResultsScreen({Key? key}) : super(key: key);

  @override
  _PastResultsScreenState createState() => _PastResultsScreenState();
}

class _PastResultsScreenState extends State<PastResultsScreen> {
  int? _selectedIndex;
  final List<String> _dates = [
    '24.05.01(월) 13:02',
    '24.05.02(화) 13:02',
    '24.05.03(수) 13:02',
    '24.05.04(목) 13:02'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Youth',
          style: TextStyle(
            fontFamily: 'Pacifico', // Customize font family as required
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _dates.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Radio(
                            value: index,
                            groupValue: _selectedIndex,
                            onChanged: (int? value) {
                              setState(() {
                                _selectedIndex = value;
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          Text(_dates[index]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: _selectedIndex == null
                  ? null
                  : () {
                      // Add your button functionality here
                      print('Selected date: ${_dates[_selectedIndex!]}');
                      // Navigator.pushNamed(context, '/desired_route');
                    },
              child: Text(
                '확인하기',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
