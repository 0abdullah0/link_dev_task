import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';
import 'package:link_dev_task/app/widgets/app_network_image.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({required this.article, super.key});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.95.sw,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: 0.95.sw,
            height: 0.3.sh,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppNetworkImage(imageUrl: article.urlToImage ?? ''),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      DateFormat.yMMMEd().format(article.publishedAt),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
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
          8.verticalSpace,
          ListTile(
            subtitle: Padding(
              padding: const EdgeInsets.all(8).r,
              child: Text(
                article.description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
