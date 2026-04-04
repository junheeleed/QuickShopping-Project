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
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: ResponsiveContent(
          child: Column(
            children: [
              const _SearchHeader(),
              Container(
                height: 1,
                color: colors.brand.withValues(alpha: 0.7),
              ),
              Expanded(
                child: ResponsiveLayout.isCompact(context)
                    ? const _SearchMobileBody()
                    : const _SearchWideBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchHeader extends StatelessWidget {
  const _SearchHeader();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllerX>();
    final colors = context.colors;
    final spacing = context.spacing;
    final fields = context.fields;
    final radius = context.radius;
    final metrics = context.metrics;

    final padX = spacing.pagePaddingX;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        padX,
        spacing.itemGap,
        padX,
        spacing.sectionGap,
      ),
      child: Row(
        children: [
          SizedBox(
            width: metrics.searchIconButtonSize,
            height: metrics.searchIconButtonSize,
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
              height: metrics.searchBarHeight,
              padding:
              EdgeInsets.symmetric(horizontal: fields.horizontalPadding),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(radius.button),
                border: Border.all(color: colors.brand, width: 1.2),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: metrics.searchIconButtonSize,
                    height: metrics.searchIconButtonSize,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: radius.button,
                      onPressed: () =>
                          controller.submit(controller.textController.text),
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
                      width: metrics.searchIconButtonSize,
                      height: metrics.searchIconButtonSize,
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
    );
  }
}

class _SearchMobileBody extends StatelessWidget {
  const _SearchMobileBody();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllerX>();

    return Obx(() {
      if (controller.showRecent.value) {
        return const _RecentKeywordsPanel(compact: true);
      }

      if (!controller.showResults.value) {
        return const _EmptySearchPanel(
          title: '검색어를 입력해 주세요',
          subtitle: '상품명 또는 브랜드를 검색해 보세요.',
        );
      }

      return const _SearchResultsPanel();
    });
  }
}

class _SearchWideBody extends StatelessWidget {
  const _SearchWideBody();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final colors = context.colors;
    final controller = Get.find<SearchControllerX>();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        spacing.pagePaddingX,
        spacing.sectionGap,
        spacing.pagePaddingX,
        spacing.sectionGap,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 320,
            child: _RecentKeywordsPanel(compact: false),
          ),
          SizedBox(width: spacing.sectionGap),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colors.surface,
                border: Border.all(color: colors.border),
                borderRadius:
                BorderRadius.circular(context.radius.card),
              ),
              child: Obx(() {
                if (!controller.showResults.value) {
                  return const _EmptySearchPanel(
                    title: '검색 결과가 여기에 표시돼요',
                    subtitle: '왼쪽 최근 검색어를 누르거나 검색창에 직접 입력해 보세요.',
                  );
                }
                return const _SearchResultsPanel();
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentKeywordsPanel extends StatelessWidget {
  final bool compact;

  const _RecentKeywordsPanel({
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllerX>();
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;

    final content = Obx(() {
      final recentKeyword = controller.recentKeyword;

      final body = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '최근 검색어',
                style: context.text.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
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
      );

      if (compact) {
        return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            spacing.pagePaddingX,
            spacing.sectionGap,
            spacing.pagePaddingX,
            spacing.sectionGap * 2,
          ),
          child: body,
        );
      }

      return SingleChildScrollView(
        padding: EdgeInsets.all(spacing.cardPadding),
        child: body,
      );
    });

    if (compact) return content;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.border),
        borderRadius: BorderRadius.circular(radius.card),
      ),
      child: content,
    );
  }

  String _formatMMDD(DateTime d) {
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    return '$mm.$dd.';
  }
}

class _SearchResultsPanel extends StatelessWidget {
  const _SearchResultsPanel();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllerX>();
    final spacing = context.spacing;
    final colors = context.colors;

    return Obx(() {
      final query = controller.query.value;
      final list = controller.productResults;

      if (list.isEmpty) {
        return _EmptySearchPanel(
          title: '"$query" 검색 결과가 없어요',
          subtitle: '다른 검색어로 다시 시도해 보세요.',
        );
      }

      return ListView.separated(
        padding: EdgeInsets.fromLTRB(
          spacing.pagePaddingX,
          spacing.sectionGap,
          spacing.pagePaddingX,
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
            trailing: Icon(Icons.chevron_right, color: colors.textTertiary),
            onTap: () => Get.toNamed('${Routes.detail}/${app.id}'),
          );
        },
      );
    });
  }
}

class _EmptySearchPanel extends StatelessWidget {
  final String title;
  final String subtitle;

  const _EmptySearchPanel({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              color: colors.textTertiary,
              size: 40,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: context.text.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: context.text.bodyMedium?.copyWith(
                color: colors.textSecondary,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
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
    final circleSize = context.metrics.searchIconButtonSize;

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
              child: Icon(
                Icons.access_time,
                color: colors.textTertiary,
                size: context.metrics.smallIcon,
              ),
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
                child: Icon(
                  Icons.close,
                  color: colors.textTertiary,
                  size: context.metrics.mediumIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}