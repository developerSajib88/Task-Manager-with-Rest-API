
import 'package:flutter/cupertino.dart';
import 'package:motion_toast/motion_toast.dart';

successToast(BuildContext context, String description){
  MotionToast.success(
    title: const Text("Success"),
    description: Text(description),
    borderRadius: 0,
  ).show(context);
}


failedToast(BuildContext context, String description){
  MotionToast.error(
      title: const Text("Failed"),
      description: Text(description),
      borderRadius: 0,
  ).show(context);
}