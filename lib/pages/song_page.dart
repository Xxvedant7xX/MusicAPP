import 'package:flutter/material.dart';
import 'package:music_app/components/neu_box.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  //convert duration into min:seconds
  String formatTime(Duration duration) {
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2,'0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }

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
                        Text(formatTime(value.currentDuration)),
                    
                        //shuffle icon
                        Icon(Icons.shuffle),
                    
                        //repeat icon
                        Icon(Icons.repeat),
                    
                        //end time
                        Text(formatTime(value.totalDuration)),
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
                      max: value.totalDuration.inSeconds.toDouble(),
                      value: value.currentDuration.inSeconds.toDouble(),
                      activeColor: Colors.grey,
                      onChanged: (double double) {
                        //during when the user is sliding around
                      },
                      onChangeEnd: (double double) {
                        //sliding has finished, go to that position in song duration
                        value.seek(Duration(seconds: double.toInt()));
                      },
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
                    onTap: value.playPreviousSong,
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
                    onTap: value.pauseOrResume,
                    child: NeuBox(
                      child: Icon(value.isPlaying ? Icons.pause: Icons.play_arrow), 
                      ),
                  ),
                ),

                SizedBox(width: 15,),

                //skip forward
                Expanded(
                  child: GestureDetector(
                    onTap: value.playNextSong,
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