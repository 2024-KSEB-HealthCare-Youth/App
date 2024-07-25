// screens/past_results_screen.dart

import 'package:flutter/material.dart';
import '../models/past_data.dart';
import 'result_detail_screen.dart';

class PastResultsScreen extends StatefulWidget {
  const PastResultsScreen({Key? key}) : super(key: key);

  @override
  _PastResultsScreenState createState() => _PastResultsScreenState();
}

class _PastResultsScreenState extends State<PastResultsScreen> {
  int? _selectedIndex;
  late PastData _pastData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pastData = ModalRoute.of(context)!.settings.arguments as PastData;
  }

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
                itemCount: _pastData.resultDate.length,
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
            Text(
                _pastData.resultDate[index].toLocal().toString().split(' ')[0]),
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
              final selectedResultId = _pastData.resultId[_selectedIndex!];
              final selectedResultDate = _pastData.resultDate[_selectedIndex!];
              // ResultDetailScreen으로 resultId와 resultDate를 전달합니다.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultDetailScreen(
                    resultId: selectedResultId,
                    resultDate: selectedResultDate,
                  ),
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
