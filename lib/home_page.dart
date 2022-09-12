import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _textController = TextEditingController();
  bool isSwitched = false;
  double? tip;
  double final_tip = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cost of service',
              ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: 
            Column(children: [
                RadioListTile(
                title: Text("Amazing 20%"),
                value: 0.20, 
                groupValue: tip, 
                onChanged: (value){
                  setState(() {
                      tip = double.parse(value.toString());
                  });
                 },
                ),
                RadioListTile(
                title: Text("Good 18%"),
                value: 0.18, 
                groupValue: tip, 
                onChanged: (value){
                  setState(() {
                      tip = double.parse(value.toString());
                  });
                 },
                ),
                RadioListTile(
                title: Text("Okay 15%"),
                value: 0.15, 
                groupValue: tip, 
                onChanged: (value){
                  setState(() {
                      tip = double.parse(value.toString());
                  });
                 },
                ),
            ],)
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text("Round up tip"),
            trailing: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(15.0),
                    textStyle: TextStyle(fontSize: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),)
                    ),
                  onPressed: (){
                    if(_textController.text.isNotEmpty){
                      _tipCalculation();
                    (context as Element).markNeedsBuild();
                    }else{
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error!'),
                          content: const Text('No has llenado los datos necesarios para proceder'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('Volver'),
                            ),
                          ],
                        ),
                      );
                    }
                  }, child: Text("CALCULATE"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Text("Tip amount: \$20.20"),
                  Text("Tip amount: \$${final_tip.toStringAsFixed(2)}"),
                ],)
              ],
            )
          )
        ],
      ),
    );
  }


  void _tipCalculation() {
    if(isSwitched){
      double result = (double.parse(_textController.text) * tip!).roundToDouble();
      final_tip = result;
      //print("Result: ${result}");
    }else{
      double result = double.parse(_textController.text) * tip!;
      final_tip = result;
      //print("Result: ${result}");
    };
  }
}