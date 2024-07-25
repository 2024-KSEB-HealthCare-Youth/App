// screens/result_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/result_data.dart';
import '../services/user_service.dart';
import '../utils/rest_api.dart';

class ResultDetailScreen extends StatefulWidget {
  final String resultId;
  final DateTime resultDate;

  const ResultDetailScreen({
    Key? key,
    required this.resultId,
    required this.resultDate,
  }) : super(key: key);

  @override
  _ResultDetailScreenState createState() => _ResultDetailScreenState();
}

class _ResultDetailScreenState extends State<ResultDetailScreen> {
  late Future<ResultData> _resultData;

  @override
  void initState() {
    super.initState();
    _resultData = _fetchResultData();
  }

  Future<ResultData> _fetchResultData() async {
    // 서버에서 resultId와 resultDate를 이용해 ResultData를 가져오는 로직을 구현합니다.
    try {
      final resultData =
          await RestAPI.fetchPast_Result(widget.resultId, widget.resultDate);
      return resultData;
    } catch (e) {
      throw Exception('Failed to load result data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Detail'),
      ),
      body: FutureBuilder<ResultData>(
        future: _resultData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No result data found'));
          } else {
            final resultData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Date: ${widget.resultDate.toLocal().toString().split(' ')[0]}'),
                  SizedBox(height: 16),
                  Text('Result Details: ${resultData.resultDetails}'),
                  SizedBox(height: 16),
                  Image.asset(resultData
                      .resultImage), // Use your image asset or network image
                  SizedBox(height: 16),
                  Image.asset(resultData
                      .faceImage), // Use your image asset or network image
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
