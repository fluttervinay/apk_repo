import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tmp/mobex/demoscreen.dart';
import 'package:tmp/mobex/resepe_store.dart';

class ResepeScreen extends StatefulWidget {
  const ResepeScreen({super.key});

  @override
  State<ResepeScreen> createState() => _ResepeScreenState();
}

class _ResepeScreenState extends State<ResepeScreen> {

  final ResepeStore resepeStore=ResepeStore();

  @override
  void initState() {
    super.initState();
    resepeStore.resepeapi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resepe Screen'),
        actions: [
          IconButton(onPressed: () {
            Get.to(()=> Demoscreen());
          }, icon: Icon(Icons.notification_add_outlined))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(
              builder: (_) {
                if(resepeStore.isloading){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(resepeStore.Error.isNotEmpty){
                  return Center(child: Text("Opps Somthing Want To Wrong..!"),);
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: resepeStore.resepeModal.recipes?.length??0,
                    itemBuilder: (context, index) {
                      final recipe = resepeStore.resepeModal.recipes?[index];
                      return ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // Recipe Name
                              Divider(),
                              Text(
                                recipe?.name??"",
                                style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Divider(),
                              SizedBox(height: 16),

                              // Image
                              Container(
                                width: 250,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(recipe?.image??""),
                                )
                              ),
                              SizedBox(height: 16),


                              SizedBox(height: 16),

                              Divider(),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Prep Time:',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 6,),
                                        Text(
                                          recipe?.prepTimeMinutes.toString()??"",
                                          style: GoogleFonts.varelaRound(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            color: HexColor('#4F709C'),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Cook Time:',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 6,),
                                        Text(
                                          recipe?.cookTimeMinutes.toString()??"",
                                          style: GoogleFonts.varelaRound(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            color: HexColor('#4F709C'),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Servings:',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 6,),
                                        Text(
                                          recipe?.servings.toString()??"",
                                          style: GoogleFonts.varelaRound(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            color: HexColor('#4F709C'),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              SizedBox(height: 16),

                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Difficulty:',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          recipe?.difficulty.toString()??"",
                                          style: GoogleFonts.varelaRound(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            color: HexColor('#4F709C'),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Cuisine:',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          recipe?.cuisine.toString()??"",
                                          style: GoogleFonts.varelaRound(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            color: HexColor('#4F709C'),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Calories per Serving:',textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          recipe?.caloriesPerServing.toString()??"",
                                          style: GoogleFonts.varelaRound(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            color: HexColor('#4F709C'),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),

                              // Ingredients
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ingredients',
                                    style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#EEEEEE'),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: const[
                                        BoxShadow(
                                            blurStyle: BlurStyle.normal,
                                            blurRadius: 12,
                                            spreadRadius: 0.1,
                                            offset: Offset(5, 8),
                                            color: Colors.black12
                                        )
                                      ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(recipe!.ingredients!.join(','),textAlign: TextAlign.center,
                                        style: GoogleFonts.lato(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 15,
                                            height: 1.6,
                                            color: Colors.black54
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 16),

                              // Instructions

                              SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Instructions',
                                    style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: HexColor('#EEEEEE'),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: const[
                                          BoxShadow(
                                              blurStyle: BlurStyle.inner,
                                              blurRadius: 15,
                                              spreadRadius: 0.1,
                                              offset: Offset(5, 10),
                                              color: Colors.black12
                                          )
                                        ]
                                    ),
                                    child: Column(
                                      children: [
                                        for (int i = 0; i < recipe!.instructions!.length; i++)
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("◦ ${recipe.instructions![i]}",textAlign: TextAlign.justify,
                                              style: GoogleFonts.poppins(
                                                textStyle: Theme.of(context).textTheme.displayLarge,
                                                fontSize: 14,
                                                color: Colors.black54
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Tags:',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 6,),
                                        for (int i = 0; i < recipe!.tags!.length; i++)
                                          Text('${recipe.tags![i]}',
                                            style: GoogleFonts.varelaRound(
                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                              fontSize: 16,
                                              color: HexColor('#4F709C'),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Rating:',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          "${recipe?.rating.toString()??""}",
                                            style: GoogleFonts.varelaRound(
                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                              fontSize: 16,
                                              color: HexColor('#4F709C'),
                                              fontWeight: FontWeight.w400,
                                            ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          'MealType:',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        for (int i = 0; i < recipe!.mealType!.length; i++)
                                        Text(
                                          recipe.mealType![i],
                                          style: GoogleFonts.varelaRound(
                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                            fontSize: 16,
                                            color: HexColor('#4F709C'),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Divider(),
                              SizedBox(height: 3,),
                              Divider(),
                              SizedBox(height: 20,),
                              Text("Resepe No: ${recipe!.id! +1}",
                                style: GoogleFonts.varelaRound(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  fontSize: 16,
                                  color: HexColor('#686D76'),
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
