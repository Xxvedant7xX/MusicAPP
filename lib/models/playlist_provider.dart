import 'package:audioplayers/audioplayers.dart';
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
  A U D I O P L A Y E R
  */

  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  //durations
  Duration _currentDuration =Duration.zero;
  Duration _totalDuration = Duration.zero;
  
  //constructor
  PlaylistProvider() {
    listenToDuration();
  }
  
  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async{
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); //stop current song
    await _audioPlayer.play(AssetSource(path)); //play the new song
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song

  //resume playing

  //pause or resume

  //seek to a specific position in the current song

  //play previous song

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    }
    );

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition){
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen to song completion
    _audioPlayer.onPlayerComplete.listen((event){});
  }

  //dispose audio player
  
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