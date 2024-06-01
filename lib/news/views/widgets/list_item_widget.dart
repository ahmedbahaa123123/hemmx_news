import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/cubit/news_cubit.dart';
import '../../data/news_model.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key, required this.model});

  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (model.urlOf != null) {
          await NewsCubit.launchUrls(model.urlOf!);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.yellow.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (model.image != null)
              Image.network(model.image!),
            if (model.title != null)
              Text(
                model.title!,
                textAlign: TextAlign.right,
              ),
            const SizedBox(
              height: 5,
            ),
            if (model.author != null)
              Text(model.author!),
            const SizedBox(
              height: 5,
            ),
            if (model.time != null)
              Text(
                model.time!.substring(0, 10),
              ),
          ],
        ),
      ),
    );
  }
}
