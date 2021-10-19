import 'package:flutter/material.dart';
import 'package:kidzone_app/Center/widget/Publish_Ads.dart';

class PostAdvScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نشر اعلان '),
        backgroundColor: Colors.purple[300],
      ),
      body: PublishAds(),
    );
  }
}
