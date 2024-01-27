// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shimmer_animation/shimmer_animation.dart';
// import 'package:sixam_mart/controller/item_controller.dart';
// import 'package:sixam_mart/controller/localization_controller.dart';
// import 'package:sixam_mart/controller/splash_controller.dart';
// import 'package:sixam_mart/controller/theme_controller.dart';
// import 'package:sixam_mart/data/model/response/item_model.dart';
// import 'package:sixam_mart/helper/price_converter.dart';
// import 'package:sixam_mart/helper/route_helper.dart';
// import 'package:sixam_mart/util/dimensions.dart';
// import 'package:sixam_mart/util/images.dart';
// import 'package:sixam_mart/util/styles.dart';
// import 'package:sixam_mart/view/base/corner_banner/banner.dart';
// import 'package:sixam_mart/view/base/corner_banner/corner_discount_tag.dart';
// import 'package:sixam_mart/view/base/custom_image.dart';
// import 'package:sixam_mart/view/base/not_available_widget.dart';
// import 'package:sixam_mart/view/base/organic_tag.dart';
// import 'package:sixam_mart/view/base/rating_bar.dart';
// import 'package:sixam_mart/view/base/title_widget.dart';
//
// import '../../../../controller/category_controller.dart';
// import '../../../../controller/store_controller.dart';
// import '../../../base/item_view.dart';
//
// class CategoryItemView1 extends StatefulWidget {
//   final String? categoryID;
//   final String categoryName;
//
//   // const CategoryItemView1({Key? key }) : super(key: key);
//   const CategoryItemView1({Key? key, required this.categoryID,required this.categoryName}) : super(key: key);
//
//   @override
//   State<CategoryItemView1> createState() => _CategoryItemView1State();
// }
//
// class _CategoryItemView1State extends State<CategoryItemView1> {
//   final ScrollController scrollController = ScrollController();
//   // @override
//   // void initState() {
//   //   super.initState();
//   //
//   //   Get.find<CategoryController>().getSubCategoryList(widget.categoryID);
//   //   scrollController.addListener(() {
//   //     if (scrollController.position.pixels ==
//   //         scrollController.position.maxScrollExtent &&
//   //         Get.find<CategoryController>().categoryItemList != null &&
//   //         !Get.find<CategoryController>().isLoading) {
//   //       int pageSize = (Get.find<CategoryController>().pageSize! / 10).ceil();
//   //       if (Get.find<CategoryController>().offset < pageSize) {
//   //         if (kDebugMode) {
//   //           print('end of the page');
//   //         }
//   //         Get.find<CategoryController>().showBottomLoader();
//   //         Get.find<CategoryController>().getCategoryItemList(
//   //           Get.find<CategoryController>().subCategoryIndex == 0
//   //               ? widget.categoryID
//   //               : Get.find<CategoryController>()
//   //               .subCategoryList![
//   //           Get.find<CategoryController>().subCategoryIndex]
//   //               .id
//   //               .toString(),
//   //           Get.find<CategoryController>().offset + 1,
//   //           Get.find<CategoryController>().type,
//   //           false,
//   //         );
//   //       }
//   //     }
//   //   });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     final bool ltr = Get.find<LocalizationController>().isLtr;
//
//     // return GetBuilder<ItemController>(builder: (itemController) {
//     //   List<Item>? itemList = isPopular
//     //       ? itemController.popularItemList
//     //       : itemController.reviewedItemList;
//     //
//     //   return (itemList != null && itemList.isEmpty)
//     //       ? const SizedBox()
//     //       : Column(
//     return GetBuilder<CategoryController>(builder: (categoryController) {
//       return (categoryController.categoryList != null &&
//           categoryController.categoryList!.isEmpty)
//           ? const SizedBox()
//           : Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
//                   child: TitleWidget(
//                       title: 'categories'.tr,
//                       onTap: () {}),//=> Get.toNamed(RouteHelper.getCategoryRoute())),,
//                 ),
//                 SizedBox(
//                   height: ltr ? 95 : 110,
//                   child: categoryController.categoryList! != null
//                       ?
//                   ListView.builder(
//                           controller: ScrollController(),
//                           physics: const BouncingScrollPhysics(),
//                           scrollDirection: Axis.horizontal,
//                           padding: const EdgeInsets.only(
//                               left: Dimensions.paddingSizeSmall),
//                           itemCount:
//                           categoryController.categoryList!.length > 10 ? 10 : categoryController.categoryList!.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.fromLTRB(
//                                   2, 2, Dimensions.paddingSizeSmall, 2),
//                               child: InkWell(
//                                 onTap: () {
//                                   // Get.find<ItemController>().navigateToItemPage(
//                                   //   itemList[index],
//                                   //   context,
//                                   //   storeOpened: Get.find<StoreController>()
//                                   //       .openedStores
//                                   //       .contains(
//                                   //         itemList[index].storeId.toString(),
//                                   //       ),
//                                   // );
//                                 },
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height: ltr ? 90 : 105,
//                                       width: 250,
//                                       padding: const EdgeInsets.all(
//                                           Dimensions.paddingSizeExtraSmall),
//                                       decoration: BoxDecoration(
//                                         color: Theme.of(context).cardColor,
//                                         borderRadius: BorderRadius.circular(
//                                             Dimensions.radiusSmall),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey[
//                                                 Get.find<ThemeController>()
//                                                         .darkTheme
//                                                     ? 800
//                                                     : 300]!,
//                                             blurRadius: 5,
//                                             spreadRadius: 1,
//                                           )
//                                         ],
//                                       ),
//                                       child: Column(
//                                         children: [
//                                           Text(" ${categoryController
//                                               .categoryList![index].name!}"),
//                                           Row(children: [
//                                               GetBuilder<CategoryController>(builder: (catController) {
//                                               List<Item>? item;
//                                               if (catController.isSearching
//                                                   ? catController.searchItemList != null
//                                                   : catController.categoryItemList != null) {
//                                                 item = [];
//                                                 if (catController.isSearching) {
//                                                   item.addAll(catController.searchItemList!);
//                                                 } else {
//                                                   item.addAll(catController.categoryItemList!);
//                                                 }
//                                               }
//                                               if (catController.isSearching
//                                                   ? catController.searchStoreList != null
//                                                   : catController.categoryStoreList != null) {
//                                               }
//
//                                               return
//                                                 WillPopScope(
//                                                 onWillPop: () async {
//                                                   if (catController.isSearching) {
//                                                     catController.toggleSearch();
//                                                     return false;
//                                                   } else {
//                                                     return true;
//                                                   }
//                                                 },
//                                               child:
//                                                 Center(
//                                                       child: SizedBox(
//                                                         width: Dimensions.webMaxWidth,
//                                                         child: Column(children: [
//                                                           (catController.subCategoryList != null &&
//                                                               !catController.isSearching)
//                                                               ?
//                                                           Column(
//                                                                 children: [
//                                                                   SingleChildScrollView(
//                                                                     child: ListView(children: [Text("categoryController.categoryItemList!.length.toString()")],)
//                                                                     // ItemsView(
//                                                                     //   isStore: false,
//                                                                     //   items: item,
//                                                                     //   stores: null,
//                                                                     //   noDataText: 'no_category_item_found'.tr,
//                                                                     // ),
//                                                                   ),
//                                                                 ],
//                                                               )
//                                                           // Center(
//                                                           //     child: Container(
//                                                           //       height: 40,
//                                                           //       width: Dimensions.webMaxWidth,
//                                                           //       color: Theme.of(context).cardColor,
//                                                           //       padding: const EdgeInsets.symmetric(
//                                                           //           vertical: Dimensions.paddingSizeExtraSmall),
//                                                           //       child: ListView.builder(
//                                                           //         scrollDirection: Axis.horizontal,
//                                                           //         itemCount: catController.subCategoryList!.length,
//                                                           //         padding: const EdgeInsets.only(
//                                                           //             left: Dimensions.paddingSizeSmall),
//                                                           //         physics: const BouncingScrollPhysics(),
//                                                           //         itemBuilder: (context, index) {
//                                                           //           return InkWell(
//                                                           //             onTap: () => catController.setSubCategoryIndex(
//                                                           //                 index, categoryController
//                                                           //                 .categoryList![index].id!.toString()),
//                                                           //             child: Container(
//                                                           //               padding: const EdgeInsets.symmetric(
//                                                           //                   horizontal: Dimensions.paddingSizeSmall,
//                                                           //                   vertical: Dimensions.paddingSizeExtraSmall),
//                                                           //               margin: const EdgeInsets.only(
//                                                           //                   right: Dimensions.paddingSizeSmall),
//                                                           //               decoration: BoxDecoration(
//                                                           //                 borderRadius: BorderRadius.circular(
//                                                           //                     Dimensions.radiusSmall),
//                                                           //                 color: index == catController.subCategoryIndex
//                                                           //                     ? Theme.of(context)
//                                                           //                     .primaryColor
//                                                           //                     .withOpacity(0.1)
//                                                           //                     : Colors.transparent,
//                                                           //               ),
//                                                           //               child: Column(
//                                                           //                   mainAxisAlignment: MainAxisAlignment.center,
//                                                           //                   children: [
//                                                           //                     Text(
//                                                           //                       catController
//                                                           //                           .subCategoryList![index].name!,
//                                                           //                       style: index ==
//                                                           //                           catController.subCategoryIndex
//                                                           //                           ? robotoMedium.copyWith(
//                                                           //                           fontSize:
//                                                           //                           Dimensions.fontSizeSmall,
//                                                           //                           color: Theme.of(context)
//                                                           //                               .primaryColor)
//                                                           //                           : robotoRegular.copyWith(
//                                                           //                           fontSize:
//                                                           //                           Dimensions.fontSizeSmall),
//                                                           //                     ),
//                                                           //                   ]),
//                                                           //             ),
//                                                           //           );
//                                                           //         },
//                                                           //       ),
//                                                           //     ))
//                                                               : const SizedBox(),
//                                                           // Center(
//                                                           //     child: Container(
//                                                           //       width: Dimensions.webMaxWidth,
//                                                           //       color: Theme.of(context).cardColor,
//                                                           //       child: TabBar(
//                                                           //         controller: _tabController,
//                                                           //         indicatorColor: Theme.of(context).primaryColor,
//                                                           //         indicatorWeight: 3,
//                                                           //         labelColor: Theme.of(context).primaryColor,
//                                                           //         unselectedLabelColor: Theme.of(context).disabledColor,
//                                                           //         unselectedLabelStyle: robotoRegular.copyWith(
//                                                           //             color: Theme.of(context).disabledColor,
//                                                           //             fontSize: Dimensions.fontSizeSmall),
//                                                           //         labelStyle: robotoBold.copyWith(
//                                                           //             fontSize: Dimensions.fontSizeSmall,
//                                                           //             color: Theme.of(context).primaryColor),
//                                                           //         tabs: [
//                                                           //           Tab(text: 'item'.tr),
//                                                           //           // Tab(
//                                                           //           //     text: Get.find<SplashController>()
//                                                           //           //             .configModel!
//                                                           //           //             .moduleConfig!
//                                                           //           //             .module!
//                                                           //           //             .showRestaurantText!
//                                                           //           //         ? 'restaurants'.tr
//                                                           //           //         : 'stores'.tr),
//                                                           //         ],
//                                                           //       ),
//                                                           //     )),
//                                                           // Expanded(
//                                                           //     child: NotificationListener(
//                                                           //       onNotification: (dynamic scrollNotification) {
//                                                           //         if (scrollNotification is ScrollEndNotification) {
//                                                           //           if ((_tabController!.index == 1 &&
//                                                           //               !catController.isStore) ||
//                                                           //               _tabController!.index == 0 && catController.isStore) {
//                                                           //             catController.setRestaurant(_tabController!.index == 1);
//                                                           //             if (catController.isSearching) {
//                                                           //               catController.searchData(
//                                                           //                 catController.searchText,
//                                                           //                 catController.subCategoryIndex == 0
//                                                           //                     ? widget.categoryID
//                                                           //                     : catController
//                                                           //                     .subCategoryList![
//                                                           //                 catController.subCategoryIndex]
//                                                           //                     .id
//                                                           //                     .toString(),
//                                                           //                 catController.type,
//                                                           //               );
//                                                           //             } else {
//                                                           //               if (_tabController!.index == 1) {
//                                                           //                 catController.getCategoryStoreList(
//                                                           //                   catController.subCategoryIndex == 0
//                                                           //                       ? widget.categoryID
//                                                           //                       : catController
//                                                           //                       .subCategoryList![
//                                                           //                   catController.subCategoryIndex]
//                                                           //                       .id
//                                                           //                       .toString(),
//                                                           //                   1,
//                                                           //                   catController.type,
//                                                           //                   false,
//                                                           //                 );
//                                                           //               } else {
//                                                           //                 catController.getCategoryItemList(
//                                                           //                   catController.subCategoryIndex == 0
//                                                           //                       ? widget.categoryID
//                                                           //                       : catController
//                                                           //                       .subCategoryList![
//                                                           //                   catController.subCategoryIndex]
//                                                           //                       .id
//                                                           //                       .toString(),
//                                                           //                   1,
//                                                           //                   catController.type,
//                                                           //                   false,
//                                                           //                 );
//                                                           //               }
//                                                           //             }
//                                                           //           }
//                                                           //         }
//                                                           //         return false;
//                                                           //       },
//                                                           //       child: TabBarView(
//                                                           //         controller: _tabController,
//                                                           //         children: [
//                                                           //           SingleChildScrollView(
//                                                           //             controller: scrollController,
//                                                           //             child: ItemsView(
//                                                           //               isStore: false,
//                                                           //               items: item,
//                                                           //               stores: null,
//                                                           //               noDataText: 'no_category_item_found'.tr,
//                                                           //             ),
//                                                           //           ),
//                                                           //           // SingleChildScrollView(
//                                                           //           //   controller: storeScrollController,
//                                                           //           //   child: ItemsView(
//                                                           //           //     isStore: true,
//                                                           //           //     items: null,
//                                                           //           //     stores: stores,
//                                                           //           //     noDataText: Get.find<SplashController>()
//                                                           //           //             .configModel!
//                                                           //           //             .moduleConfig!
//                                                           //           //             .module!
//                                                           //           //             .showRestaurantText!
//                                                           //           //         ? 'no_category_restaurant_found'.tr
//                                                           //           //         : 'no_category_store_found'.tr,
//                                                           //           //   ),
//                                                           //           // ),
//                                                           //         ],
//                                                           //       ),
//                                                           //     )),
//                                                           // catController.isLoading
//                                                           //     ? Center(
//                                                           //     child: Padding(
//                                                           //       padding:
//                                                           //       const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                                                           //       child: CircularProgressIndicator(
//                                                           //           valueColor: AlwaysStoppedAnimation<Color>(
//                                                           //               Theme.of(context).primaryColor)),
//                                                           //     ))
//                                                           //     : const SizedBox(),
//                                                         ]),
//                                                       // )
//                                                 ),
//                                               ));
//                                             })
//
//
//                                             // Get.toNamed(
//                                             //     RouteHelper.getCategoryItemRoute(
//                                             //       categoryController
//                                             //           .categoryList![index].id,
//                                             //       categoryController
//                                             //           .categoryList![index].name!,
//                                             //     )),
//                                             // Positioned(
//                                             //   right: ltr ? 0 : null,
//                                             //   left: ltr ? null : 0,
//                                             //   child: CornerDiscountTag(
//                                             //     bannerPosition: ltr
//                                             //         ? CornerBannerPosition.topRight
//                                             //         : CornerBannerPosition.topLeft,
//                                             //     elevation: 0,
//                                             //     discount: itemController
//                                             //         .getDiscount(itemList[index]),
//                                             //     discountType: itemController
//                                             //         .getDiscountType(itemList[index]),
//                                             //   ),
//                                             // ),
//                                           ],)
//                                         ],
//                                       )
//                                       // Row(
//                                       //     crossAxisAlignment:
//                                       //         CrossAxisAlignment.start,
//                                       //     mainAxisAlignment:
//                                       //         MainAxisAlignment.start,
//                                       //     children: [
//                                       //       Text( categoryController
//                                       //           .categoryList![index]
//                                       //           .name!,
//                                       //         maxLines: 1,
//                                       //         overflow:
//                                       //         TextOverflow.ellipsis,
//                                       //         textAlign: TextAlign.center,
//                                       //         style: robotoMedium.copyWith(
//                                       //             fontSize: Dimensions
//                                       //                 .fontSizeExtraSmall,
//                                       //             color: Colors.red),),
//                                       //
//                                       //       // Stack(children: [
//                                       //       //   ClipRRect(
//                                       //       //     borderRadius:
//                                       //       //         BorderRadius.circular(
//                                       //       //             Dimensions.radiusSmall),
//                                       //       //     child: CustomImage(
//                                       //       //       image:
//                                       //       //           '${Get.find<SplashController>().configModel!.baseUrls!.itemImageUrl}'
//                                       //       //           '/${itemList[index].image}',
//                                       //       //       height: 80,
//                                       //       //       width: 80,
//                                       //       //       fit: BoxFit.cover,
//                                       //       //     ),
//                                       //       //   ),
//                                       //       //   OrganicTag(
//                                       //       //       item: itemList[index],
//                                       //       //       placeInImage: true),
//                                       //       //   itemController.isAvailable(
//                                       //       //           itemList[index])
//                                       //       //       ? const SizedBox()
//                                       //       //       : const NotAvailableWidget(),
//                                       //       // ]),
//                                       //       // Expanded(
//                                       //       //   child: Padding(
//                                       //       //     padding: const EdgeInsets
//                                       //       //             .symmetric(
//                                       //       //         horizontal: Dimensions
//                                       //       //             .paddingSizeExtraSmall),
//                                       //       //     child: Column(
//                                       //       //         crossAxisAlignment:
//                                       //       //             CrossAxisAlignment
//                                       //       //                 .start,
//                                       //       //         mainAxisAlignment:
//                                       //       //             MainAxisAlignment
//                                       //       //                 .center,
//                                       //       //         children: [
//                                       //       //           Row(children: [
//                                       //       //             Expanded(
//                                       //       //               flex: 8,
//                                       //       //               child:
//                                       //       //                   Wrap(children: [
//                                       //       //                 Text(
//                                       //       //                   itemList[index]
//                                       //       //                       .name!,
//                                       //       //                   style: robotoMedium
//                                       //       //                       .copyWith(
//                                       //       //                           fontSize:
//                                       //       //                               Dimensions
//                                       //       //                                   .fontSizeSmall),
//                                       //       //                   maxLines: 1,
//                                       //       //                   overflow:
//                                       //       //                       TextOverflow
//                                       //       //                           .ellipsis,
//                                       //       //                 ),
//                                       //       //                 const SizedBox(
//                                       //       //                     width: Dimensions
//                                       //       //                         .paddingSizeExtraSmall),
//                                       //       //                 (Get.find<SplashController>()
//                                       //       //                             .configModel!
//                                       //       //                             .moduleConfig!
//                                       //       //                             .module!
//                                       //       //                             .vegNonVeg! &&
//                                       //       //                         Get.find<
//                                       //       //                                 SplashController>()
//                                       //       //                             .configModel!
//                                       //       //                             .toggleVegNonVeg!)
//                                       //       //                     ? Image.asset(
//                                       //       //                         itemList[index].veg ==
//                                       //       //                                 0
//                                       //       //                             ? Images
//                                       //       //                                 .nonVegImage
//                                       //       //                             : Images
//                                       //       //                                 .vegImage,
//                                       //       //                         height: 10,
//                                       //       //                         width: 10,
//                                       //       //                         fit: BoxFit
//                                       //       //                             .contain)
//                                       //       //                     : const SizedBox(),
//                                       //       //               ]),
//                                       //       //             ),
//                                       //       //             const Expanded(
//                                       //       //                 flex: 2,
//                                       //       //                 child: SizedBox())
//                                       //       //           ]),
//                                       //       //           const SizedBox(
//                                       //       //               height: Dimensions
//                                       //       //                   .paddingSizeExtraSmall),
//                                       //       //           // Text(
//                                       //       //           //   itemList[index]
//                                       //       //           //       .storeName!,
//                                       //       //           //   style: robotoMedium.copyWith(
//                                       //       //           //       fontSize: Dimensions
//                                       //       //           //           .fontSizeExtraSmall,
//                                       //       //           //       color: Theme.of(
//                                       //       //           //               context)
//                                       //       //           //           .disabledColor),
//                                       //       //           //   maxLines: 1,
//                                       //       //           //   overflow: TextOverflow
//                                       //       //           //       .ellipsis,
//                                       //       //           // ),
//                                       //       //           RatingBar(
//                                       //       //             rating: itemList[index]
//                                       //       //                 .avgRating,
//                                       //       //             size: 12,
//                                       //       //             ratingCount:
//                                       //       //                 itemList[index]
//                                       //       //                     .ratingCount,
//                                       //       //           ),
//                                       //       //           (Get.find<SplashController>()
//                                       //       //                       .configModel!
//                                       //       //                       .moduleConfig!
//                                       //       //                       .module!
//                                       //       //                       .unit! &&
//                                       //       //                   itemList[index]
//                                       //       //                           .unitType !=
//                                       //       //                       null)
//                                       //       //               ? Text(
//                                       //       //                   '(${itemList[index].unitType ?? ''})',
//                                       //       //                   style: robotoRegular.copyWith(
//                                       //       //                       fontSize:
//                                       //       //                           Dimensions
//                                       //       //                               .fontSizeExtraSmall,
//                                       //       //                       color: Theme.of(
//                                       //       //                               context)
//                                       //       //                           .hintColor),
//                                       //       //                 )
//                                       //       //               : const SizedBox(),
//                                       //       //           Row(children: [
//                                       //       //             Expanded(
//                                       //       //               child: Row(
//                                       //       //                   crossAxisAlignment:
//                                       //       //                       CrossAxisAlignment
//                                       //       //                           .end,
//                                       //       //                   children: [
//                                       //       //                     itemList[index]
//                                       //       //                                 .discount! >
//                                       //       //                             0
//                                       //       //                         ? Flexible(
//                                       //       //                             child:
//                                       //       //                                 Text(
//                                       //       //                             PriceConverter.convertPrice(
//                                       //       //                                 itemController.getStartingPrice(itemList[index])),
//                                       //       //                             style: robotoMedium
//                                       //       //                                 .copyWith(
//                                       //       //                               fontSize:
//                                       //       //                                   Dimensions.fontSizeExtraSmall,
//                                       //       //                               color: Theme.of(context)
//                                       //       //                                   .colorScheme
//                                       //       //                                   .error,
//                                       //       //                               decoration:
//                                       //       //                                   TextDecoration.lineThrough,
//                                       //       //                             ),
//                                       //       //                             textDirection:
//                                       //       //                                 TextDirection.ltr,
//                                       //       //                           ))
//                                       //       //                         : const SizedBox(),
//                                       //       //                     SizedBox(
//                                       //       //                         width: itemList[index].discount! >
//                                       //       //                                 0
//                                       //       //                             ? Dimensions
//                                       //       //                                 .paddingSizeExtraSmall
//                                       //       //                             : 0),
//                                       //       //                     Text(
//                                       //       //                       PriceConverter
//                                       //       //                           .convertPrice(
//                                       //       //                         itemController
//                                       //       //                             .getStartingPrice(
//                                       //       //                                 itemList[index]),
//                                       //       //                         discount: itemList[
//                                       //       //                                 index]
//                                       //       //                             .discount,
//                                       //       //                         discountType:
//                                       //       //                             itemList[index]
//                                       //       //                                 .discountType,
//                                       //       //                       ),
//                                       //       //                       style: robotoBold
//                                       //       //                           .copyWith(
//                                       //       //                               fontSize:
//                                       //       //                                   Dimensions.fontSizeSmall),
//                                       //       //                       textDirection:
//                                       //       //                           TextDirection
//                                       //       //                               .ltr,
//                                       //       //                     ),
//                                       //       //                   ]),
//                                       //       //             ),
//                                       //       //             Container(
//                                       //       //               height: 25,
//                                       //       //               width: 25,
//                                       //       //               decoration: BoxDecoration(
//                                       //       //                   shape: BoxShape
//                                       //       //                       .circle,
//                                       //       //                   color: Theme.of(
//                                       //       //                           context)
//                                       //       //                       .primaryColor),
//                                       //       //               child: const Icon(
//                                       //       //                   Icons.add,
//                                       //       //                   size: 20,
//                                       //       //                   color:
//                                       //       //                       Colors.white),
//                                       //       //             ),
//                                       //       //           ]),
//                                       //       //         ]),
//                                       //       //   ),
//                                       //       // ),
//                                       //     ]),
//                                     ),
//                               //   GetBuilder<CategoryController>(builder: (catController) {
//                               //   List<Item>? item;
//                               //   if (catController.isSearching
//                               //       ? catController.searchItemList != null
//                               //       : catController.categoryItemList != null) {
//                               //     item = [];
//                               //     if (catController.isSearching) {
//                               //       item.addAll(catController.searchItemList!);
//                               //     } else {
//                               //       item.addAll(catController.categoryItemList!);
//                               //     }
//                               //   }
//                               //   if (catController.isSearching
//                               //       ? catController.searchStoreList != null
//                               //       : catController.categoryStoreList != null) {
//                               //   }
//                               //
//                               //   return WillPopScope(
//                               //     onWillPop: () async {
//                               //       if (catController.isSearching) {
//                               //         catController.toggleSearch();
//                               //         return false;
//                               //       } else {
//                               //         return true;
//                               //       }
//                               //     },
//                               //   child:
//                               //     Center(
//                               //           child: SizedBox(
//                               //             width: Dimensions.webMaxWidth,
//                               //             child: Column(children: [
//                               //               (catController.subCategoryList != null &&
//                               //                   !catController.isSearching)
//                               //                   ?
//                               //               Column(
//                               //                     children: [
//                               //                       SingleChildScrollView(
//                               //                         child: ItemsView(
//                               //                           isStore: false,
//                               //                           items: item,
//                               //                           stores: null,
//                               //                           noDataText: 'no_category_item_found'.tr,
//                               //                         ),
//                               //                       ),
//                               //                     ],
//                               //                   )
//                               //               // Center(
//                               //               //     child: Container(
//                               //               //       height: 40,
//                               //               //       width: Dimensions.webMaxWidth,
//                               //               //       color: Theme.of(context).cardColor,
//                               //               //       padding: const EdgeInsets.symmetric(
//                               //               //           vertical: Dimensions.paddingSizeExtraSmall),
//                               //               //       child: ListView.builder(
//                               //               //         scrollDirection: Axis.horizontal,
//                               //               //         itemCount: catController.subCategoryList!.length,
//                               //               //         padding: const EdgeInsets.only(
//                               //               //             left: Dimensions.paddingSizeSmall),
//                               //               //         physics: const BouncingScrollPhysics(),
//                               //               //         itemBuilder: (context, index) {
//                               //               //           return InkWell(
//                               //               //             onTap: () => catController.setSubCategoryIndex(
//                               //               //                 index, categoryController
//                               //               //                 .categoryList![index].id!.toString()),
//                               //               //             child: Container(
//                               //               //               padding: const EdgeInsets.symmetric(
//                               //               //                   horizontal: Dimensions.paddingSizeSmall,
//                               //               //                   vertical: Dimensions.paddingSizeExtraSmall),
//                               //               //               margin: const EdgeInsets.only(
//                               //               //                   right: Dimensions.paddingSizeSmall),
//                               //               //               decoration: BoxDecoration(
//                               //               //                 borderRadius: BorderRadius.circular(
//                               //               //                     Dimensions.radiusSmall),
//                               //               //                 color: index == catController.subCategoryIndex
//                               //               //                     ? Theme.of(context)
//                               //               //                     .primaryColor
//                               //               //                     .withOpacity(0.1)
//                               //               //                     : Colors.transparent,
//                               //               //               ),
//                               //               //               child: Column(
//                               //               //                   mainAxisAlignment: MainAxisAlignment.center,
//                               //               //                   children: [
//                               //               //                     Text(
//                               //               //                       catController
//                               //               //                           .subCategoryList![index].name!,
//                               //               //                       style: index ==
//                               //               //                           catController.subCategoryIndex
//                               //               //                           ? robotoMedium.copyWith(
//                               //               //                           fontSize:
//                               //               //                           Dimensions.fontSizeSmall,
//                               //               //                           color: Theme.of(context)
//                               //               //                               .primaryColor)
//                               //               //                           : robotoRegular.copyWith(
//                               //               //                           fontSize:
//                               //               //                           Dimensions.fontSizeSmall),
//                               //               //                     ),
//                               //               //                   ]),
//                               //               //             ),
//                               //               //           );
//                               //               //         },
//                               //               //       ),
//                               //               //     ))
//                               //                   : const SizedBox(),
//                               //               // Center(
//                               //               //     child: Container(
//                               //               //       width: Dimensions.webMaxWidth,
//                               //               //       color: Theme.of(context).cardColor,
//                               //               //       child: TabBar(
//                               //               //         controller: _tabController,
//                               //               //         indicatorColor: Theme.of(context).primaryColor,
//                               //               //         indicatorWeight: 3,
//                               //               //         labelColor: Theme.of(context).primaryColor,
//                               //               //         unselectedLabelColor: Theme.of(context).disabledColor,
//                               //               //         unselectedLabelStyle: robotoRegular.copyWith(
//                               //               //             color: Theme.of(context).disabledColor,
//                               //               //             fontSize: Dimensions.fontSizeSmall),
//                               //               //         labelStyle: robotoBold.copyWith(
//                               //               //             fontSize: Dimensions.fontSizeSmall,
//                               //               //             color: Theme.of(context).primaryColor),
//                               //               //         tabs: [
//                               //               //           Tab(text: 'item'.tr),
//                               //               //           // Tab(
//                               //               //           //     text: Get.find<SplashController>()
//                               //               //           //             .configModel!
//                               //               //           //             .moduleConfig!
//                               //               //           //             .module!
//                               //               //           //             .showRestaurantText!
//                               //               //           //         ? 'restaurants'.tr
//                               //               //           //         : 'stores'.tr),
//                               //               //         ],
//                               //               //       ),
//                               //               //     )),
//                               //               // Expanded(
//                               //               //     child: NotificationListener(
//                               //               //       onNotification: (dynamic scrollNotification) {
//                               //               //         if (scrollNotification is ScrollEndNotification) {
//                               //               //           if ((_tabController!.index == 1 &&
//                               //               //               !catController.isStore) ||
//                               //               //               _tabController!.index == 0 && catController.isStore) {
//                               //               //             catController.setRestaurant(_tabController!.index == 1);
//                               //               //             if (catController.isSearching) {
//                               //               //               catController.searchData(
//                               //               //                 catController.searchText,
//                               //               //                 catController.subCategoryIndex == 0
//                               //               //                     ? widget.categoryID
//                               //               //                     : catController
//                               //               //                     .subCategoryList![
//                               //               //                 catController.subCategoryIndex]
//                               //               //                     .id
//                               //               //                     .toString(),
//                               //               //                 catController.type,
//                               //               //               );
//                               //               //             } else {
//                               //               //               if (_tabController!.index == 1) {
//                               //               //                 catController.getCategoryStoreList(
//                               //               //                   catController.subCategoryIndex == 0
//                               //               //                       ? widget.categoryID
//                               //               //                       : catController
//                               //               //                       .subCategoryList![
//                               //               //                   catController.subCategoryIndex]
//                               //               //                       .id
//                               //               //                       .toString(),
//                               //               //                   1,
//                               //               //                   catController.type,
//                               //               //                   false,
//                               //               //                 );
//                               //               //               } else {
//                               //               //                 catController.getCategoryItemList(
//                               //               //                   catController.subCategoryIndex == 0
//                               //               //                       ? widget.categoryID
//                               //               //                       : catController
//                               //               //                       .subCategoryList![
//                               //               //                   catController.subCategoryIndex]
//                               //               //                       .id
//                               //               //                       .toString(),
//                               //               //                   1,
//                               //               //                   catController.type,
//                               //               //                   false,
//                               //               //                 );
//                               //               //               }
//                               //               //             }
//                               //               //           }
//                               //               //         }
//                               //               //         return false;
//                               //               //       },
//                               //               //       child: TabBarView(
//                               //               //         controller: _tabController,
//                               //               //         children: [
//                               //               //           SingleChildScrollView(
//                               //               //             controller: scrollController,
//                               //               //             child: ItemsView(
//                               //               //               isStore: false,
//                               //               //               items: item,
//                               //               //               stores: null,
//                               //               //               noDataText: 'no_category_item_found'.tr,
//                               //               //             ),
//                               //               //           ),
//                               //               //           // SingleChildScrollView(
//                               //               //           //   controller: storeScrollController,
//                               //               //           //   child: ItemsView(
//                               //               //           //     isStore: true,
//                               //               //           //     items: null,
//                               //               //           //     stores: stores,
//                               //               //           //     noDataText: Get.find<SplashController>()
//                               //               //           //             .configModel!
//                               //               //           //             .moduleConfig!
//                               //               //           //             .module!
//                               //               //           //             .showRestaurantText!
//                               //               //           //         ? 'no_category_restaurant_found'.tr
//                               //               //           //         : 'no_category_store_found'.tr,
//                               //               //           //   ),
//                               //               //           // ),
//                               //               //         ],
//                               //               //       ),
//                               //               //     )),
//                               //               // catController.isLoading
//                               //               //     ? Center(
//                               //               //     child: Padding(
//                               //               //       padding:
//                               //               //       const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                               //               //       child: CircularProgressIndicator(
//                               //               //           valueColor: AlwaysStoppedAnimation<Color>(
//                               //               //               Theme.of(context).primaryColor)),
//                               //               //     ))
//                               //               //     : const SizedBox(),
//                               //             ]),
//                               //           )),
//                               //   );
//                               // })
//
//
//                                     // Get.toNamed(
//                                     //     RouteHelper.getCategoryItemRoute(
//                                     //       categoryController
//                                     //           .categoryList![index].id,
//                                     //       categoryController
//                                     //           .categoryList![index].name!,
//                                     //     )),
//                                     // Positioned(
//                                     //   right: ltr ? 0 : null,
//                                     //   left: ltr ? null : 0,
//                                     //   child: CornerDiscountTag(
//                                     //     bannerPosition: ltr
//                                     //         ? CornerBannerPosition.topRight
//                                     //         : CornerBannerPosition.topLeft,
//                                     //     elevation: 0,
//                                     //     discount: itemController
//                                     //         .getDiscount(itemList[index]),
//                                     //     discountType: itemController
//                                     //         .getDiscountType(itemList[index]),
//                                     //   ),
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         )
//                       :
//                   PopularItemShimmer(enabled: categoryController.categoryList == null),
//                 ),
//               ],
//             );
//     });
//   }
// }
//
// class PopularItemShimmer extends StatelessWidget {
//   final bool enabled;
//
//   const PopularItemShimmer({Key? key, required this.enabled}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding:
//               const EdgeInsets.fromLTRB(2, 2, Dimensions.paddingSizeSmall, 2),
//           child: Container(
//             height: 90,
//             width: 250,
//             padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors
//                       .grey[Get.find<ThemeController>().darkTheme ? 700 : 300]!,
//                   blurRadius: 5,
//                   spreadRadius: 1,
//                 )
//               ],
//             ),
//             child: Shimmer(
//               duration: const Duration(seconds: 1),
//               interval: const Duration(seconds: 1),
//               enabled: enabled,
//               child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 80,
//                       width: 80,
//                       decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.circular(Dimensions.radiusSmall),
//                         color: Colors.grey[300],
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: Dimensions.paddingSizeExtraSmall),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                   height: 15,
//                                   width: 100,
//                                   color: Colors.grey[300]),
//                               const SizedBox(height: 5),
//                               Container(
//                                   height: 10,
//                                   width: 130,
//                                   color: Colors.grey[300]),
//                               const SizedBox(height: 5),
//                               const RatingBar(
//                                   rating: 0, size: 12, ratingCount: 0),
//                               Row(children: [
//                                 Expanded(
//                                   child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         const SizedBox(
//                                             width: Dimensions
//                                                 .paddingSizeExtraSmall),
//                                         Container(
//                                             height: 10,
//                                             width: 40,
//                                             color: Colors.grey[300]),
//                                         Container(
//                                             height: 15,
//                                             width: 40,
//                                             color: Colors.grey[300]),
//                                       ]),
//                                 ),
//                                 Container(
//                                   height: 25,
//                                   width: 25,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Theme.of(context).primaryColor),
//                                   child: const Icon(Icons.add,
//                                       size: 20, color: Colors.white),
//                                 ),
//                               ]),
//                             ]),
//                       ),
//                     ),
//                   ]),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
