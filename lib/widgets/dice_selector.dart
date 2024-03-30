import 'package:nice_dice/model/dice.dart';
import 'package:nice_dice/widgets/dice_item.dart';
import 'package:flutter/material.dart';

class DiceSelector extends StatefulWidget {
  DiceSelector({
    super.key,
    required this.onDiceChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 24),
  });

  final List<Dice> dices = [
    Dice(sides: 4),
    Dice(sides: 6),
    Dice(sides: 8),
    Dice(sides: 10),
    Dice(sides: 12),
    Dice(sides: 20)
  ];

  final void Function(Dice dice) onDiceChanged;
  final EdgeInsets padding;

  @override
  State<DiceSelector> createState() => _DiceSelectorState();
}

class _DiceSelectorState extends State<DiceSelector> {
  static const _dicesPerScreen = 3;
  static const _viewportFractionPerItem = 1.0 / _dicesPerScreen;
  
  late final PageController _controller;
  late int _page;

  int get dicesCount => widget.dices.length;
  
  @override
  void initState() {
    super.initState();
    _page = 0;
    _controller = PageController(
      initialPage: _page,
      viewportFraction: _viewportFractionPerItem,
    );
  _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = (_controller.page ?? 0).round();
    if (page != _page) {
      _page = page;
      widget.onDiceChanged(widget.dices[page]);
    }
  }

  void _onDiceTapped(int index) {
    _controller.animateToPage(
      index, 
      duration: const Duration(milliseconds: 450), 
      curve: Curves.ease);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        alignment: Alignment.center,
        children: [
          _buildCarousel(150)
        ],);
    });
  }

  Widget _buildCarousel(double itemSize){
  return Container(
    height: itemSize,
    margin: const EdgeInsets.all(50),
    child: 
        PageView.builder(
        controller: _controller,
        itemCount: widget.dices.length ,
        itemBuilder: (context, index) {
          return Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                if (!_controller.hasClients || !_controller.position.hasContentDimensions) {
                  // The PageViewController isn't connected to the
                  // PageView widget yet. Return an empty box.
                  return const SizedBox(child: Text("Scroll to start"),);
                }

              // The integer index of the current page,
              // 0, 1, 2, 3, and so on
              final selectedIndex = _controller.page!.roundToDouble();

              // The fractional amount that the current filter
              // is dragged to the left or right, for example, 0.25 when
              // the current filter is dragged 25% to the left.
              final pageScrollAmount = _controller.page! - selectedIndex;

              // The page-distance of a filter just before it
              // moves off-screen.
              const maxScrollDistance = _dicesPerScreen / 2.0;

              // The page-distance of this filter item from the
              // currently selected filter item.
              final pageDistanceFromSelected =
                  (selectedIndex - index + pageScrollAmount).abs();

              // The distance of this filter item from the
              // center of the carousel as a percentage, that is, where the selector
              // ring sits.
              final percentFromCenter =
                  1.0 - pageDistanceFromSelected / maxScrollDistance;

              final itemScale = 0.5 + (percentFromCenter * 0.5);
              final opacity = 0.5 + (percentFromCenter * 0.5);

              return Transform.scale(
                scale: itemScale,
                child: Opacity(
                  opacity: opacity,
                  child: DiceContainer(
                    imagePath: widget.dices.elementAt(index).imagePath,
                    sides: widget.dices.elementAt(index).name,
                    onDiceSelected: () => _onDiceTapped,
                  ),
                ),
              );
          }),
          );
      })
  );}
}