import 'package:flutter/material.dart';

/// FileName keep_alive_wrapper
///
/// @Author LinGuanYu
/// @Date 2023/6/10 15:40
///
/// @Description TODO

class KeepAliveWrapper extends StatefulWidget {
  Widget child;
  bool keepAlive;
   KeepAliveWrapper({super.key,required this.child, this.keepAlive = true});

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.keepAlive;
}
