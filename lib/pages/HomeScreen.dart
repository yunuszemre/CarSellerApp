import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_car_selling_app/components/text_input.dart';
import 'package:flutter_car_selling_app/core/project_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyleG = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
    return Scaffold(
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.home),onPressed: () {
          setState(() {
            
          });
        }, color: ProjectColors.MaximumOrange),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite, color: ProjectColors.TulleGrey,),label: 'Favorite'),
        BottomNavigationBarItem(icon: Icon(Icons.person, color: ProjectColors.TulleGrey,),label: 'Personal')
      ],
      selectedItemColor: ProjectColors.MaximumOrange,
      currentIndex: _currentIndex,      
      ),
      appBar: AppBar(        
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset('lib/assets/bellicon.png'),
                ]),
              ),
            ),
          )
        ],
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFFF9FAFB), // <-- SEE HERE
            statusBarIconBrightness:
                Brightness.dark, //<-- For Android SEE HERE (dark icons)
            statusBarBrightness: Brightness.light,
            systemNavigationBarIconBrightness:
                Brightness.dark //<-- For iOS SEE HERE (dark icons)
            ),
        leading: Builder(
            builder: (context) => InkWell(
                  child: Icon(
                    Icons.menu,
                    color: ProjectColors.ObsidianShard,
                  ), //Expanded(child: Image.asset('lib/asset/bx_bx-menu.png')),
                  onTap: () => Scaffold.of(context).openDrawer(),
                )),
        title: Image.asset('lib/assets/CarStore.png'),
        centerTitle: true,
        backgroundColor: ProjectColors.DrWhite,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchandFilterWigets(textStyleG: textStyleG),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 400,
              height: 200,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                FeaturedCard(
                  textStyleG: textStyleG,
                  imagePath: 'lib/assets/Tesla.png',
                  brandText: 'Tesla model 3 standart range plus',
                ),
                FeaturedCard(
                  textStyleG: textStyleG,
                  imagePath: 'lib/assets/Audi.png',
                  brandText: 'Audi Q2 40 TFSI',
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: RecommendWidget(textStyleG: textStyleG),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(children: [
                    RecommendedList(textStyleG: textStyleG),
                    SizedBox(
                      height: 25,
                    ),
                    RecommendedList(textStyleG: textStyleG)
                  ]),
                )

                // Stack(children: [Text('data')]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _onItemTapped(int i) {}
}

class RecommendedList extends StatelessWidget {
  const RecommendedList({
    super.key,
    required this.textStyleG,
  });

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecommendedCardWidget(textStyleG: textStyleG),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: RecommendedTexts(textStyleG: textStyleG),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecommendedCardWidget(textStyleG: textStyleG),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: RecommendedTexts(textStyleG: textStyleG),
            )
          ],
        )
      ],
    );
  }
}

class RecommendedCardWidget extends StatelessWidget {
  const RecommendedCardWidget({
    super.key,
    required this.textStyleG,
  });

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      width: 190,
      height: 198,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage(
              'lib/assets/e_treon_premium.png',
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          AroundViewWidget(textStyleG: textStyleG),
          FavoriteIcon(),
          PlayButton()
        ],
      ),
    );
  }
}

class AroundViewWidget extends StatelessWidget {
  const AroundViewWidget({
    super.key,
    required this.textStyleG,
  });

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '360 View',
            style: textStyleG.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ProjectColors.MaximumOrange),
          ),
          SizedBox(
            width: 5,
          ),
          Image.asset(
            'lib/assets/3d-view.png',
            width: 15,
          )
        ],
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        alignment: Alignment.center,
        width: 28,
        height: 28,
        decoration: BoxDecoration(
            color: ProjectColors.DrWhite,
            borderRadius: BorderRadius.circular(14)),
        child: Icon(
          Icons.favorite,
          color: ProjectColors.MaximumOrange,
          size: 20,
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: ProjectColors.DrWhite.withOpacity(0.75),
                borderRadius: BorderRadius.circular(15)),
            child: Icon(
              Icons.play_circle,
              size: 20,
              color: ProjectColors.MaximumOrange,
            )),
      ),
    );
  }
}

class RecommendedTexts extends StatelessWidget {
  const RecommendedTexts({
    super.key,
    required this.textStyleG,
  });

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Audi e-tron Premium',
          style: textStyleG.copyWith(
              fontWeight: FontWeight.w600,
              color: ProjectColors.ObsidianShard,
              fontSize: 14),
        ),
        Text(
          'Rs. 54,77,823.73',
          style: textStyleG.copyWith(
              fontWeight: FontWeight.w600,
              color: ProjectColors.TulleGrey,
              fontSize: 12),
        )
      ],
    );
  }
}

class RecommendWidget extends StatelessWidget {
  const RecommendWidget({
    super.key,
    required this.textStyleG,
  });

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommended',
          style: textStyleG.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        InkWell(
            onTap: () => print('object'),
            child: Text(
              'See all',
              style: textStyleG.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: ProjectColors.BerryChalk),
            ))
      ],
    );
  }
}

class FeaturedCard extends StatelessWidget {
  final String imagePath;
  const FeaturedCard({
    super.key,
    required this.textStyleG,
    required this.imagePath,
    required this.brandText,
  });

  final TextStyle textStyleG;
  final String brandText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326,
      height: 170,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath)),
        color: Colors.transparent,
      ),
      child: Stack(children: [
        Image.asset('lib/assets/corer_ribbon.png'),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                brandText,
                style: textStyleG.copyWith(
                    fontSize: 15, color: ProjectColors.WhiteWhale),
              )),
        )
      ]),
    );
  }
}

class SearchandFilterWigets extends StatelessWidget {
  const SearchandFilterWigets({
    super.key,
    required this.textStyleG,
  });

  final TextStyle textStyleG;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 326,
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ProjectColors.WhiteWhale),
          child: TextField(
            cursorColor: ProjectColors.MaximumOrange,
            // textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintText: 'Search for Honda Pilot 7-Passenger',
                hintStyle: textStyleG.copyWith(
                    fontSize: 14, color: ProjectColors.TulleGrey),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: ProjectColors.TulleGrey,
                )),
          ),
        ),
        InkWell(onTap: () {}, child: Image.asset('lib/assets/Group6.png'))
      ],
    );
  }
}
