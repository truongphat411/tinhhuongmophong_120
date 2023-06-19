import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.blue));
    List<String> catNames = [
      "Thi thử",
      "Câu sai",
      "Câu điểm thấp",
      "Câu đã lưu",
      "600 câu hỏi ôn thi GPLX",
    ];

    List<Color> catColors = const [
      Color(0xFF78E667),
      Color(0xFFFC7F7F),
      Color(0xFFFFCF2F),
      Color(0xFF267EBD),
      Color(0xFFCB84FB),
      //Color(0xFF78E667),
    ];

    List catIcons = [
      const Icon(
        Icons.assignment,
        color: Colors.white,
        size: 30,
      ),
      const Icon(
        Icons.close,
        color: Colors.white,
        size: 30,
      ),
      const Icon(
        Icons.error_outlined,
        color: Colors.white,
        size: 30,
      ),
      const Icon(
        Icons.save_as_rounded,
        color: Colors.white,
        size: 30,
      ),
      // Image.asset(
      //   'assets/images/icon_app.png',
      // ),
      // Icon(
      //   Icons.emoji_events,
      //   color: Colors.white,
      //   size: 30,
      // ),
    ];

    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
            child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF267EBD)),
              child: Text(
                "PHAT DEV.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text("Item => 1"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Item => 2"),
              onTap: () {},
            ),
          ],
        )),
        backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF267EBD),
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
                    Builder(
                        builder: (context) => Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                  12.0,
                                )),
                                color: Color(0xFF408DC5),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(
                                    12.0,
                                  )),
                                  onTap: () {
                                    Scaffold.of(context).openEndDrawer();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                      10.0,
                                    ),
                                    child: const Icon(
                                      Icons.density_medium_sharp,
                                      size: 24.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 0.9),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: catNames.length,
                      itemBuilder: (context, index) {
                        return catNames[index] != '600 câu hỏi ôn thi GPLX' ? Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: catColors[index],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: catIcons[index],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              catNames[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ) : Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/icon_600.png'),fit: BoxFit.cover),
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              catNames[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ôn tập',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 24),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 5.0,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black)),
                                Text('(01-29)',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 5.0,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black)),
                                Text('(01-29)',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 5.0,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black)),
                                Text('(01-29)',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 5.0,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black)),
                                Text('(01-29)',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 5.0,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('CHƯƠNG 1: GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black)),
                                Text('(01-29)',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black))
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
