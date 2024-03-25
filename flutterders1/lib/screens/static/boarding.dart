import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterders1/core/storage.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

class boardingScreen extends StatefulWidget {
  const boardingScreen({super.key});

  @override
  State<boardingScreen> createState() => _boardingScreenState();
}

class _boardingScreenState extends State<boardingScreen> {
  int boardingPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PreloadPageView(
          preloadPagesCount: 3,
          onPageChanged: (value) {
            setState(() {
              boardingPage = value;
            });
          },
          children: const [
            boardingItem(
              image: "images/lirian-logo-transparent-small.png",
              title: "LIRIAN SCRIPTLERIYLE MARKANI YAYINLA",
              description: "Markana veya sana özel scriptler anında senin",
            ),
            boardingItem(
              image: "images/qr_1.png",
              title: "LIRIANDEV QR MENÜ",
              description: "Liriandev ile işletmenin dijital menüsünü oluştur.",
            ),
            boardingItem(
              image: "images/site-gorsel.png",
              title: "LIRIAN WEB SCRIPTLERIYLE MARKANI YAYINLA",
              description: "Markana veya sana özel scriptler anında senin",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(boardingPage == 0
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(boardingPage == 1
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                  Icon(boardingPage == 2
                      ? CupertinoIcons.circle_filled
                      : CupertinoIcons.circle),
                ],
              ),
              InkWell(
                onTap: () async {
                  final storage = Storage();
                  await storage.firstLaunchFunc();

                  GoRouter.of(context).replace('/home');
                },
                child: Text(boardingPage == 2 ? "Finish" : "Skip"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class boardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const boardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              fit: BoxFit.contain,
              width: double.infinity,
              height: 300,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 1, 32, 86)),
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
