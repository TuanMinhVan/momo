import '../../core/styles/style.dart';
import 'item_skeleton.dart';

class CatalogLoading extends StatelessWidget {
  const CatalogLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 72.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ItemSkeleton(
            child: CircleAvatar(
              radius: 24,
            ),
          ),
          Dimensions.height4,
          ItemSkeleton(
            width: 72,
            height: 11,
          )
        ],
      ),
    );
  }
}
