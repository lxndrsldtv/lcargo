final class DeliveryOrderViewModel {
  final int stateColor;
  final String stateDescription;
  final String id;
  final String pathStartPoint;
  final String pathEndPoint;
  final String comment;

  const DeliveryOrderViewModel({
    required this.stateColor,
    required this.stateDescription,
    required this.id,
    required this.pathStartPoint,
    required this.pathEndPoint,
    required this.comment,
  });

  const DeliveryOrderViewModel.empty()
      : stateColor = 0x00000000,
        stateDescription = '',
        id = '',
        pathStartPoint = '',
        pathEndPoint = '',
        comment = '';
}
