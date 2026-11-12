import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rayyan_driver/core/theme/app_spacing.dart';
import 'package:rayyan_driver/core/theme/theme_context_x.dart';
import 'package:rayyan_driver/core/widgets/inputs/outlined_field_box.dart';

/// One box per digit, "-" when empty, a cursor in the next box. Always
/// left-to-right. A hidden text field takes the keyboard and SMS autofill;
/// [value] drives it, so clearing the code from the outside clears the
/// boxes. Owns its controller and focus node only (no setState).
class OtpInput extends StatefulWidget {
  const OtpInput({
    required this.length,
    required this.value,
    required this.onChanged,
    required this.semanticLabel,
    this.onSubmitted,
    this.autofocus = true,
    super.key,
  });

  final int length;
  final String value;
  final ValueChanged<String> onChanged;
  final VoidCallback? onSubmitted;
  final String semanticLabel;
  final bool autofocus;

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value,
  );
  final FocusNode _focusNode = FocusNode();

  @override
  void didUpdateWidget(OtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(offset: widget.value.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0,
              alwaysIncludeSemantics: true,
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                autofocus: widget.autofocus,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.oneTimeCode],
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(widget.length),
                ],
                showCursor: false,
                enableInteractiveSelection: false,
                onChanged: widget.onChanged,
                onSubmitted: (_) => widget.onSubmitted?.call(),
                decoration: OutlinedFieldBox.bareDecoration(
                  hintText: widget.semanticLabel,
                ),
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _focusNode.requestFocus,
            child: ExcludeSemantics(
              child: ListenableBuilder(
                listenable: Listenable.merge([_controller, _focusNode]),
                builder: (context, _) => _Boxes(
                  length: widget.length,
                  code: _controller.text,
                  hasFocus: _focusNode.hasFocus,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Boxes extends StatelessWidget {
  const _Boxes({
    required this.length,
    required this.code,
    required this.hasFocus,
  });

  final int length;
  final String code;
  final bool hasFocus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < length; i++) ...[
          if (i > 0) const SizedBox(width: AppSpacing.s3),
          Expanded(
            child: OutlinedFieldBox(
              child: Center(
                child: i < code.length
                    ? _Glyph(code[i])
                    : hasFocus && i == code.length
                    ? const _Cursor()
                    : const _Glyph('-', isPlaceholder: true),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _Glyph extends StatelessWidget {
  const _Glyph(this.text, {this.isPlaceholder = false});

  final String text;
  final bool isPlaceholder;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      text,
      style: context.textStyles.fieldText.copyWith(
        color: isPlaceholder ? colors.textMuted : colors.textPrimary,
      ),
    );
  }
}

class _Cursor extends StatelessWidget {
  const _Cursor();

  static const double _width = 1.5;
  static const double _height = 18;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: ColoredBox(color: context.colors.textPrimary),
    );
  }
}
