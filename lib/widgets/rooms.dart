import 'package:flutter/material.dart';
import '/config/palette.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({
    Key key,
    @required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 4.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _RoomButton(),
            );
          }

          final User user = onlineUsers[index - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _RoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.blueAccent[100], width: 3.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textStyle: TextStyle(color: Palette.facebookBlue),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                Palette.createRoomGradient.createShader(bounds),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          Text('Créer \nSalon'),
        ],
      ),
    );
    // 27.50
  }
}
