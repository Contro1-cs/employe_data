import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController role = new TextEditingController();
  // DateTime date = DateTime(2012, 12, 17);
  String startDate = ' ' ;
  String difference = ' ' ;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(title: const Text("Add employee's data",style: TextStyle(color: Colors.black),),backgroundColor: Color(0xffF3EDF5),),
      body:SingleChildScrollView
      ( child: Center(
        child: Container(
          margin: const EdgeInsets.all(15),
          width: w,
          height: w + 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black)
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //TextField for Name input
                Text("Name", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextFormField(
                  controller: name,
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // onSaved: (value) {
                    //
                    // },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    )
                ),

                //TextField for Role inupt
                SizedBox(height: 20,),
                Text("Role", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextFormField(
                  controller: role,
                    autofocus: false,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    // onSaved: (value) {
                    //
                    // },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    )
                ),

                //Display selected date
                SizedBox(height: 20,),
                Text("Started working", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Text(
                  // '${date.day}-${date.month}-${date.year}',
                  startDate,
                ),

                //Button to select date
                SizedBox(height: 10),
                ElevatedButton(child: Text('Select date') , onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1700),
                    lastDate: DateTime(2050),
                  );
                  setState(() {
                    DateTime now = DateTime.now();
                    Duration diff = newDate?.difference(now) as Duration;
                    // startDate = newDate.toString();
                    startDate = DateFormat('dd-MM-yyyy').format(newDate!);
                    difference = diff.inDays.toString();
                  }
                  );
                  if(newDate == null) return;
                }

                ),

                //Displays the number of days an employee has beed working
                SizedBox(height: 20,),
                Text("Working duration", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Text(
                    '$difference days',
                ),

                //Upload button
                SizedBox(height: 40,),
                ElevatedButton(onPressed: () {

                }, child: Text("Upload")),
              ],
            ),
          ),
        ),
      ),)
    );
  }
}
