import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/video_model.dart';
import '../../theme/app_theme.dart';

class VideoItem extends StatefulWidget {
  VideoModel video;
  bool isFavorite;
  VoidCallback onTap;

  VideoItem({
    Key? key,
    required this.video,
    required this.isFavorite,
    required this.onTap,
  }) : super(key: key);

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(widget.video.thumbnailUrl),
          SizedBox(
            width: AppTheme.sizes.spacing4px,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.video.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.video.description,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: widget.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
            onPressed: () => widget.onTap(),
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
