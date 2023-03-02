import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/page_controller.dart';

class ItemList extends StatefulWidget {
  const ItemList({
    super.key,
    required this.text,
    required this.icon,
    required this.index,
  });

  final IconData icon;
  final String text;
  final int index;
  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      waitDuration: const Duration(seconds: 1),
      message: widget.text,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor:
                widget.index == context.watch<MyPageController>().page
                    ? Colors.white24
                    : Colors.black54),
        onPressed: () {
          context.read<MyPageController>().changePage(widget.index);
        },
        onHover: (value) {
          setState(() {
            hover = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(widget.icon, color: hover ? Colors.white : Colors.grey),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  widget.text,
                  style: TextStyle(color: hover ? Colors.white : Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
