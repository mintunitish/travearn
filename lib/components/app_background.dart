/*
 * This file and all its content are part of travearn and can be used only by 
 * including the LICENSE shipped with this code and by adhering to it fully.
 *
 * Created on 14-10-2019.
 * 
 * Copyright (c) 2019 Nitish Kumar. All rights reserved.
 *
 */

import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;

        return Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            Positioned(
              left: -(height/2 - width/2),
              bottom: height * 0.25,
              child: Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.greenAccent.withOpacity(0.3)
                ),
              ),
            ),
            Positioned(
              left: width * 0.15,
              top: -width * 0.5,
              child: Container(
                height: width * 1.6,
                width: width * 1.6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.greenAccent.withOpacity(0.4)
                ),
              ),
            ),
            Positioned(
              right: -width * 0.2,
              top: -50,
              child: Container(
                height: width * 0.6,
                width: width * 0.6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.greenAccent.withOpacity(0.6)
                ),
              ),
            )
          ],
        );
      },
    );
  }

}