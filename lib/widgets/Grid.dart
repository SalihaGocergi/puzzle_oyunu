import 'package:flutter/material.dart';
import 'package:puzzle_app/widgets/GridButton.dart';

//oyun içeriği
class Grid extends StatelessWidget {
  var numbers = [];
  var size;
  Function clickGrid;

  Grid(this.numbers, this.size, this.clickGrid);

  @override
  Widget build(BuildContext context) {
    var height = size.height;
//Butonların özellikleri
    return Container(
      height: height * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, //sütun adeti belirlendi.
            mainAxisSpacing: 5, //satır aralığındak boşluklar
            crossAxisSpacing: 5, //sütun aralığındaki boşluklar
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            return numbers[index] != 0
                ? GridButton("${numbers[index]}", () {
                    clickGrid(index);
                  })
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
