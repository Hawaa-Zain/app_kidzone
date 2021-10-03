import 'package:flutter/material.dart';
import 'package:kidzone_app/providers/centers.dart';
import 'package:provider/provider.dart';

class CentersDetailScreen extends StatelessWidget {
  //late final String title;
  // CentersDetailScreen(this.title);
  static String routName = '/centers-detail';

  @override
  Widget build(BuildContext context) {
    final centersTitle = ModalRoute.of(context)!.settings.arguments as String;
    Provider.of<Centers>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
