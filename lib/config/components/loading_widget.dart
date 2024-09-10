import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key, this.size = 60});

  final double size;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //     height: widget.size,
    //     width: widget.size,
    //     child: Platform.isAndroid
    //         ? const CircularProgressIndicator(color: Colors.blue)
    //         : const CupertinoActivityIndicator(
    //             color: Colors.blue,
    //           ));
    return SizedBox(
        height: widget.size,
        width: widget.size,
        child: const CircularProgressIndicator(color: Colors.blue));
  }
}
