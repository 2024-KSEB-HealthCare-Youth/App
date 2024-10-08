import 'package:flutter/material.dart';
import 'dart:io'; // File 클래스 사용을 위해 추가
import '../../services/result_service.dart';
import '../../data/dtos/result_detail_dto.dart';
import '../widgets/polygon_pentagon_widgets.dart';

class ResultDetailScreen extends StatefulWidget {
  final int resultId;
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
  final ResultService _resultService = ResultService();
  late Future<ResultDetailDTO> _resultDetailDTO;

  @override
  void initState() {
    super.initState();
    _resultDetailDTO = _resultService.fetchResultDetail(widget.resultId);
  }

  List<double> getPolygonValues(Map<String, double> probabilities) {
    return [
      probabilities['DRY'] ?? 0.0,
      probabilities['COMBINATION'] ?? 0.0,
      probabilities['OILY'] ?? 0.0,
      probabilities['ACNE'] ?? 0.0,
      probabilities['WRINKLES'] ?? 0.0,
    ];
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
      body: FutureBuilder<ResultDetailDTO>(
        future: _resultDetailDTO,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No result data found'));
          } else {
            final resultDetail = snapshot.data!;
            final polygonValues = getPolygonValues(resultDetail.probabilities);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 이미지 로드 부분
                    CircleAvatar(
                      radius: 100, // 크기를 50에서 100으로 증가
                      backgroundImage: resultDetail.faceImage.isNotEmpty
                          ? FileImage(File(resultDetail.faceImage))
                          : null,
                      child: resultDetail.faceImage.isEmpty
                          ? const Text('이미지 없음')
                          : null,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.resultDate.toLocal().toString().split(' ')[0],
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '진단 결과',
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
                        shape: StarBorder.polygon(sides: 5),
                      ),
                      child: PolygonPentagon(
                        values: polygonValues,
                      ),
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
                        resultDetail.details ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
