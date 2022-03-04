import 'package:flutter/material.dart';

import '../../models/video_model.dart';

class VideoItem extends StatelessWidget {
  VideoModel video;

  VideoItem({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(video.thumbnailUrl),
      title: Text(
        video.title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        video.description,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      onTap: () {},
      // star_border
    );
  }
}
