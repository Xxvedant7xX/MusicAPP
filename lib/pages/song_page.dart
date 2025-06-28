import 'package:flutter/material.dart';
import 'package:music_app/components/neu_box.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: Column(
            children: [
              //app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //back button
                  IconButton(onPressed: (){},
                   icon: Icon(Icons.arrow_back_ios),
                   ),
          
                  //title
                  Text("P L A Y L I S T"),
                  
                  //menu button
                  IconButton(onPressed: (){},
                   icon: Icon(Icons.menu),
                  ),
               ],
              ),
              //album artwork
              NeuBox(
                child: Column(
                  children: [
                    //image
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.asset("assets/images/album_artwork_1.jpg"),
                      ),

                      //song and artist name and icon
                      Row(
                        children: [
                          //song and artist name

                          //heart icon
                        ],
                      ),
                  ],
                ),
                ),
              //song duration progress
              //palyback controls
          ],
          ),
        ),
      ),
    ),
    );
  }
}