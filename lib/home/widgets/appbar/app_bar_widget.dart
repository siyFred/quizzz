import 'package:flutter/material.dart';

import 'package:quizzz/core/core.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({super.key}) : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      decoration: BoxDecoration(gradient: AppGradients.linear),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              "Qui.zzZ",
              style: AppTextStyles.title
            ),
          ],
        ),
      )
    ),
  );
}
