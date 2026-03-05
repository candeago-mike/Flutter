import 'package:flutter/material.dart';
import 'player_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> musiques = const [
    {
      "titre": "Andalouse",
      "artiste": "Kendji Girac",
      "image":
          "https://i.scdn.co/image/ab67616d0000b2730b113a7be9d3fe392c238558",
    },
    {
      "titre": "Magic in the air",
      "artiste": "Magic System",
      "image":
          "https://m.media-amazon.com/images/I/71BxXSyM6GL._UF894,1000_QL80_.jpg",
    },
    {
      "titre": "Dernière danse",
      "artiste": "Indila",
      "image":
          "https://cdn-images.dzcdn.net/images/cover/6efb3506ac68e18e23d8f62d8b38ebfb/1900x1900-000000-80-0-0.jpg",
    },
    {
      "titre": "Chandelier",
      "artiste": "Sia",
      "image":
          "https://i.scdn.co/image/ab67616d0000b273b55ed804149fffbb5e35ff34",
    },
    {
      "titre": "J’aimerais trop",
      "artiste": "Keen’v",
      "image":
          "https://cdn-images.dzcdn.net/images/cover/236ebac9bde67d4b482b5f17a3f06666/1900x1900-000000-80-0-0.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music App")),
      body: ListView.builder(
        itemCount: musiques.length,
        itemBuilder: (context, index) {
          final musique = musiques[index];

          return ListTile(
            leading: Image.network(musique["image"]!),
            title: Text(musique["titre"]!),
            subtitle: Text(musique["artiste"]!),
            trailing: const Icon(Icons.play_arrow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerPage(musique: musique),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
