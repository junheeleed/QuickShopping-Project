import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../responsive/responsive.dart';
import '../root/root_controller.dart';
import '../theme/theme_x.dart';
import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllerX>();
    final colors = context.colors;
    final spacing = context.spacing;
    final fields = context.fields;
    final radius = context.radius;

    final padX = spacing.pagePaddingX;

    final searchBarHeight = ResponsiveLayout.isCompact(context) ? 45.0 : 52.0;
    final backBtnSize = ResponsiveLayout.isCompact(context) ? 35.0 : 38.0;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: ResponsiveContent(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  padX,
                  spacing.itemGap,
                  padX,
                  spacing.sectionGap,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: backBtnSize,
                      height: backBtnSize,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: radius.button,
                        onPressed: () {
                          if (Get.isRegistered<RootController>()) {
                            Get.find<RootController>().changeTab(0);
                          } else {
                            Navigator.of(context).maybePop();
                          }
                        },
                        icon: Icon(Icons.arrow_back, color: colors.textPrimary),
                      ),
                    ),
                    SizedBox(width: spacing.sectionGap),

                    Expanded(
                      child: Container(
                        height: searchBarHeight,
                        padding: EdgeInsets.symmetric(horizontal: fields.horizontalPadding),
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.circular(radius.button),
                          border: Border.all(color: colors.brand, width: 1.2),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: backBtnSize,
                              height: backBtnSize,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                splashRadius: radius.button,
                                onPressed: () => controller.submit(controller.textController.text),
                                icon: Icon(Icons.search, color: colors.textSecondary),
                              ),
                            ),
                            SizedBox(width: spacing.itemGap),

                            Expanded(
                              child: TextField(
                                controller: controller.textController,
                                focusNode: controller.focusNode,
                                onChanged: controller.onTextChanged,
                                textInputAction: TextInputAction.search,
                                onSubmitted: controller.submit,
                                maxLines: 1,
                                style: context.text.bodyMedium,
                                decoration: InputDecoration(
                                  hintText: '상품명 또는 브랜드 입력',
                                  border: InputBorder.none,
                                  isDense: true,
                                  hintStyle: context.text.bodyMedium?.copyWith(
                                    color: colors.textTertiary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            Obx(() {
                              final hasText = controller.query.value.isNotEmpty;
                              if (!hasText) return const SizedBox.shrink();

                              return SizedBox(
                                width: backBtnSize,
                                height: backBtnSize,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  splashRadius: radius.button,
                                  onPressed: controller.clearText,
                                  icon: Icon(Icons.close, color: colors.textTertiary),
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

              Container(height: 1, color: colors.brand.withValues(alpha: 0.7)),
              Expanded(
                child: Obx(() {
                  if (controller.showRecent.value) {
                    final recentKeyword = controller.recentKeyword;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          padX,
                          spacing.sectionGap,
                          padX,
                          spacing.sectionGap * 2,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '최근 검색어',
                                  style: context.text.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w900
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: controller.clearAll,
                                  child: Text(
                                    '전체삭제',
                                    style: context.text.bodyMedium?.copyWith(
                                      color: colors.textSecondary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            if (recentKeyword.isEmpty)
                              Padding(
                                padding: EdgeInsets.only(top: spacing.sectionGap * 2),
                                child: Text(
                                  '최근 검색어가 없어요',
                                  style: context.text.bodyMedium?.copyWith(
                                    color: colors.textSecondary,
                                    fontWeight: FontWeight.w700,
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
                        style: context.text.bodyMedium?.copyWith(
                          color: colors.textSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  }

                  final query = controller.query.value;
                  final list = controller.productResults;

                  return ListView.separated(
                    padding: EdgeInsets.fromLTRB(
                      padX,
                      spacing.sectionGap,
                      padX,
                      spacing.sectionGap * 2,
                    ),
                    itemCount: list.length + 1,
                    separatorBuilder: (_, __) => Divider(
                      height: spacing.sectionGap * 2,
                      color: colors.divider,
                    ),
                    itemBuilder: (_, i) {
                      if (i == 0) {
                        return Text(
                          '검색 결과 "$query"',
                          style: context.text.titleMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        );
                      }

                      final app = list[i - 1];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.local_mall_outlined, color: colors.textPrimary),
                        title: Text(
                          app.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: colors.textPrimary,
                          ),
                        ),
                        subtitle: Text(
                          app.shortDesc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colors.textSecondary,
                          ),
                        ),
                        onTap: () => Get.toNamed('${Routes.detail}/${app.id}'),
                        trailing: Icon(Icons.chevron_right, color: colors.textTertiary),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
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
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;

    final circleSize = ResponsiveLayout.isCompact(context) ? 35.0 : 40.0;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: spacing.sectionGap),
        child: Row(
          children: [
            Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                color: colors.surfaceAlt,
                shape: BoxShape.circle,
                border: Border.all(color: colors.border),
              ),
              child: Icon(Icons.access_time, color: colors.textTertiary, size: 18),
            ),
            SizedBox(width: spacing.cardPadding),

            Expanded(
              child: Text(
                keyword,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.textPrimary,
                ),
              ),
            ),

            SizedBox(width: spacing.itemGap),
            Text(
              dateText,
              style: context.text.bodyMedium?.copyWith(
                color: colors.textTertiary,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(width: spacing.itemGap),
            InkWell(
              borderRadius: BorderRadius.circular(radius.button),
              onTap: onRemove,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(Icons.close, color: colors.textTertiary, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}