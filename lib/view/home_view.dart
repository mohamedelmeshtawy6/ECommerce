import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view_model/home_viewmodel.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (c) => c.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              body: ListView(children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchFormTextField(),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Category",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _listViewCategory(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best Selling',
                            fontSize: 18,
                          ),
                          CustomText(
                            text: 'See All',
                            fontSize: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewProduct(),
                    ],
                  ),
                ),
              ])),
    );
  }

  Widget _searchFormTextField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (con) => SingleChildScrollView(
        child: SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: con.categoryModel.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          con.categoryModel[index].image.toString()),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(text: con.categoryModel[index].name.toString())
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controlller) => SizedBox(
        height: 350,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controlller.productsModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                    () => DetailsView(model: controlller.productsModel[index]));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100),
                      width: MediaQuery.of(context).size.width * .4,
                      child: SizedBox(
                          height: 220,
                          child: Image.network(
                            controlller.productsModel[index].image.toString(),
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controlller.productsModel[index].name.toString(),
                      alignment: Alignment.bottomLeft,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        maxline: 1,
                        color: Colors.grey,
                        text: controlller.productsModel[index].description
                            .toString(),
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: '${controlller.productsModel[index].price}  \$',
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
