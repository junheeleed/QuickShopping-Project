import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/domain/usecases/watch_recent_keywords.dart';

import '../../domain/usecases/clear_recent_keyword.dart';
import '../../domain/usecases/delete_recent_keyword.dart';
import '../../domain/usecases/insert_recent_keyword.dart';
import '../../domain/usecases/watch_search.dart';

class RecentKeyword {
  final String keyword;
  final DateTime date;
  RecentKeyword({required this.keyword, required this.date});
}

class ProductResult {
  final int id;
  final String name;
  final String shortDesc;
  final String? imageUrl;
  final int price;
  final int shippingFee;

  ProductResult({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.imageUrl,
    required this.price,
    required this.shippingFee,
  });
}

class SearchControllerX extends GetxController {
  SearchControllerX({
    required this.watchRecentKeywords,
    required this.insertRecentKeyword,
    required this.deleteRecentKeyword,
    required this.clearRecentKeyword,
    required this.watchSearch,
  });

  final WatchRecentKeywords watchRecentKeywords;
  final InsertRecentKeyword insertRecentKeyword;
  final DeleteRecentKeyword deleteRecentKeyword;
  final ClearRecentKeyword clearRecentKeyword;
  final WatchSearch watchSearch;

  // TODO TextFieldController이게 Controller에 있는게 구조상 맞는건지 ChatGpt한테 물어보기
  final textController = TextEditingController();
  final focusNode = FocusNode();

  final recentKeyword = <RecentKeyword>[].obs;
  final expanded = false.obs;

  final showRecent = true.obs;
  final showResults = false.obs;
  final query = ''.obs;
  final productResults = <ProductResult>[].obs;
  final searching = false.obs;

  StreamSubscription? _recentSub;
  StreamSubscription? _resultSub;

  @override
  void onInit() {
    super.onInit();
    _recentSub = watchRecentKeywords().listen((list) {
      recentKeyword.assignAll(
        list.map((e) => RecentKeyword(keyword: e.keyword, date: e.date)),
      );
    });

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showRecent.value = true;
      } else {
        if (showResults.value) showRecent.value = false;
      }
    });
  }

  void onTextChanged(String text) {
    query.value = text.trim();
    if (query.value.isEmpty) {
      showResults.value = false;
      productResults.clear();
      if (focusNode.hasFocus) showRecent.value = true;
    }
  }

  Future<void> submit(String text) async {
    final q = text.trim();
    if (q.isEmpty) return;

    query.value = q;
    await insertRecentKeyword(q);

    showResults.value = true;
    showRecent.value = false;

    focusNode.unfocus();

    _resultSub?.cancel();
    _resultSub = watchSearch(q).listen((list) {
      productResults.assignAll(
        list.map((a) => ProductResult(
          id: a.id,
          name: a.name,
          shortDesc: a.shortDesc,
          imageUrl: a.imageUrl,
          price: a.price ?? 0,
          shippingFee: a.shippingFee ?? 0,
        )),
      );
      searching.value = false;
    });
  }

  void clearText() {
    textController.clear();
    query.value = '';
    showResults.value = false;
    productResults.clear();

    focusNode.requestFocus();
    showRecent.value = true;
  }

  Future<void> removeKeyword(String keyword) => deleteRecentKeyword(keyword);
  Future<void> clearAll() => clearRecentKeyword();

  void toggleExpanded() => expanded.value = !expanded.value;

  @override
  void onClose() {
    _recentSub?.cancel();
    _resultSub?.cancel();
    textController.dispose();
    super.onClose();
  }
}
