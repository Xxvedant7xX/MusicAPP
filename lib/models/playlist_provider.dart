import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  //playlists of songs
  final List<Song> _playlist = [
    //song 1
    Song(
      songName: "Cry For Me", 
      artistName: "Weeknd", 
      albumArtImagePath: "assets/images/album_artwork_1.jpg", 
      audioPath: "audio/chill.mp3",
    ),
    //song 2
    Song(
      songName: "Starboy", 
      artistName: "Weeknd", 
      albumArtImagePath: "assets/images/album_artwork_2.jpg", 
      audioPath: "audio/chill.mp3",
    ),

    //song 3
    Song(
      songName: "One Of The Girls", 
      artistName: "Weeknd", 
      albumArtImagePath: "assets/images/album_artwork_3.jpg", 
      audioPath: "audio/chill.mp3",
    ),
  ];

  //current song playing index
  int? _currentSongIndex;
  /*
  G E T T E R S
  */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  /*
  S E T T E R S
  */

  set currentSongIndex(int? newIndex) {

    //update current song index
    _currentSongIndex = newIndex;

    //update UI
    notifyListeners();
  }
}