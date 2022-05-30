import '../core/styles/style.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
    this.title,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.onBack,
    this.actions = const [],
    this.elevation = 1,
    this.background,
    this.titleBuilder,
  }) : super(key: key);
  final String? title;
  final Widget? leading;
  final bool automaticallyImplyLeading, centerTitle;
  final VoidCallback? onBack;
  final List<Widget> actions;
  final double elevation;
  final Color? background;
  final Widget Function(String)? titleBuilder;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: context.primary),
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: titleBuilder == null
          ? (title ?? '')
              .text
              .size(15)
              .semiBold
              .color(AppTheme.titleColor)
              .make()
          : titleBuilder!(title ?? ''),
      leading: leading ??
          (ModalRoute.of(context)!.canPop
              ? _BackButton(onPressed: onBack, color: AppTheme.titleColor)
              : null),
      actions: actions,
      backgroundColor: background ?? context.background,
      centerTitle: centerTitle,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BackButton extends StatelessWidget {
  const _BackButton({Key? key, this.color, this.onPressed}) : super(key: key);
  final Color? color;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
