import 'package:flutter/material.dart';
import '../models/result_data.dart';

class PastResultsScreen extends StatefulWidget {
  const PastResultsScreen({Key? key}) : super(key: key);

  @override
  _PastResultsScreenState createState() => _PastResultsScreenState();
}

class _PastResultsScreenState extends State<PastResultsScreen> {
  int? _selectedIndex;
  final List<ResultData> _results = [
    ResultData(
      resultId: 1,
      memberId: 101,
      resultImage: 'result1.png',
      faceImage: 'face1.png',
      resultDetails: 'Detailed result 1',
      resultDate: DateTime.parse('2023-07-01'),
    ),
    ResultData(
      resultId: 2,
      memberId: 102,
      resultImage: 'result2.png',
      faceImage: 'face2.png',
      resultDetails: 'Detailed result 2',
      resultDate: DateTime.parse('2023-08-01'),
    ),
    ResultData(
      resultId: 3,
      memberId: 103,
      resultImage: 'result3.png',
      faceImage: 'face3.png',
      resultDetails: 'Detailed result 3',
      resultDate: DateTime.parse('2023-09-01'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  return _buildDateItem(context, index);
                },
              ),
            ),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Youth',
        style: TextStyle(
          fontFamily: 'Pacifico', // Customize font family as required
          fontSize: 30,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildDateItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(width: 8),
            Text(_results[index].resultDate.toLocal().toString().split(' ')[0]),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      onPressed: _selectedIndex == null
          ? null
          : () {
              final selectedResult = _results[_selectedIndex!];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ResultDetailScreen(resultData: selectedResult),
                ),
              );
            },
      child: const Text(
        '확인하기',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

class ResultDetailScreen extends StatelessWidget {
  final ResultData resultData;

  const ResultDetailScreen({Key? key, required this.resultData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Date: ${resultData.resultDate.toLocal().toString().split(' ')[0]}'),
            SizedBox(height: 16),
            Text('Result Details: ${resultData.resultDetails}'),
            SizedBox(height: 16),
            Image.asset(resultData
                .resultImage), // Use your image asset or network image
            SizedBox(height: 16),
            Image.asset(
                resultData.faceImage), // Use your image asset or network image
          ],
        ),
      ),
    );
  }
}
