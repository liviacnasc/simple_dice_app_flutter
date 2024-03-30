import 'package:objectbox/objectbox.dart';

@Entity()
class Dice {
  @Id()
  int id;
  
  int sides = 0;
  String name = '';
  String imagePath = '';

  Dice({ 
    this.id = 0,
    required this.sides
  }) {
    imagePath = "assets/images/d$sides.png";
    name = "d$sides";
  }
}