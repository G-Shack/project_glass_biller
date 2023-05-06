import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();

  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  double _heightRate = 10;
  int _quantValue = 1;
  double _scale = 1;
  double _previousScale = 1.0;
  double _netPrice = 0.0;
  double _netArea = 0.0;
  int _netQuantity = 0;

  List<Map<String, dynamic>> _tableData = [];

  double _onSubmitLength() {
    String fraction = _lengthController.text;
    double decimal = 0;

    if (fraction.contains('/')) {
      List<String> parts = fraction.split(' ');
      if (parts.length == 2) {
        int whole = int.tryParse(parts[0]) ?? 0;
        List<String> fracParts = parts[1].split('/');
        if (fracParts.length == 2) {
          int numerator = int.tryParse(fracParts[0]) ?? 0;
          int denominator = int.tryParse(fracParts[1]) ?? 1;
          decimal = whole + numerator / denominator;
        }
      }
      print('Decimal value: $decimal');
      return decimal;
    } else {
      decimal = double.tryParse(fraction) ?? 0.0;
      print('Decimal value: $decimal');
      return decimal;
    }
  }

  double _onSubmitWidth() {
    String fraction = _widthController.text;
    double decimal = 0;

    if (fraction.contains('/')) {
      List<String> parts = fraction.split(' ');
      if (parts.length == 2) {
        int whole = int.tryParse(parts[0]) ?? 0;
        List<String> fracParts = parts[1].split('/');
        if (fracParts.length == 2) {
          int numerator = int.tryParse(fracParts[0]) ?? 0;
          int denominator = int.tryParse(fracParts[1]) ?? 1;
          decimal = whole + numerator / denominator;
        }
      }
      print('Decimal value: $decimal');
      return decimal;
    } else {
      decimal = double.tryParse(fraction) ?? 0.0;
      print('Decimal value: $decimal');
      return decimal;
    }
  }

  void _addData() {
    double decimalLength = _onSubmitLength();
    double decimalWidth = _onSubmitWidth();
    if (_formKey.currentState!.validate()) {
      final quantity = _quantValue;
      final length = decimalLength + 1.25;
      final width = decimalWidth + 1.25;
      final height = _heightRate;
      final area = (length * width * quantity) / 144;
      final price = area * height;
      _netArea = _netArea + area;
      _netPrice = _netPrice + price;
      _netQuantity = _netQuantity + quantity;

      setState(() {
        _tableData.add({
          'quantity': _quantValue,
          'serialNumber': _tableData.length + 1,
          'length': _lengthController.text,
          'width': _widthController.text,
          'height': _heightRate.toStringAsFixed(2),
          'area': area.toStringAsFixed(2),
          'price': price.toStringAsFixed(3),
        });

        _lengthController.clear();
        _widthController.clear();
      });
    }
  }

  _submitData() {
    String NetPrice = _netPrice.toStringAsFixed(4);
    String NetArea = _netArea.toStringAsFixed(4);
    Alert(
        context: context,
        title: 'Calculated!',
        desc:
            'Net Price: $NetPrice\nNet Area: $NetArea\nNet Quantity: $_netQuantity\n',
        style: const AlertStyle(
          backgroundColor: Color(0x22EB1555),
          descStyle: TextStyle(color: Colors.white),
          titleStyle: TextStyle(color: Colors.white),
          isButtonVisible: false,
        )).show();
  }

  _clearData() {
    clearDataTable(_tableData, setState);
    _netArea = 0;
    _netPrice = 0;
    _netQuantity = 0;
  }

  void clearDataTable(List<Map<String, dynamic>> dataList, Function setState) {
    dataList.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dimensions Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _lengthController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          labelText: 'Length', hintText: 'in inches'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _widthController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                          labelText: 'Width', hintText: 'in inches'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<int>(
                      value: _quantValue,
                      decoration: const InputDecoration(labelText: 'Quantity'),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('1'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('2'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('3'),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text('4'),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text('5'),
                        ),
                        DropdownMenuItem(
                          value: 6,
                          child: Text('6'),
                        ),
                        DropdownMenuItem(
                          value: 7,
                          child: Text('7'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _quantValue = value!;
                        });
                      },
                    ),
                    DropdownButtonFormField<double>(
                      value: _heightRate,
                      decoration: const InputDecoration(labelText: 'Height'),
                      items: const [
                        DropdownMenuItem(
                          value: 10,
                          child: Text('3.5mm'),
                        ),
                        DropdownMenuItem(
                          value: 20,
                          child: Text('4mm'),
                        ),
                        DropdownMenuItem(
                          value: 30,
                          child: Text('5mm'),
                        ),
                        DropdownMenuItem(
                          value: 40,
                          child: Text('6mm'),
                        ),
                        DropdownMenuItem(
                          value: 50,
                          child: Text('7mm'),
                        ),
                        DropdownMenuItem(
                          value: 60,
                          child: Text('10mm'),
                        ),
                        DropdownMenuItem(
                          value: 70,
                          child: Text('12mm'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _heightRate = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _addData,
                          child: const Text(
                            'Add',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEB1555)),
                        ),
                        ElevatedButton(
                          onPressed: _submitData,
                          child: const Text('Submit',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEB1555)),
                        ),
                        ElevatedButton(
                          onPressed: _clearData,
                          child: const Text(
                            'Clear',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEB1555)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GestureDetector(
                    onScaleUpdate: (ScaleUpdateDetails details) {
                      setState(() {
                        _scale = _previousScale * details.scale;
                      });
                    },
                    onScaleEnd: (ScaleEndDetails details) {
                      setState(() {
                        _previousScale = _scale;
                      });
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: DataTable(
                        border: TableBorder.all(
                            color: Colors.white,
                            width: 2.0,
                            borderRadius: BorderRadius.circular(10.0)),
                        columns: const [
                          DataColumn(label: Center(child: Text('Sr.'))),
                          DataColumn(label: Center(child: Text('Length'))),
                          DataColumn(label: Center(child: Text('Width'))),
                          DataColumn(label: Center(child: Text('Height'))),
                          DataColumn(label: Center(child: Text('Nos.'))),
                          DataColumn(label: Center(child: Text('Area'))),
                          DataColumn(label: Center(child: Text('Price'))),
                        ],
                        rows: _tableData
                            .asMap()
                            .map((index, data) {
                              return MapEntry(
                                index,
                                DataRow(
                                  cells: [
                                    DataCell(Center(
                                        child: Text(
                                            data['serialNumber'].toString()))),
                                    DataCell(
                                        Center(child: Text(data['length']))),
                                    DataCell(
                                        Center(child: Text(data['width']))),
                                    DataCell(Center(
                                        child:
                                            Text(data['height'].toString()))),
                                    DataCell(Center(
                                        child:
                                            Text(data['quantity'].toString()))),
                                    DataCell(Center(child: Text(data['area']))),
                                    DataCell(Center(
                                        child: Text(data['price'].toString()))),
                                  ],
                                ),
                              );
                            })
                            .values
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
