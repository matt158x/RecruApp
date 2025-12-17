String normalizeInput(String input) {
  return input
      .replaceAll(' ', '')
      .replaceAllMapped(
    RegExp(r'(\d)-(\d)'),
        (match) => '${match[1]},-${match[2]}',
  )
      .replaceAll(RegExp(r'-(?!\d)'), '')
      .replaceAll(RegExp(r',+'), ',')
      .replaceAll(RegExp(r'^,+'), '')
      .replaceAll(RegExp(r',+$'), '');
}
