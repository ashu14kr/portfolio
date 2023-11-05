import 'dart:async';

import 'package:dev/globalv.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class GlobalPov with ChangeNotifier{

  GlobalVariable _variable = GlobalVariable();
  TikTacToe _game = TikTacToe();

  GlobalVariable get variable => _variable;
  TikTacToe get game => _game;

  void updateData(String newValue) {
    _variable.game = newValue;
    notifyListeners();
  }

  void updateSelectedShape(String newValue) {
    _variable.shapeSelect = newValue;
    notifyListeners();
  }

  void updatePlayerShape(String newValue) {
    _game.player = newValue;
    notifyListeners();
  }

  void updateOpponentShape(String newValue) {
    _game.opponent = newValue;
    notifyListeners();
  }

  void play(int index){
    if(_variable.shapeSelect == "x" && _game.board[index] == ""){
      _game.board[index] = "x";
      checkWin(_variable.shapeSelect);
      updateSelectedShape("o");
    }else if(_game.board[index] != "x"){
      _game.board[index] = "o" ;
      checkWin(_variable.shapeSelect);
      updateSelectedShape("x");
    }
    notifyListeners();
  }

  void robot(int index){
    Random random = Random();
    var robo = random.nextInt(9);
    if(_game.board[robo] != _game.player){
      _game.board[robo] = _game.opponent;
    }else{
      play(index);
    }
  }


  void checkWin(String player){
    if ( _game.board[0] == player && _game.board[1] == player && _game.board[2] == player ||
      _game.board[3] == player && _game.board[4] == player && _game.board[5] == player ||
      _game.board[6] == player && _game.board[7] == player && _game.board[8] == player ||
      _game.board[0] == player && _game.board[3] == player && _game.board[6] == player ||
      _game.board[1] == player && _game.board[4] == player && _game.board[7] == player ||
      _game.board[2] == player && _game.board[5] == player && _game.board[8] == player ||
      _game.board[0] == player && _game.board[4] == player && _game.board[8] == player ||
      _game.board[2] == player && _game.board[4] == player && _game.board[6] == player)
      {
        if (_game.player.contains(player)) {
          _game.result = "Player" + " " + player.toUpperCase() + " " + "Won";
          Timer(Duration(seconds: 2), () {playAgain();});
        }else if(_game.opponent.contains(player)){
          _game.result = "Player" + " " + _game.player.toUpperCase() + " " + "Lost";;
          Timer(Duration(seconds: 2), () {playAgain();});
        }
    } else if(_game.board.every((element) => element.isNotEmpty)){
      _game.result = "Match"+"Draw";
      Timer(Duration(seconds: 2), () {playAgain();});
    }
    notifyListeners();
  }

  void playAgain(){
    for (var i = 0; i < 9; i++) {
      _game.board[i] = "";
    }
    _game.player = "x";
    _game.opponent = "o";
    _game.result = "";
    _variable.shapeSelect = "x";
    notifyListeners();
  }
}