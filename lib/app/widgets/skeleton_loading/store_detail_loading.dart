import '../../core/styles/style.dart';
import 'item_skeleton.dart';
import 'list_skeleton.dart';

class StoreDetailLoading extends StatelessWidget {
  const StoreDetailLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Dimensions.height35,
          const ItemSkeleton(
            height: 18,
            width: 250,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const ItemSkeleton(
                height: 21,
                width: 100,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: ItemSkeleton(
                height: 16,
                width: 100,
              ),
            ),
          ),
          Dimensions.height10,
          SizedBox(
            height: 120,
            child: ListSkeleton(
              padding: const EdgeInsets.only(left: 20),
              axis: Axis.horizontal,
              itemSkeleton: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0, 2),
                      spreadRadius: 0.2,
                      blurRadius: 0.2,
                    )
                  ],
                ),
                child: SizedBox(
                  width: context.widthScale * 0.7,
                ),
              ),
            ),
          ),
          Dimensions.height20,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListSkeleton(
              itemCount: 10,
              itemSkeleton: ItemSkeleton(
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
