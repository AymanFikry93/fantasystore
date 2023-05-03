import 'package:fantasy_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.isSecured = false,
    this.isEnabled = true,
    this.hasSuffixSecurityIcon = false,
    this.title,
    this.textInputType,
    this.errorMessage,
    this.inputFormatters,
    this.onChange,
    this.onEditingComplete,
    this.onTap,
    this.minLines,
    this.textFocusNode,
    this.centerTitle = false,
    this.textAlign,
    this.padding,
    this.textInputAction,
  }) : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isSecured;
  final bool isEnabled;
  final bool hasSuffixSecurityIcon;
  final String? title;
  final TextInputType? textInputType;
  final String? errorMessage;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChange;
  final Function? onEditingComplete;
  final Function? onTap;
  final int? minLines;
  final FocusNode? textFocusNode;
  final bool centerTitle;
  final TextAlign? textAlign;
  final _securityProvider = StateProvider<bool>((ref) {
    return true;
  });
  final EdgeInsets? padding;
  final TextInputAction? textInputAction;
  final tapTextFieldProvider = StateProvider<bool>((ref) {
    return false;
  });

  @override
  Widget build(BuildContext context) {
    // FocusNode _textFieldFocus = FocusNode();

    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment:
          centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title ?? '',
            style: textTheme.headlineSmall?.copyWith(color: AppColors.textFieldTitleColor),
          ),
        const SizedBox(
          height: 8,
        ),
        Consumer(
          builder: (_, ref, __) {
            final tapTextField = ref.watch(tapTextFieldProvider);
            return TextFormField(
              textAlignVertical: TextAlignVertical.center,
              onTap: () {
                if (controller?.selection ==
                    TextSelection.fromPosition(TextPosition(
                        offset: (controller?.text.length ?? 1) - 1))) {
                  controller?.selection = TextSelection.fromPosition(
                      TextPosition(offset: controller?.text.length ?? 0));
                  context.read(tapTextFieldProvider.notifier).state =
                      !context.read(tapTextFieldProvider.notifier).state;
                }
                if (onTap != null) {
                  onTap!();
                }
              },
              enabled: isEnabled,
              maxLines: isSecured ? 1 : minLines,
              focusNode: textFocusNode,
              // ?? _textFieldFocus,
              textAlign: textAlign ?? TextAlign.right,
              controller: controller,
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                prefixIconConstraints: const BoxConstraints(maxHeight: 45, minWidth: 30),
                suffixIconConstraints: const BoxConstraints(maxHeight: 45, minWidth: 30),
                isCollapsed: true,
                hintText: hintText,
                errorText: errorMessage,
                errorMaxLines: 2,
                suffixIcon: isSecured && hasSuffixSecurityIcon
                    ? InkWell(
                        child: _getSuffixSecurityIcon(isSecured),
                        onTap: () {
                          ref.read(_securityProvider.notifier).state =
                              !isSecured;
                        },
                      )
                    : suffixIcon,
                prefixIcon: prefixIcon,
                contentPadding: padding,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    width: 1.5,
                    color:  AppColors.primaryColor,
                  ),
                ),
              ),
              obscureText: isSecured,
              keyboardType: textInputType ?? TextInputType.text,
              inputFormatters: inputFormatters,
              onChanged: (value) {
                if (onChange != null) {
                  onChange!.call(value);
                }
              },
              onEditingComplete: () {
                if (onEditingComplete != null) {
                  onEditingComplete!();
                }
              },
              textInputAction: textInputAction ?? TextInputAction.next,
              style: Theme.of(context).textTheme.headlineSmall,
            );
          },
        ),
      ],
    );
  }

  Widget? _getSuffixSecurityIcon(bool isSecured) {
    if (isSecured) {
      return const Icon(
        Icons.remove_red_eye,
      );
    } else {
      return const Icon(
        Icons.remove_red_eye_outlined,
      );
    }
  }
}
