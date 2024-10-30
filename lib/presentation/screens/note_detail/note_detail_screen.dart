import 'package:auto_route/annotations.dart';
import 'package:coconut_note/common/widgets/nt_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_back_button.dart';
import 'package:coconut_note/common/widgets/zp_textfield.dart';
import 'package:coconut_note/presentation/screens/my_note/widgets/folders_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coconut_note/common/widgets/background_widget.dart';
import 'package:coconut_note/common/widgets/zp_app_bar.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/generated/locale_keys.g.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';

@RoutePage()
class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {

    @override
    Widget build(BuildContext context) {
      return BackgroundWidget(
        color: AppColors.white4,
        appBar: ZPAppBar(
            isShowDivider: true,
            context: context,
            centerTitle: true,
            titleWidget: ZPIcon(Images.coconutLogo, width: 36.w, height: 36.h,),
            title: LocaleKeys.friend_detail_detail_information,
            textStyle: TextStyles.w600Size17Black1,
            leadingWidget: Expanded(
              child: Row(
                children: [
                  ZPBackButton(
                    onBack: () => appRouter.pop(),
                  ),
                  ZPText(keyText: "My notes", style: TextStyles.w500Size16Black3,)
                ],
              ),
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
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: ZPText(
                      keyText: "Welcome! Here's how to get the most out of Coconote", style: TextStyles.w700Size25Black3),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => FoldersBottomSheet(onChanged: (value) {
                        debugPrint("value $value");
                      }).showBottomSheet(context),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white1,
                            border: Border.all(color: AppColors.grey1.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                        child: ZPText(
                          keyText: "Add to folder",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.grey1
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: ZPText(keyText: "24 Oct 2024", style: TextStyles.w600Size12GreySubtitle,),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
                  child: ZPText(
                      keyText: "Youtube play video", style: TextStyles.w700Size18Black3),
                ),
                rowFeature(title1: "Quiz", icon1: Icons.emoji_emotions_outlined, title2: "Flashcards", icon2: Icons.emoji_emotions_outlined),
                rowFeature(title1: "Edit note", icon1: Icons.edit, title2: "Translate", icon2: Icons.translate),
                rowFeature(title1: "Share note", icon1: Icons.ios_share, title2: "More options", icon2: Icons.add),
                Padding(
                  padding: EdgeInsets.only(top: 16.h, bottom: 12.h),
                  child: Row(
                    children: [
                      ZPText(
                          keyText: "Introduction to Coconote", style: TextStyles.w700Size25Black3),
                      SizedBox(width: 4.w,),
                      ZPIcon(Images.coconutLogo, width: 40.w, height: 40.h,),
                    ],
                  ),
                ),
                overviewText(),
                SizedBox(height: 12.w,),
                actuallyWorkText(),
                SizedBox(height: 12.w,),
                createNoteText(),
                SizedBox(height: 12.w,),
                reviewNoteText(),
                SizedBox(height: 12.w,),
                additionalFeaturesText(),
                SizedBox(height: 12.w,),
                coconoteUnlimitedPassText(),
                SizedBox(height: 12.w,),
                supportHelpText(),
                SizedBox(height: 12.w,),
                ZPText(keyText: "Coconote loves you 🫶", style: TextStyles.w500Size15Black3),
                SizedBox(height: 12.w,),
                NTListTile(
                  isBorderShow: false,
                  color: AppColors.white1,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  leading: Container(
                    width: 44.w,
                    height: 44.h,
                    padding: EdgeInsets.all(8.0.w),
                    margin: EdgeInsets.only(left: 16.0.h),
                    decoration:  BoxDecoration(
                        border: Border.all(width: 1, color:  AppColors.grey1),
                        color: AppColors.white1, shape: BoxShape.circle),
                    child: ZPIcon(Ics.icFiery,
                      width: 36.w,
                      height: 36.h,
                    ),
                  ),
                  text: "View full transcript",
                  onPressed: () {
                    appRouter.push(const FriendDetailRoute());
                  },
                  paddingTrailing : EdgeInsets.only(right: 8.0.h),
                ),
                SizedBox(height: 12.w,),
                NTListTile(
                  isBorderShow: false,
                  color: AppColors.white1,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  leading: Container(
                    width: 44.w,
                    height: 44.h,
                    padding: EdgeInsets.all(8.0.w),
                    margin: EdgeInsets.only(left: 16.0.h),
                    decoration:  BoxDecoration(
                        border: Border.all(width: 1, color:  AppColors.grey1),
                        color: AppColors.white1, shape: BoxShape.circle),
                    child: ZPIcon(Ics.icEdit,
                      width: 36.w,
                      height: 36.h,
                    ),
                  ),
                  text: "Edit note and transcript",
                  onPressed: () {
                    appRouter.push(const FriendDetailRoute());
                  },
                  paddingTrailing : EdgeInsets.only(right: 8.0.h),
                ),
                SizedBox(height: 100.h,),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: AppColors.white1,
                padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 26.h),
                child: ZPTextField(
                  // controller: emailController,
                  borderColor: AppColors.white4,
                  fillColor: AppColors.white4,
                  borderRadius: 24,
                  hintText: "Chat with this note",
                  hintStyle: TextStyles.w600Size15Grey1,
                  textStyle: TextStyles.w500Size15Black3,
                  onChanged: (text) {

                  },
                ),
              ),
            )
          ],
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
            onPressed: (){
              appRouter.push(const FlashCardNoteRoute());
            },
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
