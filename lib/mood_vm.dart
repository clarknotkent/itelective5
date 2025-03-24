import 'package:june/june.dart';

class MoodVM extends JuneState {
  String emoji = "😐";
  String mood = "Neutral";

  void setMood(String newMood, String newEmoji) {
    mood = newMood;
    emoji = newEmoji;
    setState(); // triggers rebuild for JuneBuilder
  }
}
