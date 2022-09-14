import 'package:flutter/material.dart';
import 'package:otus_hwork7_recipe_list/common/app_colors.dart';

import '../../../common/app_fonts.dart';
import '../../../generated/l10n.dart';
import '../../data/models/recipe.dart';

List<Recipe> mock = [
  Recipe(
      id: 1,
      name: "Лосось в соусе терияки",
      duration: 10,
      photo: "assets/images/2a02af013e816581720c9245aa5ffaad28e2d128.png"),
  Recipe(
      id: 2,
      name: "Поке боул с сыром тофу",
      duration: 30,
      photo: "assets/images/4eeaf1aca491ff10a7c6e391d8e9fcaadd76a0dd.png"),
  Recipe(
      id: 3,
      name: "Стейк из говядины по-грузински с кукурузой",
      duration: 75,
      photo: "assets/images/aeda36591795131bf998bbec61201a2d81c2c1f7.png"),
  Recipe(
      id: 4,
      name: "Тосты с голубикой и бананом",
      duration: 45,
      photo: "assets/images/ed63aee55f3c5badf56fd663f1fb0f2676cf61ed.png"),
  Recipe(
      id: 5,
      name: "Паста с морепродуктами",
      duration: 25,
      photo: "assets/images/9022f5fb234096330f0e6de18624f7f69747fd8d.png")
];

class RecipeListView extends StatelessWidget {
  const RecipeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding:
            const EdgeInsets.only(left: 16, top: 50, right: 16, bottom: 16),
        itemCount: mock.length,
        itemBuilder: (context, index) => RecipeItem(item: mock[index]));
  }
}

class RecipeItem extends StatefulWidget {
  final Recipe item;

  const RecipeItem({required this.item, Key? key}) : super(key: key);

  @override
  State<RecipeItem> createState() => _RecipeItemState();
}

class _RecipeItemState extends State<RecipeItem> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    debugPrint('build: ${runtimeType.toString()} ${widget.item.toString()}');
    return GestureDetector(
//      onTap: () => Navigator.pushNamed(context, '/Widget1'),

        child: Column(
      children: [
        PhysicalModel(
          color: AppColors.listItemBackground, //Colors.white,
          borderRadius: BorderRadius.circular(5),
          elevation: 8,
          child: SizedBox(
            height: 136.0,
            child: Flex(
              mainAxisSize: MainAxisSize.max,
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(widget.item.photo!, fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  // child:
                  //     (child: Image.network(item.url, fit: BoxFit.)),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            height: 1.0,
                            fontSize: 22.0,
                            fontFamily: AppFonts.fontRoboto,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.watch_later_outlined),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "${widget.item.duration} ${S.of(context).minutes}",
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: AppFonts.fontRoboto,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greenColor,

                                  /* letterSpacing: 0.0, */
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 16,
          color: Colors.white,
        )
      ],
    ));
  }
}

/*
PhysicalModel(
        color: Colors.white,
        shadowColor: Colors.red,
        elevation: 8.0,
        borderRadius: BorderRadius.circular(5.0),
        child: SizedBox(
          width: 396.0,
          height: 136.0,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 0.5303030303030303;

                  final double height =
                      constraints.maxHeight * 0.39705882352941174;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.4166666666666667,
                        y: constraints.maxHeight * 0.22058823529411764,
                        z: 0,
                        child: SizedBox(
                          width: width,
                          height: height,
                          child: Text(
                            widget.item.name!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              height: 1.0,
                              fontSize: 22.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
                            ),
                          ),
                        ))
                  ]);
                }),
              ), // Название блюда

              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.48484848484848486,
                        y: constraints.maxHeight * 0.6911764705882353,
                        z: 0,
                        child: SizedBox(
                          child: Text(
                            "${widget.item.duration} ${S.of(context).minutes}",
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              height: 1.171875,
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 46, 204, 113),

                              /* letterSpacing: 0.0, */
                            ),
                          ),
                        ))
                  ]);
                }),
              ), // Время приготовления

              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 0.37626262626262624;

                  final double height = constraints.maxHeight;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: 0,
                        y: 0,
                        z: 0,
                        child: SizedBox(
                          width: width,
                          height: height,
                          child: Container(
                            width: 149.0,
                            height: 136.0,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                              child: Image.asset(
                                widget.item.photo!,
                                color: null,
                                fit: BoxFit.cover,
                                width: 149.0,
                                height: 136.0,
                                colorBlendMode: BlendMode.dstATop,
                              ),
                            ),
                          ),
                        ))
                  ]);
                }),
              ), // Картинка слева

              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 0.04040404040404041;

                  final double height =
                      constraints.maxHeight * 0.11764705882352941;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.4166666666666667,
                        y: constraints.maxHeight * 0.6985294117647058,
                        z: 0,
                        child: SizedBox(
                          width: width,
                          height: height,
                          child: const Clock(),
                        ))
                  ]);
                }),
              ), // Часы


            ],
          ),
        ),
      ),
 */
