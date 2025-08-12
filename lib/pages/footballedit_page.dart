import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../models/football_models.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final FootballController footballController = Get.find();
  late final int playerIndex = Get.arguments as int;
  late final Player player = footballController.players[playerIndex];

  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final profileImageController = TextEditingController();
  final jerseyNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = player.name;
    positionController.text = player.position;
    profileImageController.text = player.profileImage;
    jerseyNumberController.text = player.jerseyNumber.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Players"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Player ${playerIndex + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: positionController,
              decoration: const InputDecoration(labelText: 'Position'),
            ),
            TextField(
              controller: profileImageController,
              decoration: const InputDecoration(labelText: 'Profile Image'),
            ),
            TextField(
              controller: jerseyNumberController,
              decoration: const InputDecoration(labelText: 'Jersey Number'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                footballController.updatePlayer(
                  playerIndex,
                  Player(
                    name: nameController.text,
                    position: positionController.text,
                    profileImage: profileImageController.text,
                    jerseyNumber: int.tryParse(jerseyNumberController.text) ?? 0,
                  ),
                );
                Get.back();
              },
              child: const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
