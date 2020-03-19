import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

Future<AudioPlayer> play(String name) async {
  AudioCache cache = new AudioCache();
  return await cache.play('sounds/$name.mp3');
}