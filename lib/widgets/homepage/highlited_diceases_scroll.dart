import 'package:flutter/material.dart';
import 'package:my_app/modals/diceases_cat.dart';
import 'category_card.dart';

class categeory_sec extends StatelessWidget {
  const categeory_sec({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Search by specialization",
                style: TextStyle(
                    color: Color(0xFF4527A0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: 100,
                child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: diceases_catagory.categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    indent: 20,
                  ),
                  itemBuilder: (context, index) {
                    return My_cat_card(
                      category: diceases_catagory.categories[index],
                    );
                  },
                ))
          ],
        ));
  }
}
