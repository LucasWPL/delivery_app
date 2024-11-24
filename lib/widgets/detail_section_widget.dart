import 'package:delivery_app/exports.dart';

class DetailSectionWidget extends StatelessWidget {
  final String title;
  final List<Widget> fields;

  const DetailSectionWidget({
    super.key,
    required this.title,
    required this.fields,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 45,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(title).w600s12.paddingOnly(left: 10),
            ),
          ),
        ).paddingOnly(bottom: 5),
        ...fields.asMap().entries.map((entry) {
          if (fields.length == 1 || entry.key == fields.length - 1) {
            return entry.value;
          }

          return Column(children: [
            entry.value,
            SizedBox(height: 1, child: Container(color: Colors.grey.shade300)),
          ]);
        }),
      ],
    ).paddingOnly(bottom: 10);
  }
}
