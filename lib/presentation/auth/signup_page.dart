import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/auth/auth_exceptions.dart';
import '../my/my_controller.dart';
import '../responsive/responsive.dart';
import '../theme/theme_x.dart';
import 'auth_validators.dart';

class SignupResult {
  final String email;
  final String password;

  const SignupResult({
    required this.email,
    required this.password,
  });
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _email = TextEditingController();
  final _pw = TextEditingController();
  final _pwCheck = TextEditingController();

  bool _obscure = true;
  bool _obscureCheck = true;

  String? _emailError;
  String? _pwError;
  String? _pwCheckError;

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
        title: Text('회원가입', style: context.text.titleLarge),
      ),
      body: SafeArea(
        child: ResponsiveContent(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  spacing.pagePaddingX,
                  spacing.itemGap,
                  spacing.pagePaddingX,
                  spacing.sectionGap,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxFormWidth),
                    child: Container(
                      padding: EdgeInsets.all(spacing.cardPadding),
                      color: colors.surface,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '간단 회원가입',
                            style: context.text.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: spacing.itemGap),
                          Text(
                            '가입 후 로그인 화면으로 돌아갑니다.',
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
                            textInputAction: TextInputAction.next,
                            errorText: _pwError,
                            helperText: '8자 이상 · 영문/숫자 포함',
                            onChanged: (_) => _clearPwError(),
                          ),
                          SizedBox(height: spacing.sectionGap),
                          _ThemedPasswordField(
                            controller: _pwCheck,
                            hint: '비밀번호 확인',
                            icon: Icons.lock_outline,
                            obscure: _obscureCheck,
                            onToggle: () =>
                                setState(() => _obscureCheck = !_obscureCheck),
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _submit(),
                            errorText: _pwCheckError,
                            onChanged: (_) => _clearPwCheckError(),
                          ),
                          SizedBox(height: spacing.sectionGap * 1.5),
                          SizedBox(
                            width: double.infinity,
                            height: context.fields.height,
                            child: ElevatedButton(
                              onPressed: _submit,
                              child: Text(
                                '가입하기',
                                style: context.text.labelLarge?.copyWith(
                                  color: colors.brandOn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void _clearPwCheckError() {
    if (_pwCheckError != null) setState(() => _pwCheckError = null);
  }

  Future<void> _submit() async {
    final email = _email.text.trim();
    final pw = _pw.text.trim();
    final pwCheck = _pwCheck.text.trim();

    String? emailErr;
    String? pwErr;
    String? pwCheckErr;

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

    if (pwCheck.isEmpty) {
      pwCheckErr = '비밀번호 확인을 입력해 주세요.';
    } else if (pw != pwCheck) {
      pwCheckErr = '비밀번호가 일치하지 않습니다.';
    }

    if (emailErr != null || pwErr != null || pwCheckErr != null) {
      setState(() {
        _emailError = emailErr;
        _pwError = pwErr;
        _pwCheckError = pwCheckErr;
      });
      return;
    }

    try {
      await Get.find<MyController>().signup(email: email, password: pw);
      Get.back(result: SignupResult(email: email, password: pw));
    } on SignupFailureException catch (ex) {
      if (ex.reason == SignupFailureReason.emailAlreadyExists) {
        setState(() {
          _emailError = '이미 등록된 이메일입니다.';
        });
        return;
      }

      Get.snackbar(
        '회원가입 실패',
        '회원가입에 실패했습니다.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (_) {
      Get.snackbar(
        '회원가입 실패',
        '잠시 후 다시 시도해 주세요.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _pw.dispose();
    _pwCheck.dispose();
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