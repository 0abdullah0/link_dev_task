import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_dev_task/app/domain/entities/article/article.dart';
import 'package:link_dev_task/app/pages/details/widgets/detail_card.dart';
import 'package:link_dev_task/app/widgets/app_top_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({required this.article, super.key});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: const AppTopBar(title: 'LINK DEVELOPMENT'),
      body: Padding(
        padding: const EdgeInsets.all(8).r,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: DetailCard(
                  article: article,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _launchUrl,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        label: Text(
          'OPEN WEBSITE',
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(article.url ?? ''))) {
      throw Exception('Could not launch');
    }
  }
}
