import 'package:kula/cubits/restaurant_cubit/meal_model.dart';
import 'package:kula/cubits/restaurant_cubit/restaurant_model.dart';

typedef Token = ({String access, String refresh});

typedef Location = ({double longitude, double latitude});
typedef ResMeal = ({Restaurant restaurant, Meal meal});
