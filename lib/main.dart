//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp( const ContadorSalgados());

class ContadorSalgados extends StatelessWidget {
  const ContadorSalgados({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Statefulhome());
  }
}

class Statefulhome extends StatefulWidget {
  const Statefulhome({super.key});

  @override
  State<Statefulhome> createState() => _StatefulhomeState();
}

class _StatefulhomeState extends State<Statefulhome> {
  int count = 0;
  List<String> estados = [
    'touxa',
    'um pouco idiota',
    'meh',
    'matematica não é o forte das pessoas',
    'correto!'
  ];
  String? resposta;
  void increment() {
    setState(() {
      count++;
    });
    
  }

  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
    
  }

  String situacao() {
    if (count <= 25) {
      resposta = estados[0];
    } else if (count <= 35) {
      resposta = estados[1];
    } else if (count <= 40) {
      resposta = estados[2];
    } else if (count <= 45) {
      resposta = estados[3];
    } else {
      resposta = estados[4];
    }
    return resposta!;
  }

  bool get vazio => count ==0; // função  como uma variavel, cada vez que o count atualizar o status muda
  bool get vitoria => count >= 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(85, 15, 231, 159),
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          "Contador de salgados!",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          // o container serve para a coluna preencher o tamanho todo da tela,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/food.jpg'),
                  fit: BoxFit.cover)),
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    "Quantos Salgados Você Comeu?",
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    vazio ? '' : situacao(), // operador ternario
                    style:  TextStyle(
                      fontSize: 36,
                      color: vitoria ? Colors.green : Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    vazio ? '' : count.toString(),
                    style:  TextStyle(
                      fontSize: 36,
                      color: vitoria ? Colors.green :Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: vazio
                            ? null
                            : decrement, // vai desabilitar o botão qunado vazio
                        style: TextButton.styleFrom(
                            backgroundColor: vazio
                                ? const Color.fromARGB(29, 255, 255, 255)
                                : Colors.greenAccent,
                            primary: Colors.white70,
                            fixedSize: const Size(60, 60),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white,
                                  width: 2.5), // linha da borta, tamanho e cor
                              borderRadius: BorderRadius.circular(
                                  16), // controla  o arredondamento da borda
                            )),
                        child: const Text(
                          '-',
                          style: TextStyle(
                              fontSize: 42, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      width: 24,
                    ),
                    TextButton(
                        onPressed: increment,
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            primary: Colors.white70,
                            fixedSize: const Size(60, 60),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white,
                                  width: 2.5), // linha da borta, tamanho e cor
                              borderRadius: BorderRadius.circular(
                                  16), // controla  o arredondamento da borda
                            )),
                        child: const Text(
                          '+',
                          style: TextStyle(
                              fontSize: 42, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ])),
    );
  }
}
