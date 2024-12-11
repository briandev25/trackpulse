import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trackpulse/utils/constants/color.dart';

class Page {
  final String img;
  final String title;
  final String desc;
  Page({required this.img, required this.title, required this.desc});
}

class Onboarding extends StatelessWidget {
  final PageController _controller = PageController();
  final List<Page> pageContent = [
    Page(
        img: "assets/onboard3.jpeg",
        title: "Welcome to Trackpulse app",
        desc:
            "Discover new music, curate your playlists, and let the rhythm fuel your day. Ready to hit play on your next adventure?"),
    Page(
        img: "assets/onboard2.jpeg",
        title: "Seamless Streaming",
        desc:
            "Uninterrupted listening, anytime, anywhere. Your favorite tracks, albums, and artists, all at your fingertips. Press play and relax."),
    Page(
        img: "assets/onboard1.jpeg",
        title: "Personalized Listening",
        desc:
            "Your music, your way. Create playlists, explore genres, and let the beats match your mood. Dive into a world of sound designed just for you!")
  ];

  Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView.builder(
          controller: _controller,
          itemBuilder: (context, index) {
            final content = pageContent[index];
            return OnboardPage(
                image: content.img,
                title: content.title,
                description: content.desc);
          },
          itemCount: pageContent.length,
        ),
        Container(
          alignment: Alignment(0, 0.65),
          child: SmoothPageIndicator(
              controller: _controller, count: pageContent.length),
        )
      ]),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(.5),
          child: Column(
            children: [
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.75),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colours.accentColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              )
            ],
          ),
        )
      ],
    );
  }
}
