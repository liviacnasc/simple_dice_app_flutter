class Dice {
  
  int sides = 0;
  String name = '';
  String imagePath = '';

  Dice({ 
    required this.sides
  }) {
    imagePath = "assets/images/d$sides.png";
    name = "d$sides";
  }
}