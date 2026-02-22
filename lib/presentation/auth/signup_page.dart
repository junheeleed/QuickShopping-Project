import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/auth/auth_exceptions.dart';
import '../my/my_controller.dart';
import 'auth_validators.dart';

class SignupResult {
  final String email;
  final String password;
  const SignupResult({required this.email, required this.password});
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  static const _purple = Color(0xFF7B61FF);

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        title: const Text('회원가입',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('간단 회원가입',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
              const SizedBox(height: 6),
              const Text('가입 후 로그인 화면으로 돌아갑니다.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 24),

              _Field(
                controller: _email,
                hint: '이메일',
                icon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorText: _emailError,
                onChanged: (_) => _clearEmailError(),
              ),
              const SizedBox(height: 12),

              _PasswordField(
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
              const SizedBox(height: 12),

              _PasswordField(
                controller: _pwCheck,
                hint: '비밀번호 확인',
                icon: Icons.lock_outline,
                obscure: _obscureCheck,
                onToggle: () => setState(() => _obscureCheck = !_obscureCheck),
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
                errorText: _pwCheckError,
                onChanged: (_) => _clearPwCheckError(),
              ),
              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: _submit,
                  child: const Text('가입하기',
                      style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                ),
              ),

              const Spacer(),
            ],
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
      Get.snackbar('회원가입 실패', '회원가입에 실패했습니다.',
          snackPosition: SnackPosition.BOTTOM);
    } catch (_) {
      Get.snackbar('회원가입 실패', '잠시 후 다시 시도해 주세요.',
          snackPosition: SnackPosition.BOTTOM);
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

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const _Field({
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
    final showError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            border: Border.all(
              color: showError ? const Color(0xFFE14B4B) : const Color(0xFFE7E7E7),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showError) ...[
          const SizedBox(height: 6),
          Text(
            errorText!,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFE14B4B),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
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

  const _PasswordField({
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
    final showError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            border: Border.all(
              color: showError ? const Color(0xFFE14B4B) : const Color(0xFFE7E7E7),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: obscure,
                  textInputAction: textInputAction,
                  onSubmitted: onSubmitted,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              IconButton(
                onPressed: onToggle,
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        if (showError)
          Text(
            errorText!,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFE14B4B),
              fontWeight: FontWeight.w800,
            ),
          )
        else if (helperText != null)
          Text(
            helperText!,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black38,
              fontWeight: FontWeight.w800,
            ),
          ),
      ],
    );
  }
}
