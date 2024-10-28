import 'package:flutter/material.dart';
import 'package:coconut_note/utils/style/app_colors.dart';

class ZPSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool showColorOff;

  const ZPSwitch(
      {Key? key,
      required this.value,
      required this.onChanged,
      this.showColorOff = false})
      : super(key: key);

  @override
  State createState() => _ZPSwitchState();
}

class _ZPSwitchState extends State<ZPSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
            onTap: () {
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Container(
              width: 50.0,
              height: 34.0,
              decoration: BoxDecoration(
                color:  widget.value
                        ? AppColors.mint2
                        : AppColors.grey3,
                borderRadius: BorderRadius.circular(36.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 2.0, bottom: 2.0, right: 4.0, left: 4.0),
                child: Container(
                  alignment: widget.value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.showColorOff
                          ? widget.value
                              ? AppColors.white3
                              : AppColors.mint2
                          : AppColors.white1,
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
