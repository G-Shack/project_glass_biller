import 'package:flutter/material.dart';
import 'package:glass_biller/unit_count.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Unit { inch, foot }

const activeColor = Colors.amberAccent;
const inactiveColor = Color(0xFF090d23);
int getBillNo = 0;

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Unit selectedUnit = Unit.inch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Glass Biller'),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: CircleAvatar(
                  radius: 150.0,
                  backgroundImage: AssetImage('images/finallogo.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 10.0),
                child: Text(
                  'Select Unit',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedUnit = Unit.inch;
                        });
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: selectedUnit == Unit.inch
                            ? inactiveColor
                            : activeColor,
                        backgroundColor: selectedUnit == Unit.inch
                            ? activeColor
                            : inactiveColor,
                      ),
                      child: Text(
                        '  Inch  ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedUnit = Unit.foot;
                        });
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: selectedUnit == Unit.foot
                            ? inactiveColor
                            : activeColor,
                        backgroundColor: selectedUnit == Unit.foot
                            ? activeColor
                            : inactiveColor,
                      ),
                      child: Text(
                        '  Foot  ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bill No.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  SizedBox(
                    width: 150.0,
                    child: TextField(
                      onChanged: (value) {
                        getBillNo = int.parse(value);
                        //TODO Got the bill no here
                      },
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        hintText: 'Enter Bill No.',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrangeAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (getBillNo != 0) {
                    Navigator.pushNamed(context, '/UnitCount');
                  } else {
                    Fluttertoast.showToast(
                        msg: "Enter Bill No.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Color(0xFFe74c3c),
                        textColor: Color(0xffffffff));
                  }
                },
                child: Container(
                  height: 64.0,
                  margin: EdgeInsets.only(top: 40, left: 20.0, right: 20.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Color(0xDDEB72A1),
                    color: Color(0xFFEB1555),
                    elevation: 8.0,
                    child: Center(
                      child: Text(
                        'PROCEED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ),
      )),
    );
  }
}
