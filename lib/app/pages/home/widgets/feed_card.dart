import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';
import 'package:link_dev_task/app/utils/navigator/routes.dart';
import 'package:link_dev_task/app/widgets/app_network_image.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.detailsRoute,
        arguments: {
          'article': article,
        },
      ),
      child: Container(
        width: 0.95.sw,
        height: 0.35.sh,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: AppNetworkImage(imageUrl: article.urlToImage ?? ''),
            ),
            Padding(
              padding: const EdgeInsets.all(8).r,
              child: ListTile(
                title: Text(
                  article.title,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ),
                subtitle: Text(
                  'by ${article.author ?? 'Unknown'}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  DateFormat.yMMMEd().format(article.publishedAt),
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
