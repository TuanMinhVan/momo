import '../../core/styles/style.dart';
import 'item_skeleton.dart';

class NotifyLoading extends StatelessWidget {
  const NotifyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSkeleton(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ItemLoading(height: 20),
                  Dimensions.height5,
                  ItemLoading(height: 15, width: 120),
                ],
              ),
            ),
            Dimensions.width10,
            const ItemLoading(width: 20, height: 20),
          ],
        ),
      ),
    );
  }
}
