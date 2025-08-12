import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../models/football_models.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});

  final FootballController footballController = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Football Players"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballController.players.length,
            itemBuilder: (context, index) {
              final player = footballController.players[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(player.profileImage),
                  ),
                  title: Text(
                    player.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Position: ${player.position}'),
                      Text('Jersey: #${player.jerseyNumber}'),
                    ],
                  ),
                  trailing: const Icon(Icons.person, color: Colors.blue),
                  onTap: () {
                    // Pindah ke halaman edit dengan index pemain
                    Get.toNamed('/footballedit', arguments: index);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}