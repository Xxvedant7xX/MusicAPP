import 'package:flutter/material.dart';
import 'package:music_app/components/neu_box.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get playlist
        final playlist = value.playlist;

        //get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return scaffold UI
        return Scaffold(
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
                  IconButton(
                    onPressed: () => Navigator.pop(context),
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

              SizedBox(height: 25,),

              //album artwork
              NeuBox(
                child: Column(
                  children: [
                    //image
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.asset(currentSong.albumArtImagePath),
                      ),

                      //song and artist name and icon
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName, 
                                  style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  ),
                                ),
                                Text(currentSong.artistName),
                            ],
                            ),
                        
                            //heart icon
                            Icon(Icons.favorite,
                            color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                ),

                SizedBox(height: 25,),

              //song duration progress
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //start time
                        Text("0:00"),
                    
                        //shuffle icon
                        Icon(Icons.shuffle),
                    
                        //repeat icon
                        Icon(Icons.repeat),
                    
                        //end time
                        Text("0:00"),
                    ],
                    ),
                  ),

                  SizedBox(height:15),
                  
                  //song duration progress
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: 
                         RoundSliderThumbShape(enabledThumbRadius: 0),
                    ),
                    child: Slider(
                      min: 0,
                      max: 100,
                      value: 50,
                      activeColor: Colors.grey,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              //palyback controls
              Row(
                children: [
                //skip previous
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: NeuBox(
                      child: Icon(Icons.skip_previous), 
                      ),
                  ),
                ),

                SizedBox(width: 15,),

                //play pause
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: NeuBox(
                      child: Icon(Icons.play_arrow), 
                      ),
                  ),
                ),

                SizedBox(width: 15,),

                //skip forward
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: NeuBox(
                      child: Icon(Icons.skip_next), 
                      ),
                  ),
                ),
              ],
              ),
            ],
           ),
         ),
        ),
      );
     }
   );
 }
}