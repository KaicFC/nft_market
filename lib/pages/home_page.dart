// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_market/pages/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TweenAnimationBuilder<double?>(
                tween: Tween(begin: 1, end: 0),
                duration: Duration(seconds: 2),
                child: Column(
                  children: [
                    AppBarCustom(),
                    TitleSchedule(title: 'Categories'),
                    categories(),
                    TitleSchedule(title: 'Featured NFTs'),
                    TweenAnimationBuilder<double?>(
                        tween: Tween(begin: 1, end: 0),
                        duration: Duration(seconds: 2),
                        child: Card(),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(200 * value!, 0),
                            child: child,
                          );
                        }),
                    TitleSchedule(title: 'Top Sellers'),
                    ListTopSellers(),
                  ],
                ),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: 1 - value!,
                    child: Transform.translate(
                      offset: Offset(0, 100 * value),
                      child: child,
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  categories() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 13, 183, 183),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Art',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          category('Music'),
          category('Games'),
          category('Domains'),
        ],
      ),
    );
  }

  category(String title) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            title,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class ListTopSellers extends StatelessWidget {
  const ListTopSellers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Expanded(
        child: ListView.builder(
          itemCount: 5,
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (context, index) => TopSellersCard(index: index + 1),
        ),
      ),
    );
  }
}

class TopSellersCard extends StatelessWidget {
  final int index;

  const TopSellersCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 60,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(199, 158, 158, 158),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Text(
                'Art NFTs',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Text(
                '#MakeVerse',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(),
        ),
      ),
      child: Column(
        children: [
          ImageContainer(heigth: 310, imageUrl: 'assets/images/robo.png'),
          DescriptionCard(
            title_one: 'By KaicDev',
            title_two: 'CurrentPric',
            font_size: 14,
            font_weight: FontWeight.w400,
            color: Colors.black87,
          ),
          DescriptionCard(
            title_one: 'MEKA #3139',
            title_two: '10 ETH',
            font_size: 16,
            font_weight: FontWeight.w800,
            color: Colors.black,
          ),
          InformationsCard(),
        ],
      ),
    );
  }
}

class InformationsCard extends StatelessWidget {
  const InformationsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            ),
            child: Center(
              child: Text(
                'Place Bid',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            height: 60,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 13, 183, 183),
            ),
            child: Center(
              child: Icon(
                Icons.favorite_border_outlined,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionCard extends StatelessWidget {
  final String title_one;
  final String title_two;
  final double font_size;
  final FontWeight font_weight;
  final Color color;

  const DescriptionCard({
    Key? key,
    required this.title_one,
    required this.title_two,
    required this.font_size,
    required this.font_weight,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title_one,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: font_size,
              fontWeight: font_weight,
              color: color,
            ),
          ),
          Text(
            title_two,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: font_size,
              fontWeight: font_weight,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final double heigth;
  const ImageContainer({
    Key? key,
    required this.imageUrl,
    required this.heigth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        height: heigth,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class TitleSchedule extends StatelessWidget {
  const TitleSchedule({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            'View All',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(
                    'assets/images/crypto.svg',
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '8.42 ETH',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.search_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
