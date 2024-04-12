import 'package:objectbox/objectbox.dart';

@Entity()

class Roll {
  @Id()
  int id;
  
  int total;
  int modifier;
  List<int> diceRolls = [];
  List<String> dicesRolled;

  Roll({ 
    this.id = 0,
    required this.total,
    required this.modifier,
    required this.diceRolls,
    required this.dicesRolled
  });
}