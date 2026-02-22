import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../root/root_controller.dart';
import 'search_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static const _purple = Color(0xFF7B61FF);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchControllerX>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {
                        if (Get.isRegistered<RootController>()) {
                          Get.find<RootController>().changeTab(0);
                        } else {
                          Navigator.of(context).maybePop();
                        }
                      },
                      icon: const Icon(Icons.arrow_back, size: 26),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: _purple, width: 1.2),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              splashRadius: 20,
                              onPressed: () => controller.submit(controller.textController.text),
                              icon: const Icon(Icons.search, color: Colors.black54),
                            ),
                          ),
                          const SizedBox(width: 8),
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
                            if (!hasText) return const SizedBox(width: 4);

                            return SizedBox(
                              width: 40,
                              height: 40,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                splashRadius: 20,
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
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '최근 검색어',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: controller.clearAll,
                                child: const Text(
                                  '전체삭제',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          if (recentKeyword.isEmpty)
                            const Padding(
                              padding: EdgeInsets.only(top: 24),
                              child: Text(
                                '최근 검색어가 없어요',
                                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
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
                  return const Center(
                    child: Text(
                      '검색어를 입력해 주세요',
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700),
                    ),
                  );
                }

                final query = controller.query.value;
                final list = controller.productResults;

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                  itemCount: list.length + 1,
                  separatorBuilder: (_, __) => const Divider(height: 24, color: Color(0xFFEDEDED)),
                  itemBuilder: (_, i) {
                    if (i == 0) {
                      return Text(
                        '검색 결과 "$query"',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                      );
                    }
                    final app = list[i - 1];
                    return ListTile(
                      leading: const Icon(Icons.local_mall_outlined),
                      title: Text(app.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(app.shortDesc, maxLines: 1, overflow: TextOverflow.ellipsis),
                      onTap: () => Get.toNamed('${Routes.detail}/${app.id}'),
                      trailing: const Icon(Icons.chevron_right),
                    );
                  },
                );
              }),
            ),
          ],
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
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Color(0xFFF3F3F3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.access_time, color: Colors.black45),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                keyword,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              dateText,
              style: const TextStyle(fontSize: 22, color: Colors.black38, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: onRemove,
              child: const Icon(Icons.close, color: Colors.black38, size: 26),
            ),
          ],
        ),
      ),
    );
  }
}
