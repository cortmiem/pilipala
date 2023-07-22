import 'package:flutter/material.dart';
import 'package:pilipala/common/constants.dart';

class ActionRowItem extends StatelessWidget {
  Icon? icon;
  Icon? selectIcon;
  Function? onTap;
  bool? loadingStatus;
  String? text;
  bool selectStatus = false;

  ActionRowItem({
    Key? key,
    this.icon,
    this.selectIcon,
    this.onTap,
    this.loadingStatus,
    this.text,
    required this.selectStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selectStatus
          ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)
          : Theme.of(context).highlightColor.withOpacity(0.2),
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onTap!(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13, 6.5, 15, 6.3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon!.icon!,
                    size: 13,
                    color: selectStatus
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSecondaryContainer),
                const SizedBox(width: 6),
              ],
              AnimatedOpacity(
                opacity: loadingStatus! ? 0 : 1,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  text ?? '',
                  style: TextStyle(
                      color: selectStatus
                          ? Theme.of(context).colorScheme.primary
                          : null,
                      fontSize:
                          Theme.of(context).textTheme.labelMedium?.fontSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
