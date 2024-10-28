import 'package:flutter/material.dart';

class AppColors {
  static const black1 = Color(0xFF0D0D0E);
  static const black2 = Color(0xFF1C1C20);
  static const black3 = Color(0xFF23232A);
  static const black4 = Color(0xFF31313B);
  static const black5 = Color(0xFF42424D);
  static const black6 = Color(0xFF50505D);
  static const black7 = Color(0xFF676A7B);
  static const black8 = Color(0xFF737885);

  static const grey1 = Color(0xFFA4A7B0);
  static const grey2 = Color(0xFFB3B6BE);
  static const grey3 = Color(0xFFC5C8D0);
  static const grey4 = Color(0xFFCED0D4);
  static const grey5 = Color(0xFFDFE0E2);
  static const grey6 = Color(0xFFEBECEE);
  static const grey7 = Color(0xFF31313B);
  static const grey8 = Color(0xFF50505D);
  static const greySearch = Color(0xFF828189);
  static const greyTextField = Color(0xFFe3e2ea);
  static const greySubtitle = Color(0xFF929292);

  static const white1 = Color(0xFFFFFFFF);
  static const white2 = Color(0xFFFCFCFD);
  static const white3 = Color(0xFFF8F9FB);
  static const white4 = Color(0xFFF1F3F6);

  static const mint1 = Color(0xFF68D0CA);
  static const mint2 = Color(0xFF4ECBC3);
  static const mint3 = Color(0xFF68D0CA);

  static const zippy1 = Color(0xFF68D0CA);
  static const zippy2 = Color(0xFF54CB91);
  static const zippy3 = Color(0xFF71D461);
  static const zippy4 = Color(0xFF58DAE3);
  static const zippy5 = Color(0xFF72CEF5);
  static const zippy6 = Color(0xFF108CFF);
  static const zippy7 = Color(0xFF729FF5);
  static const zippy8 = Color(0xFF807DFF);
  static const zippy9 = Color(0xFFD074FC);
  static const zippy10 = Color(0xFF8C47FD);

  static const brightZippy1 = Color(0xFFF4FCFB);
  static const brightZippy2 = Color(0xFFF2FDF8);
  static const brightZippy3 = Color(0xFFF5FDF0);
  static const brightZippy4 = Color(0xFFECFCFD);
  static const brightZippy5 = Color(0xFFEFFAFF);
  static const brightZippy6 = Color(0xFFEDF6FF);
  static const brightZippy7 = Color(0xFFECF3FF);
  static const brightZippy8 = Color(0xFFF7F6FF);
  static const brightZippy9 = Color(0xFFFCF5FF);
  static const brightZippy10 = Color(0xFFF9F5FE);

  static const lightPurple = Color(0xFFf2f1f9);
  static const purpleBorder = Color(0xFFb077fa);

  static const blueButton = Color(0xFF302dff);

  static const orangeButton = Color(0xFFfe6a60);

  static const red1 = Color(0xFFFF576B);
  static const lightRed2 = Color(0xFFFFF4F4);

  static const backgroundLoading = Color(0xFF808080);



  static const btnColorBlack = black3;
  static const btnColorMint = mint2;
  static const btnColorGrey = white4;
  static const btnColorDimedLight = black7;
  static const btnColorDimedDark = white4;
  static const btnColorRed = red1;

  static final backgroundDialog = const Color(0xFF060616).withOpacity(0.9);

  static const gradientGoldBorderGachaResult = LinearGradient(colors: [
    Color(0xFFCD9443),
    Color(0xFFFDC760),
    Color(0xFFFDD079),
    Color(0xFFFDD78C),
    Color(0xFFFDD993),
    Color(0xFFFEEDAF),
    Color(0xFFFFFEE5)
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  static LinearGradient gradientLoading = LinearGradient(colors: [
    AppColors.black1,
    AppColors.black1.withOpacity(0.5),
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  // static const blueGradient = LinearGradient(
  //     colors: [primary, qrColor],
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight);
  static LinearGradient gradientWhiteBorderLeftToRight = LinearGradient(
      colors: [Colors.white.withOpacity(0), Colors.white.withOpacity(0.2)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  const AppColors._();
}