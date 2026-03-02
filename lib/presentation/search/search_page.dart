import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shopping/presentation/responsive/responsive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/routes/app_routes.dart';
import '../root/root_controller.dart';
import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const _purple = Color(0xFF7B61FF);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllerX>();
    final isCompact = ResponsiveLayout.isCompact(context);
    final pagePadding = ResponsiveLayout.pagePadding(context);
    final iconSize = isCompact ? 22.w : 24.w;
    final textSize = ResponsiveLayout.textSize(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ResponsiveContent(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(pagePadding.w, 8.h, pagePadding.w, 12.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        height: 40.w,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          splashRadius: 20.r,
                          onPressed: () {
                            if (Get.isRegistered<RootController>()) {
                              Get.find<RootController>().changeTab(0);
                            } else {
                              Navigator.of(context).maybePop();
                            }
                          },
                          icon: Icon(Icons.arrow_back, size: isCompact ? 26.w : 28.w),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          height: isCompact ? 48.w : 50.w,
                          padding: EdgeInsets.symmetric(horizontal: 12.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(color: _purple, width: 1.2.w),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 40.w,
                                height: 40.w,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  splashRadius: 20.r,
                                  onPressed: () => controller.submit(controller.textController.text),
                                  icon: const Icon(Icons.search, color: Colors.black54),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: TextField(
                                  controller: controller.textController,
                                  focusNode: controller.focusNode,
                                  onChanged: controller.onTextChanged,
                                  textInputAction: TextInputAction.search,
                                  onSubmitted: controller.submit,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                    hintText: '상품명 또는 브랜드 입력',
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                ),
                              ),
                              Obx(() {
                                final hasText = controller.query.value.isNotEmpty;
                                if (!hasText) return SizedBox(width: 4.w);

                                return SizedBox(
                                  width: 40.w,
                                  height: 40.w,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    splashRadius: 20.r,
                                    onPressed: controller.clearText,
                                    icon: const Icon(Icons.close, color: Colors.black45),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 1, color: _purple.withOpacity(0.7)),
                Expanded(
                  child: Obx(() {
                    if (controller.showRecent.value) {
                      final recentKeyword = controller.recentKeyword;
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 24.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '최근 검색어',
                                    style: TextStyle(
                                        fontSize: isCompact ? 20.sp : 22.sp,
                                        fontWeight: FontWeight.w900
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: controller.clearAll,
                                    child: Text(
                                      '전체삭제',
                                      style: TextStyle(
                                        fontSize: isCompact ? 16.sp : 18.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14.h),

                              if (recentKeyword.isEmpty)
                                Padding(
                                  padding: EdgeInsets.only(top: 24.h),
                                  child: Text(
                                    '최근 검색어가 없어요',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w700,
                                        fontSize: textSize
                                    ),
                                  ),
                                )
                              else
                                ...recentKeyword.map((item) {
                                  return _RecentRow(
                                    keyword: item.keyword,
                                    dateText: _formatMMDD(item.date),
                                    onTap: () {
                                      controller.textController.text = item.keyword;
                                      controller.submit(item.keyword);
                                    },
                                    onRemove: () => controller.removeKeyword(item.keyword),
                                  );
                                }),
                            ],
                          ),
                        ),
                      );
                    }

                    if (!controller.showResults.value) {
                      return Center(
                        child: Text(
                          '검색어를 입력해 주세요',
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: textSize
                          ),
                        ),
                      );
                    }

                    final query = controller.query.value;
                    final list = controller.productResults;

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 24.h),
                      itemCount: list.length + 1,
                      separatorBuilder: (_, __) => Divider(height: 24.h, color: Color(0xFFEDEDED)),
                      itemBuilder: (_, i) {
                        if (i == 0) {
                          return Text(
                            '검색 결과 "$query"',
                            style: TextStyle(
                                fontSize: isCompact ? 20.sp : 22.sp,
                                fontWeight: FontWeight.w900
                            ),
                          );
                        }
                        final app = list[i - 1];
                        return ListTile(
                          leading: const Icon(Icons.local_mall_outlined),
                          title: Text(
                            app.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: textSize
                            ),
                          ),
                          subtitle: Text(
                            app.shortDesc,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: textSize
                            ),
                          ),
                          onTap: () => Get.toNamed('${Routes.detail}/${app.id}'),
                          trailing: Icon(
                            Icons.chevron_right,
                            size: iconSize,
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
        )
      ),
    );
  }

  String _formatMMDD(DateTime d) {
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    return '$mm.$dd.';
  }
}

class _RecentRow extends StatelessWidget {
  final String keyword;
  final String dateText;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _RecentRow({
    required this.keyword,
    required this.dateText,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final isCompact = ResponsiveLayout.isCompact(context);
    final iconSize = isCompact ? 22.w : 24.w;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: const BoxDecoration(
                color: Color(0xFFF3F3F3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                  Icons.access_time,
                  color: Colors.black45,
                size: iconSize,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                keyword,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: isCompact ? 22.sp : 24.sp,
                    fontWeight: FontWeight.w900
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              dateText,
              style: TextStyle(
                  fontSize: isCompact ? 22.sp : 24.sp,
                  color: Colors.black38,
                  fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: onRemove,
              child: Icon(
                  Icons.close,
                  color: Colors.black38,
                  size: isCompact ? 26.sp : 28.sp
              ),
            ),
          ],
        ),
      ),
    );
  }
}
