import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
  double amount = 0;
  double rate = 0;
  double tenure = 0;
  double answer = 0;
  double emi = 0;

  void loan(double value)
  {
    amount = value;
    notifyListeners();
  }
  void interest(double value)
  {
    rate = value;
    notifyListeners();
  }
  void duration(double value)
  {
    tenure = value;
    notifyListeners();
  }
  void cal()
  {
    answer = amount * rate / 100 * tenure;
    notifyListeners();
  }
 void Emi()
 {
   emi = (amount + answer)/ 12;
   notifyListeners();
 }

}