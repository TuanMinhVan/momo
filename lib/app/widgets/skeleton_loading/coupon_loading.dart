import '../../core/styles/style.dart';
import 'item_skeleton.dart';

class CouponLoading extends StatelessWidget {
  const CouponLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const ItemLoading(width: 104, radius: 5),
            Dimensions.width10,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ItemLoading(height: 13),
                  ItemLoading(height: 13),
                  ItemLoading(height: 13),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
