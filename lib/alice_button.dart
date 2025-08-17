// alice_button.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../alice_service.dart';

class AliceFloatingButton extends StatelessWidget {
  /// Số lượng request đã log (tăng từ adapter)
  final ValueNotifier<int> counter;

  /// Callback khi người dùng thả nút (trả ra globalOffset của nút)
  final void Function(Offset globalOffset) onDragEnd;

  const AliceFloatingButton({
    super.key,
    required this.counter,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) return const SizedBox.shrink();

    return ValueListenableBuilder<int>(
      valueListenable: counter,
      builder: (context, count, _) {
        final bubble = _bubble(count);
        return Draggable(
          feedback: bubble,                 // hiển thị khi đang kéo
          childWhenDragging: const SizedBox.shrink(),
          // globalPosition của tâm feedback, gần topLeft của widget khi thả
          onDragEnd: (details) => onDragEnd(details.offset),
          child: bubble,                    // nút thật
        );
      },
    );
  }

  Widget _bubble(int count) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        FloatingActionButton(
          mini: true,
          onPressed: () => AliceService.alice.showInspector(),
          child: const Icon(Icons.bug_report),
        ),
        if (count > 0)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 18),
              child: Text(
                '$count',
                style: const TextStyle(color: Colors.white, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
