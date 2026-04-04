import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../domain/auth/auth_exceptions.dart';
import '../my/my_controller.dart';
import '../responsive/responsive.dart';
import '../theme/theme_x.dart';
import 'auth_validators.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _pw = TextEditingController();

  bool _obscure = true;

  String? _emailError;
  String? _pwError;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final spacing = context.spacing;
    final radius = context.radius;

    final maxFormWidth =
    ResponsiveLayout.isCompact(context) ? double.infinity : 460.0;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: Text('로그인', style: context.text.titleLarge),
      ),
      body: SafeArea(
        child: ResponsiveContent(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  spacing.pagePaddingX,
                  spacing.itemGap,
                  spacing.pagePaddingX,
                  spacing.sectionGap,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxFormWidth),
                  child: Container(
                    padding: EdgeInsets.all(spacing.cardPadding),
                    color: colors.surface,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '퀵쇼핑을 더 편리하게',
                                  style: context.text.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: spacing.itemGap),
                                Text(
                                  '로그인하고 주문/배송, 찜, 최근 본 상품을 확인하세요.',
                                  style: context.text.bodyMedium?.copyWith(
                                    color: colors.textSecondary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: spacing.sectionGap * 2),
                                _ThemedField(
                                  controller: _email,
                                  hint: '이메일',
                                  icon: Icons.mail_outline,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  errorText: _emailError,
                                  onChanged: (_) => _clearEmailError(),
                                ),
                                SizedBox(height: spacing.sectionGap),
                                _ThemedPasswordField(
                                  controller: _pw,
                                  hint: '비밀번호',
                                  icon: Icons.lock_outline,
                                  obscure: _obscure,
                                  onToggle: () => setState(() => _obscure = !_obscure),
                                  textInputAction: TextInputAction.done,
                                  onSubmitted: (_) => _submit(),
                                  errorText: _pwError,
                                  helperText: '8자 이상 · 영문/숫자 포함',
                                  onChanged: (_) => _clearPwError(),
                                ),
                                SizedBox(height: spacing.sectionGap * 1.5),
                                SizedBox(
                                  width: double.infinity,
                                  height: context.fields.height,
                                  child: ElevatedButton(
                                    onPressed: _submit,
                                    child: Text(
                                      '로그인',
                                      style: context.text.labelLarge?.copyWith(
                                        color: colors.brandOn,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: spacing.sectionGap * 2),
                        Center(
                          child: GestureDetector(
                            onTap: _goSignup,
                            child: Text(
                              '회원가입',
                              style: context.text.labelLarge?.copyWith(
                                color: colors.brand,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacing.itemGap),
                        Center(
                          child: Text(
                            '회원가입 후 로그인해 주세요.',
                            style: context.text.bodySmall?.copyWith(
                              color: colors.textTertiary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _clearEmailError() {
    if (_emailError != null) setState(() => _emailError = null);
  }

  void _clearPwError() {
    if (_pwError != null) setState(() => _pwError = null);
  }

  Future<void> _submit() async {
    final email = _email.text.trim();
    final pw = _pw.text.trim();

    String? emailErr;
    String? pwErr;

    if (email.isEmpty) {
      emailErr = '이메일을 입력해 주세요.';
    } else if (!isValidEmail(email)) {
      emailErr = '이메일 형식에 맞게 입력해 주세요.';
    }

    if (pw.isEmpty) {
      pwErr = '비밀번호를 입력해 주세요.';
    } else if (!isStrongPassword(pw)) {
      pwErr = '비밀번호는 8자 이상, 영문/숫자를 포함해 주세요.';
    }

    if (emailErr != null || pwErr != null) {
      setState(() {
        _emailError = emailErr;
        _pwError = pwErr;
      });
      return;
    }

    try {
      await Get.find<MyController>().loginUser(email: email, password: pw);
      Get.back();
    } on LoginFailureException catch (ex) {
      final msg = (ex.reason == LoginFailureReason.emailNotFound)
          ? '이메일이 틀렸습니다'
          : '비밀번호가 틀렸습니다';
      Get.snackbar('로그인 실패', msg, snackPosition: SnackPosition.BOTTOM);
    } catch (_) {
      Get.snackbar(
        '로그인 실패',
        '잠시 후 다시 시도해 주세요.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _goSignup() async {
    final result = await Get.toNamed(Routes.signup);
    if (result is SignupResult) {
      _email.text = result.email;
      _pw.text = result.password;
      setState(() {
        _emailError = null;
        _pwError = null;
      });
      Get.snackbar(
        '회원가입 완료',
        '로그인을 진행해 주세요.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _pw.dispose();
    super.dispose();
  }
}

class _ThemedField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const _ThemedField({
    required this.controller,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.textInputAction,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fields = context.fields;
    final spacing = context.spacing;
    final metrics = context.metrics;

    final showError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: fields.height,
          padding: EdgeInsets.symmetric(horizontal: fields.horizontalPadding),
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border.all(
              color: showError ? colors.error : colors.border,
              width: fields.borderWidth,
            ),
            borderRadius: BorderRadius.circular(fields.radius),
          ),
          child: Row(
            children: [
              Icon(icon, size: metrics.smallIcon, color: colors.textSecondary),
              SizedBox(width: spacing.itemGap),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  onChanged: onChanged,
                  style: context.text.bodyMedium,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    hintStyle: context.text.bodyMedium?.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showError) ...[
          SizedBox(height: spacing.itemGap),
          Text(
            errorText!,
            style: context.text.bodySmall?.copyWith(
              color: colors.error,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ],
    );
  }
}

class _ThemedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;
  final VoidCallback onToggle;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final String? errorText;
  final String? helperText;
  final ValueChanged<String>? onChanged;

  const _ThemedPasswordField({
    required this.controller,
    required this.hint,
    required this.icon,
    required this.obscure,
    required this.onToggle,
    this.textInputAction,
    this.onSubmitted,
    this.errorText,
    this.helperText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fields = context.fields;
    final spacing = context.spacing;
    final metrics = context.metrics;

    final showError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: fields.height,
          padding: EdgeInsets.symmetric(horizontal: fields.horizontalPadding),
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border.all(
              color: showError ? colors.error : colors.border,
              width: fields.borderWidth,
            ),
            borderRadius: BorderRadius.circular(fields.radius),
          ),
          child: Row(
            children: [
              Icon(icon, size: metrics.smallIcon, color: colors.textSecondary),
              SizedBox(width: spacing.itemGap),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscure,
                  textInputAction: textInputAction,
                  onSubmitted: onSubmitted,
                  onChanged: onChanged,
                  style: context.text.bodyMedium,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    hintStyle: context.text.bodyMedium?.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: onToggle,
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: colors.textTertiary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing.itemGap),
        if (showError)
          Text(
            errorText!,
            style: context.text.bodySmall?.copyWith(
              color: colors.error,
              fontWeight: FontWeight.w800,
            ),
          )
        else if (helperText != null)
          Text(
            helperText!,
            style: context.text.bodySmall?.copyWith(
              color: colors.textTertiary,
              fontWeight: FontWeight.w800,
            ),
          ),
      ],
    );
  }
}