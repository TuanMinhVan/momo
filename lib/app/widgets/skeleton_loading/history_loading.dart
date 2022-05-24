import '../../core/styles/style.dart';
import 'item_skeleton.dart';

class HistoryLoading extends StatelessWidget {
  const HistoryLoading({Key? key, this.showIcon = true}) : super(key: key);
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return ItemSkeleton(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ItemLoading(width: 160, height: 12),
                    Dimensions.height10,
                    ItemLoading(width: 180, height: 20),
                  ],
                ),
                if (showIcon)
                  Row(
                    children: [
                      const ItemLoading(height: 24, width: 24),
                      Dimensions.width15,
                      const ItemLoading(height: 22, width: 22),
                      SizedBox(width: context.width * 0.03),
                    ],
                  ),
              ],
            ),
            Dimensions.height15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ItemLoading(height: 18, width: 70, radius: 20),
                ItemLoading(height: 18, width: 83),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
