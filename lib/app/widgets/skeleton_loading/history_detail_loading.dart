import '../../core/styles/style.dart';
import 'item_skeleton.dart';

class HistoryDetailLoading extends StatelessWidget {
  const HistoryDetailLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSkeleton(
      child: Column(
        children: [
          Row(
            children: const [
              ItemLoading(width: 50, height: 50, radius: 100),
              Dimensions.width10,
              Expanded(child: ItemLoading(height: 20)),
            ],
          ),
          Dimensions.height20,
          for (var i = 0; i < 7; i++) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ItemLoading(width: 80, height: 20),
                ItemLoading(height: 20, width: 120),
              ],
            ),
            Dimensions.height12,
          ]
        ],
      ),
    );
  }
}
