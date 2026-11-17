import 'package:flutter/material.dart';

class IngredientCard extends StatefulWidget {
  const IngredientCard({
    super.key,
    required this.name,
    this.initiallyChecked = false,
    this.evenRow = true,
    this.showCheckbox = true,
    required this.onChecked,
  });

  final String name;
  final bool initiallyChecked;
  final bool evenRow;
  final bool showCheckbox;
  final ValueChanged<bool> onChecked;

  @override
  State<IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends State<IngredientCard> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    // Lấy trạng thái đánh dấu ban đầu.
    isChecked = widget.initiallyChecked;
  }

  void updateChecked(bool? newValue) {
    if (newValue == null) return;

    // Cập nhật trạng thái và báo Flutter vẽ lại giao diện.
    setState(() {
      isChecked = newValue;
    });

    // Gửi trạng thái mới cho Widget cha.
    widget.onChecked(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final rowColor = widget.evenRow
        ? colors.secondaryContainer
        : colors.surfaceContainer;
    final nameColor = widget.evenRow
        ? colors.onSecondaryContainer
        : colors.onSurface;

    return Material(
      color: rowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: widget.evenRow ? colors.outlineVariant : colors.outline,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 18,
                  color: nameColor,
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
            if (widget.showCheckbox)
              Checkbox(
                value: isChecked,
                onChanged: updateChecked,
                semanticLabel: widget.name,
              ),
          ],
        ),
      ),
    );
  }
}
