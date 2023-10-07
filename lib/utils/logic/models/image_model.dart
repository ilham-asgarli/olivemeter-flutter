class ImageModel {
  final List entities;
  final int totalCount;
  final int page;
  final int pageCount;

  const ImageModel({
    required this.entities,
    required this.totalCount,
    required this.page,
    required this.pageCount,
  });
}
