import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteStorage extends ChangeNotifier {
  late SharedPreferences _prefs;

  late List<String> favoriteIds = [];

  FavoriteStorage() {
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    await _readLocale();
  }

  Future<void> _startPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _readLocale() async {
    favoriteIds = await _prefs.getStringList('favoriteVideoIds') ?? [];

    notifyListeners();
  }

  setFavoriteLocale(String videoId) async {
    final List<String>? videoIds = await _prefs.getStringList('favoriteVideoIds');

    if (videoIds == null) {
      await _prefs.setStringList('favoriteVideoIds', <String>[videoId]);
    } else {
      if (videoIds.where((id) => id == videoId).toList().length == 0) {
        _prefs.setStringList('favoriteVideoIds', [...videoIds, videoId]);
      }
    }

    await _readLocale();
  }

  removeFavoriteLocale(String videoId) async {
    final List<String>? videoIds = await _prefs.getStringList('favoriteVideoIds');

    if (videoIds != null) {
      videoIds.remove(videoId);
      await _prefs.setStringList('favoriteVideoIds', videoIds);
    }

    await _readLocale();
  }
}
