import 'package:flutter/material.dart';
class FriendTab extends StatelessWidget {
  final String handle;
  final int rank;
  const FriendTab({
    required this.handle,
    required this.rank
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.local_activity, size: 50),
      title: Text(handle),
      subtitle: Text('$rank'),
    );
  }
}