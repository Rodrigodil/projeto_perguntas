import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto':'Preto', 'pontuacao': 10}, 
        {'texto':'Vermelho', 'pontuacao': 7}, 
        {'texto':'Verde', 'pontuacao': 5}, 
        {'texto':'Branco', 'pontuacao': 3},
        {'texto':'Azul', 'pontuacao': 1}
        ],       
      },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto':'Gato', 'pontuacao': 10}, 
        {'texto':'Cachorro', 'pontuacao': 7}, 
        {'texto':'Coelho', 'pontuacao': 5}, 
        {'texto':'Cobra', 'pontuacao': 3},
        {'texto':'Elefante', 'pontuacao': 1}
        ],       
        
    },
    {
      'texto': 'Qual é o seu Heroi favorito?',
      'respostas': [
        {'texto':'Capitão America', 'pontuacao': 10}, 
        {'texto':'Homem de Ferro', 'pontuacao': 7}, 
        {'texto':'Thor', 'pontuacao': 5}, 
        {'texto':'Hulk', 'pontuacao': 3},
        {'texto':'Viúva Negra', 'pontuacao': 1}
        ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {'texto':'Maria', 'pontuacao': 10}, 
        {'texto':'João', 'pontuacao': 7}, 
        {'texto':'Leo', 'pontuacao': 5}, 
        {'texto':'Pedro', 'pontuacao': 3},
        {'texto':'Rodrigo', 'pontuacao': 1}
        ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                  )
                : Resultado(
        pontuacao: _pontuacaoTotal,
        quandoReiniciarQuestionario: _reiniciarQuestionario,
      ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado({super.key, required this.pontuacao, required this.quandoReiniciarQuestionario});

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
          ElevatedButton(
            onPressed: quandoReiniciarQuestionario,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
              foregroundColor: Colors.white, // Text color
            ),
            child: const Text('Reiniciar Perguntas'),
          ),
        ],
      ),
    );
  }
}
