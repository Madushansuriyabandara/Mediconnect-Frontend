import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:mediconnect/screens/doctor_screens/StatsPage/widgets/appointmenttable.dart';
import 'package:flutter/material.dart';
import 'package:mediconnect/screens/doctor_screens/StatsPage/widgets/rating.dart';


class Barchart extends StatelessWidget {
  const Barchart({super.key});
 
 ///////////////////////////////////////////////////////  this part shows booked Appointment ////////////////////////////////////////////////////
  // ignore: non_constant_identifier_names
  static List<charts.Series<Barmodel, String>> createsample_appointment_data() {
    final data = [
      Barmodel('Mon', 10),
      Barmodel('Tue', 40),
      Barmodel('Wed', 50),
      Barmodel('Thus', 100),
      Barmodel('Fri', 75),  
      Barmodel('Sat', 65),
      Barmodel('Sun', 80),    
    ];
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    return [
      charts.Series<Barmodel, String>(
        id: 'sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Barmodel barmodel, _) => barmodel.year,
        measureFn: (Barmodel barmodel, _) => barmodel.count,
        data: data,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STATS",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
       // backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(2),
        child: 
        Column(children: [
        const Align(
                alignment: Alignment.centerLeft,
                    child: Text(
                        "Appointments Summary",
                        //style: TextStyle(),
                        style: TextStyle(fontWeight: FontWeight.bold)
                        ),
              ),

        SizedBox(
        height: 300,
        child: charts.BarChart(
          createsample_appointment_data(),
          animate: true,
        ),
      ),
       const SizedBox(height: 20,),
      
      const Text("Appointment Detail",style: TextStyle(fontWeight: FontWeight.bold),),
      const Appointment_Table(),
      const SizedBox(height: 20,),

      const Text("Rate",style: TextStyle(fontWeight: FontWeight.bold),),
      Rating(4.5),
      
      
      ]),
    ),
    );
  }
}

class Barmodel {
  final String year;
  final int count;
  Barmodel(this.year, this.count);
}



class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Barchart(),
    );
  }
}