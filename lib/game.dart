import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

enum ChooseMove {
  rock,
  paper,
  scissors,
}

class _GameState extends State<Game> {
  var _appImage = const AssetImage("images/padrao.png");
  var _message = 'Escolha uma opção abaixo';

  _selectedOption(ChooseMove _userChoise) {
    var randomNumber = Random().nextInt(3);

    var _appChoise = ChooseMove.values[randomNumber];

    switch (_appChoise) {
      case ChooseMove.rock:
        setState(() {
          _appImage = const AssetImage("images/pedra.png");
        });
        break;
      case ChooseMove.paper:
        setState(() {
          _appImage = const AssetImage("images/papel.png");
        });
        break;
      case ChooseMove.scissors:
        setState(() {
          _appImage = const AssetImage("images/tesoura.png");
        });
        break;
    }

    // user winner
    if (_userChoise == ChooseMove.rock && _appChoise == ChooseMove.scissors ||
        _userChoise == ChooseMove.scissors && _appChoise == ChooseMove.paper ||
        _userChoise == ChooseMove.paper && _appChoise == ChooseMove.rock) {
      _message = "Parabéns! Você ganhou! :)";
    }

    // app winner
    else if (_appChoise == ChooseMove.rock &&
            _userChoise == ChooseMove.scissors ||
        _appChoise == ChooseMove.scissors && _userChoise == ChooseMove.paper ||
        _appChoise == ChooseMove.paper && _userChoise == ChooseMove.rock) {
      _message = "Você perdeu! :( ";
    }

    // draw
    else {
      _message = "Deu empate! :P";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Pedra, Papel ou Tesoura?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: _appImage),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _selectedOption(ChooseMove.rock),
                child: Image.asset('images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _selectedOption(ChooseMove.paper),
                child: Image.asset('images/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => _selectedOption(ChooseMove.scissors),
                child: Image.asset('images/tesoura.png', height: 100),
              ),
            ],
          )
        ],
      ),
    );
  }
}
