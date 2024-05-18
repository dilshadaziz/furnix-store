import 'package:clean_architecture/utils/device/devices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormContainerWidget extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  bool isPassword = false;

   FormContainerWidget({super.key, required this.icon, required this.hintText, required this.controller, required this.inputType,required this.isPassword});

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {

  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength:widget.inputType == TextInputType.phone ? 10 : null,
      buildCounter: widget.inputType == TextInputType.phone ? (context, {required currentLength, required isFocused, required maxLength}) {
       return Text("$currentLength/$maxLength");
      } : null,
  validator: (value){},
  keyboardType: widget.inputType,
  controller: widget.controller,
    obscureText: widget.isPassword ? isObscureText : false,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(widget.icon),
        hintText: widget.hintText,
        suffixIcon: widget.isPassword ?  GestureDetector(
          onTap: (){
            setState(() {
            isObscureText = !isObscureText;
            });
          },
          child: Icon(isObscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
        ) : null
        ),
 );
  }
}