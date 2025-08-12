class Player {
  final String profileImage;
  final String name;
  final String position;
  final int jerseyNumber;

  Player({
    required this.profileImage,
    required this.name,
    required this.position,
    required this.jerseyNumber,
  });

  Player copyWith({
    String? profileImage,
    String? name,
    String? position,
    int? jerseyNumber,
  }) {
    return Player(
      profileImage: profileImage ?? this.profileImage,
      name: name ?? this.name,
      position: position ?? this.position,
      jerseyNumber: jerseyNumber ?? this.jerseyNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'profileImage': profileImage,
      'name': name,
      'position': position,
      'jerseyNumber': jerseyNumber,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      profileImage: map['profileImage'],
      name: map['name'],
      position: map['position'],
      jerseyNumber: map['jerseyNumber'],
    );
  }
}

class Team {
  final String name;
  final List<Player> players;

  Team({required this.name, required this.players});
}
