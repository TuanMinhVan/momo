import '../../core/styles/style.dart';
import 'item_skeleton.dart';

class MyWalletLoading extends StatelessWidget {
  const MyWalletLoading({Key? key, this.padding = 10}) : super(key: key);
  final double padding;
  @override
  Widget build(BuildContext context) {
    final normal = context.bodyText2.copyWith(color: context.background);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '残高',
                  style: normal.copyWith(fontSize: 17),
                ),
              ),
              const ItemSkeleton(height: 30, width: 80)
            ],
          ),
        ),
        Dimensions.height10,
        const Expanded(child: ItemLoading()),
        Dimensions.height10,
        Padding(
          padding: EdgeInsets.only(right: padding),
          child: Divider(
            thickness: 1,
            color: context.background,
          ),
        ),
        Dimensions.height10,
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'ポイント',
                        style: normal.copyWith(fontSize: 15),
                      ),
                    ),
                    Dimensions.height10,
                    const Expanded(child: ItemLoading()),
                  ],
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ItemLoading(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
