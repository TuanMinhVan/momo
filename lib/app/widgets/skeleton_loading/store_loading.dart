import '../../core/styles/style.dart';
import 'item_skeleton.dart';

class StoreLoading extends StatelessWidget {
  const StoreLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSkeleton(
      child: SizedBox(
        height: 103,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            children: [
              const ItemLoading(
                width: 72,
                height: 72,
                radius: 4.8,
              ),
              Dimensions.width10,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ItemLoading(height: 15),
                    ItemLoading(height: 12),
                    ItemLoading(height: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
