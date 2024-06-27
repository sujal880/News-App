import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper {
  static CustomTextField(
      TextEditingController controller, String text, IconData iconData) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }

  static CustomButton(VoidCallback callback,String text){
    return GestureDetector(
      onTap: (){
        callback();
      },
      child: Container(
        height: 50.h,
        width: 340.w,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: 15.sp,color: Colors.white),),),
      ),
    );
  }

  static CustomDialog(String text,BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("ok"))
        ],
      );
    });
  }
}
