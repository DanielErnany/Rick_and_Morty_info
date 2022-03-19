import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_info/models/caracter.dart';
import 'package:rick_and_morty_info/providers/caracters_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CaractersProvider(),
      child: MaterialApp(
        title: 'Rick and Morty info',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final caractersProvider =
        Provider.of<CaractersProvider>(context, listen: true);
    final caracters = caractersProvider.caracters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty info'),
      ),
      body: GridView.builder(
        // informa quantos elementos vão ter na gridview
        itemCount: caracters.length,
        padding: EdgeInsets.all(10),
        // Adiciona os produtos no grid view
        // ChangeNotifier faz com que seja atualizado quando acontecer alguma anteração no produto seja avisado
        // Como vamos usar um ChangeNotifier que ja foi criado(dentro da classe product)
        //  o certo é usar o metodo value
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: caracters[i],
          child: Column(
            children: [
              Container(
                height: 150,
                child: Image.network(caracters[i].image),
              ),
              Text(caracters[i].name),
            ],
          ),
        ),
        // Delega a forma de renderizar a grid de uma forma que ela tenha um tamnho fixo nas linhas
        // e mostre somente 2 widgets(Produtos)
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // Indica a quantidade de widgets que vai ter na linha
          crossAxisCount: 2,
          // como as dimensoes dos produtos vao ser mostrados dependendo da resolução da tela
          childAspectRatio: 1,
          // define o espaçamento no eixo das linhas
          crossAxisSpacing: 10,
          // define o espaçamento no eixo das colunas
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
