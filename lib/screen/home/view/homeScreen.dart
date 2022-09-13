import 'package:emiprovider/screen/home/provider/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blue.shade900,
            child: Column(
              children: [
                Text(
                  "EMI Calculator",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Padding(padding: EdgeInsets.only(top: 100)),
                Text("Emi Per Month : ${Provider.of<HomeProvider>(context).emi.toInt()}",style: TextStyle(fontSize: 20,color: Colors.white),),
                Text("Total Interest : ${Provider.of<HomeProvider>(context).answer.toInt()}",style: TextStyle(fontSize: 20,color: Colors.white),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50)),
              ),
              child: Column(
                children: [

                  //Loan Amount
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Loan Amount",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "${Provider.of<HomeProvider>(context, listen: true).amount}",
                    style: TextStyle(fontSize: 25),
                  ),
                  Slider(
                    min: 0,
                    max: 100000,
                    divisions: 100,
                    value:
                        Provider.of<HomeProvider>(context, listen: true).amount,
                    onChanged: (value) {
                      Provider.of<HomeProvider>(context, listen: false).loan(value);
                    },
                  ),


                  //Interest Rate
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Interest Rate",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "${Provider.of<HomeProvider>(context, listen: true).rate}",
                    style: TextStyle(fontSize: 25),
                  ),
                  Slider(
                    min: 0,
                    max: 15,
                    divisions: 15,
                    value:
                        Provider.of<HomeProvider>(context, listen: true).rate,
                    onChanged: (value) {
                      Provider.of<HomeProvider>(context, listen: false).interest(value);
                    },
                  ),


                  //Loan Duration
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Loan Tenure",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "${Provider.of<HomeProvider>(context, listen: true).tenure}  Year",
                    style: TextStyle(fontSize: 25),
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    divisions: 30,
                    value:
                        Provider.of<HomeProvider>(context, listen: true).tenure,
                    onChanged: (value) {
                      Provider.of<HomeProvider>(context, listen: false).duration(value);
                    },
                  ),

                  Padding(padding: EdgeInsets.only(top: 50)),

                  ElevatedButton(onPressed: (){
                    Provider.of<HomeProvider>(context,listen: false).cal();
                    Provider.of<HomeProvider>(context,listen: false).Emi();
                  }, child: Text("Calculate",style: TextStyle(fontSize: 20),)),

                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
