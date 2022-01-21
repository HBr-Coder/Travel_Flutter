import 'package:flutter/foundation.dart';
import 'package:travel_ui/models/HotDestinaltion.dart';

//create item model which extends ChangeNotifier
class FunctionsModel extends ChangeNotifier {
  List<HotDestinations> _destinations = [];

  //get total count of items added to favorite
  int get count {
    return _destinations.length;
  }

  //return added items
  List<HotDestinations> get list {
    return _destinations;
  }

  
  void addCountry(HotDestinations item) {
    _destinations.add(item);
    notifyListeners(); 
  }
}
