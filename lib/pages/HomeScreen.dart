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

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleG = GoogleFonts.poppins(
      textStyle: Theme.of(context).textTheme.bodyMedium,
    );
    return Scaffold(
      drawer: Drawer(),
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
            padding: const EdgeInsets.all(10),
            child: RecommendWidget(textStyleG: textStyleG),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('lib/assets/Audi.png',),fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: ProjectColors.ObsidianShard),                       
                    ),
                    Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Audi e-tron Premium'),
                          Text('Rs. 54,77,823,73')
                        ],
                      ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/Audi.png',),fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: ProjectColors.ObsidianShard),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/Audi.png',),fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: ProjectColors.ObsidianShard),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/Audi.png',),fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: ProjectColors.ObsidianShard),
                ),
                
              ],
            ),
          )
        ],
      ),
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
