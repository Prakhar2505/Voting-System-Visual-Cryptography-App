import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:voting_system_cryptography/screens/QrScanScreen.dart';

class VotingPage extends StatefulWidget {
  @override
  _VotingPageState createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  int currentPos = 0;
  List<CampaignerData> serviceData = [
    CampaignerData(name: 'Mickey Mouse', id: 'mickey mouse',desc:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula ornare lacus, porttitor pharetra sem luctus vitae. Vivamus ullamcorper elementum lorem, sed commodo quam tempus a. '),
    CampaignerData(name: 'Donald Duck', id: 'donald duck',desc:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula ornare lacus, porttitor pharetra sem luctus vitae. Vivamus ullamcorper elementum lorem, sed commodo quam tempus a. '),
    CampaignerData(name: 'Goofy', id: 'goofy',desc:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula ornare lacus, porttitor pharetra sem luctus vitae. Vivamus ullamcorper elementum lorem, sed commodo quam tempus a. '),
    CampaignerData(name: 'Minnie Mouse', id: 'minnie mouse',desc:'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula ornare lacus, porttitor pharetra sem luctus vitae. Vivamus ullamcorper elementum lorem, sed commodo quam tempus a. '),
  ];

  String qrCode = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                "Choose the right",
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Campaigner",
                style: TextStyle(fontSize: 45.0),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.7,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  },
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                ),
                items: serviceData.map((e) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 1,
                        child: VotingCard(
                          cardName: e.name,
                          cardImg: e.id,
                          cardDesc: e.desc,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: size.width * 0.8, height: size.width * 0.12),
                child: ElevatedButton(
                    onPressed: () {
                      print("Vote");

                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => QRViewExample(campaignerName : serviceData[currentPos].name, privateKey: "DevashishDeva1234shishDevashish1234@gmail.comDeva@1234")),
                      );
                    },
                    child: Text(
                      "Vote",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VotingCard extends StatelessWidget {
  final String cardName;
  final String cardImg;
  final String cardDesc;
  VotingCard({
    required this.cardName,
    required this.cardImg,
    required this.cardDesc,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      color: Colors.transparent,
      child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  height: size.height * 0.45,
                  width: size.width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.redAccent),
                  child: Column(
                    children: [
                      SizedBox(height: size.height*0.14,),
                      Text(cardName,style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                      Text(cardDesc,textAlign: TextAlign.justify,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  height: size.width * 0.7,
                  width: size.width * 0.7,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                      image: AssetImage("assets/$cardImg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class CampaignerData {
  final String name;
  final String id;
  final String desc;
  CampaignerData({
    required this.name,
    required this.id,
    required this.desc,
  });
}
