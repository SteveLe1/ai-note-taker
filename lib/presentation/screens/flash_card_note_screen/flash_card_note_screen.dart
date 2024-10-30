import 'package:auto_route/annotations.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/nt_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_app_bar.dart';
import 'package:coconut_note/common/widgets/zp_back_button.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/presentation/screens/note_detail/widgets/custom_card_widget.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FlashCardNoteScreen extends StatefulWidget {
  const FlashCardNoteScreen({super.key});

  @override
  State<FlashCardNoteScreen> createState() => _FlashCardNoteScreenState();
}

class _FlashCardNoteScreenState extends State<FlashCardNoteScreen> {

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      color: AppColors.white4,
      appBar: ZPAppBar(
          backgroundColor: AppColors.white4,
          isShowDivider: true,
          context: context,
          centerTitle: true,
          titleWidget: ZPText(keyText: "Quiz", style: TextStyles.w700Size18Black3,),
          title: LocaleKeys.friend_detail_detail_information,
          textStyle: TextStyles.w600Size17Black1,
          leadingWidget: Row(
            children: [
              ZPBackButton(
                onBack: () => appRouter.pop(),
              ),
              ZPIcon(Images.coconutLogo, width: 36.w, height: 36.h,)

            ],
          ),
          actionWidgets: [
            Padding(
              padding: EdgeInsets.only(right: 23.w),
              child: InkWell(
                onTap: () => appRouter.push(const SettingRoute()),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.purpleBorder.withOpacity(0.35)
                  ),
                  child: ZPText(keyText: "Share", style: TextStyles.w800Size16Purple,),
                ),
              ),

            ),
          ]),
      child:  Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     colors: [Color(0xFF4051A9), Color(0xFF9354B9)],
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     stops: const [0.1, 0.9])
        ),
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Swiper(
                    itemCount: 5,
                    itemWidth: MediaQuery.of(context).size.width,
                    itemHeight: MediaQuery.of(context).size.height,
                    pagination: SwiperPagination(
                      // margin: EdgeInsets.zero,
                        builder: DotSwiperPaginationBuilder(
                            color: AppColors.purpleBorder.withOpacity(0.3),
                            activeColor: AppColors.purpleBorder,
                            activeSize: 12,
                            space: 4)),
                    itemBuilder: (context, index) {
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomCard(
                            index: index +1,
                            name: "On which platform is Coconote avaiable?",
                          ),

                        ],
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}

Widget rowFeature({required String title1, required IconData icon1, required String title2, required IconData icon2}){
  return  Row(
    children: [
      Expanded(
        child: NTListTile(
          color: AppColors.white1,
          isBorderShow: true,
          text: title1,
          textStyle: TextStyles.w700Size16Purple,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          leading: Icon(icon1),
          trailing: const SizedBox(),
          onPressed: (){},
        ),
      ),
      SizedBox(width: 8.w,),
      Expanded(
        child: NTListTile(
          color: AppColors.white1,
          isBorderShow: true,
          text: title2,
          textStyle: TextStyles.w700Size16Purple,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          leading:  Icon(icon2),
          trailing: const SizedBox(),
          onPressed: (){},
        ),
      ),
    ],
  );
}

Widget overviewText(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ZPText(keyText: "Overview", style: TextStyles.w700Size18Purple),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZPText(keyText: "• Coconote is an AI note-taker that turns any audio or video into organized notes, flashcards, quizzes, and more.", style: TextStyles.w500Size14Black3,),
            ZPText(keyText: "• Available for iPhone, iPad, Android (web) and desktop (web).", style: TextStyles.w500Size14Black3,),
          ],
        ),
      ),

    ],
  );
}

Widget actuallyWorkText(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ZPText(keyText: "Does Coconote actually work?", style: TextStyles.w700Size18Purple),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZPText(keyText: "• Coconote is an AI note-taker that turns any audio or video into organized notes, flashcards, quizzes, and more.", style: TextStyles.w500Size14Black3,),
            ZPText(keyText: "• Available for iPhone, iPad, Android (web) and desktop (web).", style: TextStyles.w500Size14Black3,),
            RichText(
              overflow: TextOverflow.clip,
              text:  TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: '• Thousands of students ',
                      style: TextStyles.w700Size14Black3),
                  const TextSpan(text: 'have told us - in our ratings and in our Discord - that Coconote helped them ',
                      style: TextStyles.w500Size14Black3),
                  TextSpan(text: 'ace a final exam, learn course materials faster',
                      style: TextStyles.w500Size14Black3.copyWith(fontStyle: FontStyle.italic)),
                  const TextSpan(text: ', and generally improve their grades.',
                      style: TextStyles.w500Size14Black3),
                ],
              ),
            ),
            RichText(
              overflow: TextOverflow.clip,
              text:  const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '• Hundreds of parents ',
                      style: TextStyles.w700Size14Black3),
                  TextSpan(text: 'have gifted Coconote to their kids in school to help improve their grades.',
                      style: TextStyles.w500Size14Black3),
                ],
              ),
            ),
            RichText(
              overflow: TextOverflow.clip,
              text:  const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '• Now, even ',
                      style: TextStyles.w500Size14Black3),
                  TextSpan(text: 'young professionals ',
                      style: TextStyles.w700Size14Black3),
                  TextSpan(text: 'are using Coconote to record meetings and audio with instant AI-written summaries on-the-go.',
                      style: TextStyles.w500Size14Black3),
                ],
              ),
            ),
          ],
        ),
      ),

    ],
  );
}

Widget createNoteText(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ZPText(keyText: "Create a Note", style: TextStyles.w700Size18Purple),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZPText(keyText: "1. Use a Youtube Video Link", style: TextStyles.w700Size14Black3),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZPText(keyText: "• Paste the YouTube link.", style: TextStyles.w500Size14Black3,),
                  ZPText(keyText: "• Auto-detect language option available; highly recommended, especially for English.", style: TextStyles.w500Size14Black3,),
                  ZPText(keyText: "• You can also type 'summary.new/' before any YouTube URL in your browser to create an instant summary for that video. A nice hack for Coconote Unlimited Pass subscribers 🙂.", style: TextStyles.w500Size14Black3,),
                ],
              ),
            ),

            ZPText(keyText: "2. Upload Audio", style: TextStyles.w700Size14Black3),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZPText(keyText: "• Process: Tap upload -> Select file -> Auto-detect language.", style: TextStyles.w500Size14Black3,),
                  ZPText(keyText: "• Step-by-step guidance available for importing from the iPhone voice memo app.", style: TextStyles.w500Size14Black3,),
                ],
              ),
            ),

            ZPText(keyText: "3. Record Audio", style: TextStyles.w700Size14Black3),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZPText(keyText: "• Start recording by tapping the record button.", style: TextStyles.w500Size14Black3,),
                  ZPText(keyText: "• Specify the topic for better quality notes!", style: TextStyles.w500Size14Black3,),
                  ZPText(keyText: "• Recording tips: Leave the app open while recording to ensure the best audio quality. The safest audio recordings are under 90 minutes - above 90 minutes, you are more likely to experience an error (we're working to improve this, always!)",
                    style: TextStyles.w500Size14Black3,),
                ],
              ),
            ),
          ],
        ),
      ),

    ],
  );
}

Widget reviewNoteText(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ZPText(keyText: "Review notes", style: TextStyles.w700Size18Purple),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZPText(keyText: "• Notes include chapter headings, subheadings, and key takeaways.", style: TextStyles.w500Size14Black3,),
            ZPText(keyText: "• You can view and edit the transcripts at the bottom of your note.", style: TextStyles.w500Size14Black3,),
          ],
        ),
      ),

    ],
  );
}

Widget additionalFeaturesText(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ZPText(keyText: "Additional Features", style: TextStyles.w700Size18Purple),
      SizedBox(height: 12.w,),
      ZPText(keyText: "Quizzes and Flashcards", style: TextStyles.w500Size14Black3),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZPText(keyText: "• Quizzes: Automatically generated based on the notes.", style: TextStyles.w500Size14Black3,),
            ZPText(keyText: "• Flashcards: Created from the YouTube videos or other sources.", style: TextStyles.w500Size14Black3,),
          ],
        ),
      ),
      SizedBox(height: 12.w,),
      ZPText(keyText: "Translation", style: TextStyles.w500Size14Black3),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZPText(keyText: "• Supports translation to/from 100 languages.", style: TextStyles.w500Size14Black3,),
            ZPText(keyText: "• Real-time note translation available.", style: TextStyles.w500Size14Black3,),
          ],
        ),
      ),
      SizedBox(height: 12.w,),
      ZPText(keyText: "Sharing and Exporting Notes", style: TextStyles.w500Size14Black3),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              overflow: TextOverflow.clip,
              text:  const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '• Share Options: ', style: TextStyles.w700Size14Black3),
                  TextSpan(text: 'Available via URL link or text copying.',
                      style: TextStyles.w500Size14Black3),
                ],
              ),
            ),
            RichText(
              overflow: TextOverflow.clip,
              text:  const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '• Future Updates: ', style: TextStyles.w700Size14Black3),
                  TextSpan(text: 'Plan to enable exporting to platforms like Google Docs or Notion.',
                      style: TextStyles.w500Size14Black3),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget coconoteUnlimitedPassText(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ZPText(keyText: "AdditionalFeatures", style: TextStyles.w700Size18Purple),
      SizedBox(height: 12.w,),
      ZPText(keyText: "Quizzes and Flashcards", style: TextStyles.w500Size14Black3),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              overflow: TextOverflow.clip,
              text:  const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '• Unlimited Pass ', style: TextStyles.w700Size14Black3),
                  TextSpan(text: 'lets you create unlimited notes, flashcards, and quizzes with Coconote for one price',
                      style: TextStyles.w500Size14Black3),
                ],
              ),
            ),
            RichText(
              overflow: TextOverflow.clip,
              text:  const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '• Save 75% ', style: TextStyles.w700Size14Black3),
                  TextSpan(text: 'on your pass by subscribing to the annual pass. Monthly and Weekly options are available at a higher price per week.',
                      style: TextStyles.w500Size14Black3),
                ],
              ),
            ),
            ZPText(keyText: "• Yes, it works. 😄", style: TextStyles.w700Size14Black3,),
          ],
        ),
      ),
    ],
  );
}

Widget supportHelpText(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ZPText(keyText: "Support & Help", style: TextStyles.w700Size18Purple),
      SizedBox(height: 12.w,),
      Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ZPText(keyText: "• The creators of Coconote would love to hear from you. Tap the 'contact' button to send a message. We read every single message.", style: TextStyles.w500Size14Black3,),
          ],
        ),
      ),

    ],
  );
}

class Tag {
  String title = "";
  Color? colorText;
  Color? bgColor;
  bool? isAddIcon = false;
  String? iconRes = "";

  Tag(this.title, this.colorText, this.bgColor, this.isAddIcon, this.iconRes);
}
