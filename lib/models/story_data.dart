import 'package:meta/meta.dart';

@immutable // means can not be changed later on
class StoryData {
  const StoryData({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;
}
