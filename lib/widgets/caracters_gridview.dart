import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/caracters_provider.dart';
import 'caracter_item_gridview.dart';

class CaractersGridview extends StatelessWidget {
  const CaractersGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final caractersProvider =
        Provider.of<CaractersProvider>(context, listen: true);
    final caracters = caractersProvider.caracters;
    return GridView.builder(
      itemCount: caracters.length,
      padding: const EdgeInsets.all(10),

      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: caracters[i],
        child: CaracterItemGridView(
          key: ValueKey(caracters[i].id),
          caracter: caracters[i],
        ),
      ),
      // Delega a forma de renderizar a grid de uma forma que ela tenha um tamnho fixo nas linhas
      // e mostre somente 2 widgets(Produtos)
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // Indica a quantidade de widgets que vai ter na linha
        crossAxisCount: 2, childAspectRatio: 1 / 1.35,
        // define o espaçamento no eixo das linhas
        crossAxisSpacing: 10,
        // define o espaçamento no eixo das colunas
        mainAxisSpacing: 10,
      ),
    );
  }
}
