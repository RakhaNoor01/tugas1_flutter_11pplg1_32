import 'package:get/get.dart';
import '../models/football_models.dart';

class FootballController extends GetxController {
  var players = <Player>[
    Player(
      profileImage: 'images/player1.png',
      name: 'Cristiano Ronaldo',
      position: 'Forward',
      jerseyNumber: 7,
    ),
    Player(
      profileImage: 'images/player2.png',
      name: 'Lionel Messi',
      position: 'Forward',
      jerseyNumber: 10,
    ),
    Player(
      profileImage: 'images/player3.png',
      name: 'Neymar Jr',
      position: 'Forward',
      jerseyNumber: 11,
    ),
    Player(
      profileImage: 'images/player4.png',
      name: 'Kylian Mbappe',
      position: 'Forward',
      jerseyNumber: 9,
    ),
  ].obs;

  // Method to update a player
  void updatePlayer(int index, Player updatedPlayer) {
    players[index] = updatedPlayer;
  }
}
