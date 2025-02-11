import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado({
    required this.pontuacao,
    required this.quandoReiniciarQuestionario,
    super.key,
  });

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Precisa melhorar!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Parabéns!',
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(height: 10),
          Text(
            'Sua pontuação foi: $pontuacao',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            fraseResultado,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: quandoReiniciarQuestionario,
            child: const Text(
              'Reiniciar Questionário',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}