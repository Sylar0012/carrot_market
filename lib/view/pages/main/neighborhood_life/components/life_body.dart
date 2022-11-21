import 'package:cached_network_image/cached_network_image.dart';
import 'package:carrot_market/models/neighborhood_life.dart';
import 'package:carrot_market/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LifeBody extends StatelessWidget {
  final NeighborhoodLife neighborhoodLife;
  const LifeBody({required this.neighborhoodLife, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Color(0xFFD4D5DD)),
        ),
      ),
      child: Column(
        children: [
          _buildTop(),
          _buildWritier(),
          _buildWriting(),
          _buildImage(),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          _buildtail(),
        ],
      ),
    );
  }

  Widget _buildWriting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        neighborhoodLife.content,
        style: textTheme().bodyText1,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(4),
              color: Color.fromRGBO(247, 247, 247, 1),
            ),
            child: Text(neighborhoodLife.category, style: textTheme().bodyText2),
          ),
          Text(neighborhoodLife.date, style: textTheme().bodyText2),
        ],
      ),
    );
  }

  Widget _buildWritier() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: neighborhoodLife.profileImgUri,
              width: 30.0,
              height: 30.0,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${neighborhoodLife.userName}",
                  style: textTheme().bodyText1,
                ),
                TextSpan(
                  text: "${neighborhoodLife.location}",
                  style: textTheme().bodyText2,
                ),
                TextSpan(
                  text: "인증 ${neighborhoodLife.authCount}회",
                  style: textTheme().bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Visibility(
      visible: neighborhoodLife.contentImgUri != '',
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Image.network(
          neighborhoodLife.contentImgUri,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildtail() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.faceSmile,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(width: 8),
          Text(
            "공감 하기",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(width: 8),
          Icon(
            FontAwesomeIcons.comment,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(width: 8),
          Text(
            "댓글 쓰기 ${neighborhoodLife.commentCount}",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
