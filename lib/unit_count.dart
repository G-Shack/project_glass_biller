import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();

  List<Map<String, dynamic>> _data = [];

  void _addData() {
    setState(() {
      _data.add({
        'length': double.parse(_lengthController.text),
        'width': double.parse(_widthController.text),
      });
      _lengthController.clear();
      _widthController.clear();
    });
  }

  @override
  void dispose() {
    _lengthController.dispose();
    _widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Give Measurements'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
              },
              children: [
                TableRow(children: [
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Length',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Width',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                ..._data.map((row) => TableRow(children: [
                      TableCell(child: Text('${row['length']}')),
                      TableCell(child: Text('${row['width']}')),
                    ])),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _lengthController,
              decoration: InputDecoration(
                labelText: 'Length',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _widthController,
              decoration: InputDecoration(
                labelText: 'Width',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addData,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
