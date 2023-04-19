import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/pages/video_controls.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(toolbarHeight: 0),
//         body: VideoControls(
//             url: "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4")
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.blue));
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(38, 126, 189, 1),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '120 CÂU MÔ PHỎNG',
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            'GPLX',
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Material(
                        child: InkResponse(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/icon_drawer.svg",
                          ),
                        ),
                      )
                    ],
                  )),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(247, 147, 26, 1),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_test.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'THI THỬ',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(251, 90, 140, 1),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_error.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'CÂU SAI',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(159, 157, 243, 1),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_warning.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'CÂU HAY SAI',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(64, 141, 197, 1),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_save.svg'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'CÂU ĐÃ LƯU',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  height: 75,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 90, 124, 1)
                          .withOpacity(0.7),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10)),
                              color: Colors.blue),
                          child: const Text('AD'),
                        ),
                      ),
                      Positioned.fill(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ÔN LÝ THUYẾT GPLX 600 CÂU',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                          Text('(2023)',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16))
                        ],
                      ))
                    ],
                  )),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Luyện tập',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 24),
                  )),
              Column(
                children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration:  const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 25.0,
                              offset: Offset(0, -10))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16,color: Colors.white)),
                          Text('(01-29)',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16,color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration:  const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 25.0,
                              offset: Offset(0, -10))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16,color: Colors.white)),
                          Text('(01-29)',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16,color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration:  const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 25.0,
                              offset: Offset(0, -10))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16,color: Colors.white)),
                          Text('(01-29)',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16,color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding:  const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin:  const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 25.0,
                              offset: Offset(0, -10))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16,color: Colors.black)),
                          Text('(01-29)',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 16,color: Colors.black))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
