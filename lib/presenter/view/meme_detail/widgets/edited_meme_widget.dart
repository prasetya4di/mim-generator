import 'dart:io';

import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:flutter/material.dart';
import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/generated/assets.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/button_share.dart';

class EditedMemeWidget extends StatelessWidget {
  final EditedMeme editedMeme;

  const EditedMemeWidget({super.key, required this.editedMeme});

  @override
  Widget build(BuildContext context) {
    AppinioSocialShare appinioSocialShare = AppinioSocialShare();

    return Column(
      children: [
        Image.file(File(editedMeme.filePath)),
        ButtonShare(
            onTap: () async {
              appinioSocialShare.shareToFacebook("", editedMeme.filePath);
            },
            text: "Share to facebook",
            icon: Assets.imagesIcFacebook,
            buttonColor: Colors.blue),
        ButtonShare(
            onTap: () async {
              appinioSocialShare.shareToTwitter("",
                  filePath: editedMeme.filePath);
            },
            text: "Share to twitter",
            icon: Assets.imagesIcTwitter,
            buttonColor: Colors.lightBlueAccent),
      ],
    );
  }
}
