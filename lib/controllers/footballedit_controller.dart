import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/football_controller.dart';
import '../models/football_models.dart';

class FootballEditController extends GetxController {
  final FootballController footballController = Get.find<FootballController>();

  late List<Player> editedPlayers;

  // Tambahan: simpan controller per field
  late List<TextEditingController> nameControllers;
  late List<TextEditingController> positionControllers;
  late List<TextEditingController> imageControllers;
  late List<TextEditingController> jerseyControllers;

  @override
  void onInit() {
    super.onInit();

    editedPlayers = List.from(footballController.players);

    // Inisialisasi controller berdasarkan data awal
    nameControllers = editedPlayers.map((p) => TextEditingController(text: p.name)).toList();
    positionControllers = editedPlayers.map((p) => TextEditingController(text: p.position)).toList();
    imageControllers = editedPlayers.map((p) => TextEditingController(text: p.profileImage)).toList();
    jerseyControllers = editedPlayers.map((p) => TextEditingController(text: p.jerseyNumber.toString())).toList();
  }

  void updatePlayerName(int index, String name) {
    editedPlayers[index] = editedPlayers[index].copyWith(name: name);
  }

  void updatePlayerPosition(int index, String position) {
    editedPlayers[index] = editedPlayers[index].copyWith(position: position);
  }

  void updatePlayerProfileImage(int index, String profileImage) {
    editedPlayers[index] = editedPlayers[index].copyWith(profileImage: profileImage);
  }

  void updatePlayerJerseyNumber(int index, int jerseyNumber) {
    editedPlayers[index] = editedPlayers[index].copyWith(jerseyNumber: jerseyNumber);
  }

  void saveChanges() {
    for (int i = 0; i < editedPlayers.length; i++) {
      footballController.updatePlayer(i, editedPlayers[i]);
    }
  }
}
