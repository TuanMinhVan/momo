import '../../core/styles/style.dart';
import 'item_skeleton.dart';

class CouponDetailLoading extends StatelessWidget {
  const CouponDetailLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSkeleton(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Dimensions.height20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 39),
            child: Column(
              children: [
                const ItemLoading(width: 100, height: 15),
                Dimensions.height20,
                const ItemLoading(width: 100, height: 15),
                Dimensions.height15,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: ItemLoading(
                    width: context.screenWidth * .8,
                    height: 160,
                  ),
                ),
                Dimensions.height10,
                const ItemLoading(width: 100, height: 15),
                Dimensions.height30,
                const ItemLoading(height: 40, radius: 5),
                Dimensions.height24,
                Row(
                  children: const [
                    Expanded(child: ItemLoading(height: 40, radius: 30)),
                    Dimensions.width10,
                    Expanded(child: ItemLoading(height: 40, radius: 30)),
                  ],
                ),
              ],
            ),
          ),
          Dimensions.height36,
          const ItemLoading(height: 60)
        ],
      ),
    );
  }
}
