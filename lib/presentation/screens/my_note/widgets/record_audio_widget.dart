import 'dart:developer';

import 'package:coconut_note/common/widgets/zp_button.dart';
import 'package:coconut_note/common/widgets/zp_icon.dart';
import 'package:coconut_note/common/widgets/zp_list_tile.dart';
import 'package:coconut_note/common/widgets/zp_text.dart';
import 'package:coconut_note/config/routes/app_router.dart';
import 'package:coconut_note/presentation/screens/my_note/widgets/folders_bottom_sheet.dart';
import 'package:coconut_note/utils/resources/resources.dart';
import 'package:coconut_note/utils/style/app_colors.dart';
import 'package:coconut_note/utils/style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class RecordAudioWidget extends StatefulWidget {
  const RecordAudioWidget({Key? key}) : super(key: key);

  @override
  State<RecordAudioWidget> createState() => _RecordAudioWidgetState();
}

class _RecordAudioWidgetState extends State<RecordAudioWidget> {
  final AudioRecorder _recorder = AudioRecorder();
  bool _isRecording = false;
  bool _isStopRecording = false;
  String? _filePath;

  @override
  void dispose() {
    // _audioPlayer.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    final bool isPermissionGranted = await _recorder.hasPermission();
    if (!isPermissionGranted) {
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    // Generate a unique file name using the current timestamp
    String fileName = 'recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _filePath = '${directory.path}/$fileName';

    // Define the configuration for the recording
    const config = RecordConfig(
      // Specify the format, encoder, sample rate, etc., as needed
      encoder: AudioEncoder.aacLc, // For example, using AAC codec
      sampleRate: 44100, // Sample rate
      bitRate: 128000, // Bit rate
    );

    // Start recording to file with the specified configuration
    await _recorder.start(config, path: _filePath!);
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _saveRecording() async {
    final path = await _recorder.stop();
    setState(() {
      _isRecording = false;
      _isStopRecording = false;
    });
  }

  Future<void> _resumeRecording() async {
    final path = await _recorder.stop();
    setState(() {
      _isRecording = true;
      _isStopRecording = false;
    });
  }

  Future<void> _stopRecording() async {
    setState(() {
      _isStopRecording = true;
    });
  }

  Future<void> _pauseRecording() async {
    final path = await _recorder.stop();
    setState(() {
      _isRecording = false;
    });
  }

  // Future<void> _playRecording() async {
  //   if (_filePath != null) {
  //     await _audioPlayer.setFilePath(_filePath!);
  //     _totalDuration = _audioPlayer.duration?.inSeconds.toDouble() ?? 0;
  //     _audioPlayer.play();
  //
  //     _audioPlayer.positionStream.listen((position) {
  //       setState(() {
  //         _currentPosition = position.inSeconds.toDouble();
  //       });
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.only(top: 10.h, right: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => appRouter.pop(context),
                        child: ZPIcon(
                          Ics.icClose,
                          color: AppColors.black1,
                          width: 40.w,
                          height: 40.h,
                        ))
                  ],
                )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 25.h),
                  child: ZPText(
                      keyText: "Record", style: TextStyles.w700Size22Black3),
                ),
                Expanded(
                  child:ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: ZPText(
                            keyText: "Audio language", style: TextStyles.w700Size18Black3),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white1,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: ZPListTile(
                          text: "English",
                          textStyle: TextStyles.w700Size18Black3,
                          leading: const SizedBox(),
                          trailing: const Icon(CupertinoIcons.chevron_up_chevron_down, size: 28,),
                          onPressed: (){},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
                        child: ZPText(
                            keyText: "Folder", style: TextStyles.w700Size18Black3),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white1,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: ZPListTile(
                          text: "All notes",
                          textStyle: TextStyles.w700Size18Black3,
                          iconLeading: Ics.icEdit,
                          iconLeadingColor: AppColors.red1,
                          trailing: const Icon(CupertinoIcons.chevron_up_chevron_down, size: 28,),
                          onPressed: () => FoldersBottomSheet(onChanged: (value) {}).showBottomSheet(context),
                        ),
                      )
                    ],
                  ),),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.0.h),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if(_isRecording && _isStopRecording) GestureDetector(
                    onTap: _pauseRecording,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.black3),
                      ),
                      child: ZPText(keyText: "Paused", style:TextStyles.w600Size15Black3,),
                    ),
                  ),
                  if(_isRecording && !_isStopRecording) Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    margin: EdgeInsets.only(bottom: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.red1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.multitrack_audio, color: AppColors.red1,),
                        SizedBox(width: 4.w,),
                        ZPText(keyText: "Recording ...", style:TextStyles.w600Size18Red1,),
                      ],
                    ),
                  ),
                 if(_isRecording && !_isStopRecording) ZPButton(
                   width: MediaQuery.of(context).size.width * 0.3,
                    text: "Stop",
                    textStyle: TextStyles.w600Size18White1,
                    color: AppColors.black1,
                    radius: 100,
                    onPressed: _stopRecording,
                  ),
                  if(!_isRecording) ZPButton(
                    width: MediaQuery.of(context).size.width * 0.55,
                    text: "Start Recording",
                    textStyle: TextStyles.w600Size18White1,
                    color: AppColors.black1,
                    radius: 100,
                    onPressed: (){

                      setState(() {
                        _isRecording = !_isRecording;
                      });
                      // _startRecording();
                    },
                  ),
                 if(_isRecording && _isStopRecording) Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                    child: Row(
                      children: [
                        ZPButton(
                          // width: MediaQuery.of(context).size.width * 0.55,
                          text: "Delete",
                          textStyle: TextStyles.w700Size18White1.copyWith(color: const Color(0xFFc27c7c)),
                          color: const Color(0xFFcdb2b5),
                          radius: 100,
                          onPressed: _saveRecording,
                        ),
                        SizedBox(width: 4.w,),
                        ZPButton(
                          // width: MediaQuery.of(context).size.width * 0.55,
                          text: "Resume",
                          textStyle: TextStyles.w700Size18White1,
                          color: const Color(0xFFd54e49),
                          radius: 100,
                          onPressed: _resumeRecording,
                        ),
                        SizedBox(width: 4.w,),
                        Expanded(
                          child: ZPButton(
                            // width: MediaQuery.of(context).size.width * 0.55,
                            text: "Save",
                            textStyle: TextStyles.w700Size18White1,
                            color: AppColors.black1,
                            radius: 100,
                            onPressed: _saveRecording,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
