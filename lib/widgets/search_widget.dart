import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../constant/constant.dart';

class SearchWidget extends StatefulWidget{
  final String hint;
  final TextEditingController? controller;
  final Function? validator;
  final Function? onChanged;

  SearchWidget({
    required this.hint,
    this.controller,
    this.onChanged,
    this.validator
  });
  _SearchWidgetState createState()=>_SearchWidgetState();

}

class _SearchWidgetState extends State<SearchWidget>{
  String result = "";
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.width*0.80,
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              fillColor: Colors.green[50],
              filled: true,
              hintText: widget.hint,
              suffixIcon: InkWell(
                  onTap: () async{
                    var res = await Get.to(Container(
                        color: Colors.red,
                        width: 200,
                        height: 500,
                        child: SimpleBarcodeScannerPage()));
                    setState(() {
                      if (res is String) {
                        result = res;
                      }
                    });
                  },
                  child: Image.asset('assets/images/scan.png')),
              prefixIcon: Icon(Icons.search_rounded),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Colors.white,width: 1.5
                )
              ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                        color: Colors.white,width: 1.5
                    )
                )

            ),
          ),
        ),
        Image.asset('assets/images/fileter.png'),

      ],
    );
  }
}