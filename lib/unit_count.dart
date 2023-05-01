import 'package:flutter/material.dart';
import 'integer_dropdown.dart';

class DimensionsPage extends StatefulWidget {
  @override
  _DimensionsPageState createState() => _DimensionsPageState();
}

class _DimensionsPageState extends State<DimensionsPage> {
  List<Map<String, dynamic>> _dimensionsList = [];
  TextEditingController _lengthController = TextEditingController();
  TextEditingController _widthController = TextEditingController();

  int _serialNumber = 1;

  void _addDimensions() {
    double length = double.tryParse(_lengthController.text) ?? 0.0;
    double width = double.tryParse(_widthController.text) ?? 0.0;

    setState(() {
      _dimensionsList.add({
        'serial': _serialNumber,
        'length': length,
        'width': width,
      });

      _lengthController.clear();
      _widthController.clear();

      _serialNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dimensions Page'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: TextField(
                  controller: _lengthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Length',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: TextField(
                  controller: _widthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Width',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrangeAccent),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: IntegerDropdown(
                  values: [1, 2, 3, 4, 5],
                  initialValue: 3,
                  onChanged: (value) {
                    //TODO Add the values in the table
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEB1555),
                fixedSize: Size(MediaQuery.of(context).size.width / 3, 40.0)),
            onPressed: _addDimensions,
            child: Text(
              'Add',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Serial')),
                  DataColumn(label: Text('Length')),
                  DataColumn(label: Text('Width')),
                ],
                rows: _dimensionsList
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(Text('${item['serial']}')),
                          DataCell(Text('${item['length']}')),
                          DataCell(Text('${item['width']}')),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
