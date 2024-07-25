// screens/result_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:myapp/utils/rest_api.dart';
import '../models/result_data.dart';

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
      final resultData = await RestAPI.fetchPast_Result(widget.resultId);
      return resultData;
    } catch (e) {
      throw Exception('Failed to load result data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youth',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<ResultData>(
        future: _resultData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No result data found'));
          } else {
            final resultData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(resultData.faceImage),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.resultDate.toLocal().toString().split(' ')[0],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Diagnostic Results',
                    style: TextStyle(
                      color: Color(0xFFE26169),
                      fontSize: 20,
                      fontFamily: 'Nobile',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 183,
                    height: 183,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: StarBorder.polygon(sides: 6),
                    ),
                    child: resultData.resultImage.isNotEmpty
                        ? Image.network(resultData.resultImage)
                        : const Icon(Icons.image_not_supported),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: const Color(0x7FE8E8E8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      resultData.resultDetails,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
