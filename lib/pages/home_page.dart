import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Liste qui va contenir les musiques venant de l'API
  List musiques = [];

  // Fonction qui appelle l'API iTunes
  Future<void> fetchMusiques() async {
    final response = await http.get(
      Uri.parse(
        'https://corsproxy.io/?https://itunes.apple.com/search?term=Wallace+Cleaver&entity=song&limit=20',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        musiques = data["results"];
      });
    }
  }

  // Appelé une seule fois quand la page démarre
  @override
  void initState() {
    super.initState();
    fetchMusiques();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music App")),

      body: musiques.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: musiques.length,
              itemBuilder: (context, index) {
                final musique = musiques[index];

                return ListTile(
                  leading: Image.network(musique["artworkUrl100"]),
                  title: Text(musique["trackName"] ?? "Sans titre"),
                  subtitle: Text(musique["artistName"] ?? "Artiste inconnu"),
                  trailing: const Icon(Icons.play_arrow),
                );
              },
            ),
    );
  }
}
