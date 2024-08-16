import 'package:flutter/material.dart';
import '../../data/models/past_data.dart';
import 'result_detail_screen.dart';
import '../../services/user_service.dart';

class PastResultsScreen extends StatefulWidget {
  const PastResultsScreen({Key? key}) : super(key: key);

  @override
  _PastResultsScreenState createState() => _PastResultsScreenState();
}

class _PastResultsScreenState extends State<PastResultsScreen> {
  int? _selectedIndex;
  PastData? _pastData;
  bool _isLoading = true;
  String? _errorMessage;

  final UserService userService = UserService();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchPastData();
  }

  Future<void> _fetchPastData() async {
    try {
      _pastData = await userService.fetchPastData();
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load data: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _pastData == null
              ? Center(child: Text(_errorMessage ?? 'Failed to load data'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _pastData!.results.length,
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
    final resultItem = _pastData!.results[index];
    // Check if advancedSkinTypeList is not null or empty, and convert to a displayable string
    String experts = resultItem.advancedSkinTypeList != null &&
            resultItem.advancedSkinTypeList!.isNotEmpty
        ? resultItem.advancedSkinTypeList!.map((e) => e.name).join(', ')
        : '';

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${resultItem.resultDate.toLocal().toString().split(' ')[0]} (${resultItem.resultDate.toLocal().toString().split(' ')[1].substring(0, 5)})',
                    style: TextStyle(fontSize: 16),
                  ),
                  if (experts.isNotEmpty)
                    Text(
                      experts,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                ],
              ),
            ),
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
              final selectedResult = _pastData!.results[_selectedIndex!];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultDetailScreen(
                    resultId: selectedResult.resultId,
                    resultDate: selectedResult.resultDate,
                  ),
                ),
              );
            },
      child: const Text(
        '확인하기',
        style: TextStyle(
            fontSize: 16, color: Colors.white, fontFamily: 'Pacifico'),
      ),
    );
  }
}
