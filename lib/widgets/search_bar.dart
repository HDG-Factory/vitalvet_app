import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Widget? withWidget;

  const SearchBar({Key? key, this.withWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (withWidget != null)
        ? Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              withWidget!,
            ],
          )
        : const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          );
  }
}
