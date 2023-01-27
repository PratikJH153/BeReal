import 'package:bereal/helper/info_slider.dart';
import 'package:bereal/widgets/app_bar.dart';
import 'package:bereal/widgets/slider_bottom.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  static const routeID = "/infopage";
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final InfoSlider _infoSlider = InfoSlider();
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar(
        _pageController.page == 3
            ? null
            : [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _pageController.jumpToPage(3);
                      _infoSlider.pageChange(3);
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  child: const Text("Skip"),
                ),
              ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: _infoSlider.currentPage + 1 != _infoSlider.pages
            ? OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text("Continue"),
              )
            : TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Get Started"),
              ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 18,
        ),
        margin: const EdgeInsets.only(
          bottom: 120,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _infoSlider.pageChange(index);
                  });
                },
                children: _infoSlider
                    .getInfoPages()
                    .map(
                      (infoData) => Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.asset(infoData.photoURL),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              infoData.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SliderBottom(
              pages: _infoSlider.pages,
              currentPage: _infoSlider.currentPage,
            ),
          ],
        ),
      ),
    );
  }
}
