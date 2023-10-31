import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_CustomAppBarMenuItem> menuItems = [
      _CustomAppBarMenuItem(
          icon: Icons.refresh,
          label: 'このアプリについて',
          onSelected: (context) => Navigator.pushNamed(context, '/about'))
    ];
    return AppBar(
      centerTitle: true, // タイトルを中央に配置
      // AppBarのタイトルを設定
      title: const Text('Sample Flutter WebView'),
      actions: <Widget>[
        PopupMenuButton<_CustomAppBarMenuItem>(
            color: Colors.white,
            onSelected: (value) => value.onSelected?.call(context),
            itemBuilder: (BuildContext context) {
              return menuItems
                  .map((menuItem) => PopupMenuItem<_CustomAppBarMenuItem>(
                      value: menuItem,
                      child: Row(
                        children: <Widget>[
                          Icon(menuItem.icon),
                          const SizedBox(width: 8),
                          Text(menuItem.label),
                        ],
                      )))
                  .toList();
            })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarMenuItem {
  const _CustomAppBarMenuItem({
    this.icon,
    required this.label,
    required this.onSelected,
  });

  final IconData? icon;
  final String label;
  final void Function(BuildContext context)? onSelected;
}
