import 'package:flutter/material.dart';
import 'package:superapp_mobile/constant.dart';
import 'package:superapp_mobile/presentation/components/cardWithImage.dart';
import 'package:superapp_mobile/presentation/components/inkEffect.dart';

class ScrolledContent extends StatelessWidget {
  const ScrolledContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   child: loginCardWithLogoutPopUp(context, 'SIMBELMAWA'),
          // ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Apa sih SIMBELMAWA itu?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
          ),
          SizedBox(height: 15),
          CardWithImage(
            positionLeftImage: 10,
            positionBottomImage: 8,
            positionLeftColumn: 150,
            positionTopColumn: 1,
            positionBottomColumn: -20,
            positionRightColumn: 0,
            colorCard: Color(0xFFF0F9FF),
            colorTextTitle: Color(0xFF248DDA),
            colorTextSubTitle: grey,
            textTitle: "Pendaftaran dan Manajemen PKM yang Mudah",
            textSubTitle:
                "Simbelmawa memberikan fasilitas untuk mendaftar dan mengelola PKM dengan mudah.",
            image: 'assets/sister/modul_bagi_dosen.png',
            imageHeight: 155,
            imageWidth: 141,
          ),
          SizedBox(height: 8),
          CardWithImage(
            colorCard: Color(0xffDFFFF0),
            colorTextTitle: Color(0xff00BE82),
            colorTextSubTitle: grey,
            textTitle: "Pemantauan Progres PKM",
            positionRightImage: 4,
            positionBottomImage: 0,
            textSubTitle:
                "Mahasiswa, dosen pembimbing, dan belmawa dapat melakukan pemantauan dan transparansi terhadap progres pengajuan pada PKM.",
            image: 'assets/sister/kemudahan_akses.png',
            imageHeight: 170,
            imageWidth: 140,
          ),
          SizedBox(height: 8),
          CardWithImage(
            positionLeftImage: 10,
            positionBottomImage: 8,
            positionLeftColumn: 150,
            positionTopColumn: 1,
            positionBottomColumn: 1,
            positionRightColumn: 0,
            colorCard: Color.fromRGBO(255, 250, 235, 1),
            colorTextTitle: Color.fromRGBO(233, 172, 29, 1),
            colorTextSubTitle: grey,
            textTitle: "Akses Langsung ke Informasi Terkini",
            textSubTitle:
                "Dapat dengan cepat mengakses informasi terkini seputar status pengajuan PKM, evaluasi, dan pembaruan terkait kegiatan mahasiswa. ",
            image: 'assets/sister/lacak_status_bkd.png',
            imageHeight: 155,
            imageWidth: 141,
          ),
          SizedBox(
            height: 15,
          ),
          _pengumumanTerbaru(context),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget serviceCard(
      String title, String subTitle, VoidCallback onTap, Widget centerImage) {
    return InkEffect(
      onTap: onTap,
      boxDecoration: BoxDecoration(
          color: white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: centerImage),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subTitle,
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.navigate_next,
              color: primary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pengumumanTerbaru(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pengumuman Terbaru",
            style: TextStyle(
              color: primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

}
