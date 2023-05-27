import 'package:flutter/material.dart';
import 'package:my_app/modals/diceases_cat.dart';

import '../../pages/Dr_list_page.dart';

class My_cat_card extends StatelessWidget {
  final Category category;

  const My_cat_card({super.key, required this.category})
      : assert(category != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 120,
      decoration: BoxDecoration(
          border: Border.all(
              width: 3,
              strokeAlign: BorderSide.strokeAlignInside,
              color: Color(0xFF4527A0)),
          color: Color(0xFFCEBDED),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Positioned(
            top: 27,
            right: 0,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => dr_list_page(
                          category: category,
                        )),
              ),
              child: Container(
                height: 40,
                width: 30,
                decoration: BoxDecoration(
                    color: Color(0xFF4527A0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.deepPurple[200],
                  size: 35,
                ),
              ),
            )),
        Positioned(
            top: 5,
            left: 5,
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Color(0xFF4527A0),
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 2)),
              child: Image(
                image: AssetImage(category.logo),
                fit: BoxFit.fill,
              ),
            )),
        Positioned(
          bottom: 5,
          left: 5,
          child: Text(
            category.name,
            style: TextStyle(
                color: Colors.deepPurple[900],
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
        ),
      ]),
    );
  }
}
