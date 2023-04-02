import 'package:cakku_app/domain/result_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cakku_app.dart';
import 'domain/invitation_builder.dart';


void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => InvitationBuilder()),
          ChangeNotifierProvider(create: (context) => ResultBuilder()),
        ],
        child: const CakkuApp(),
      )
  );
}
