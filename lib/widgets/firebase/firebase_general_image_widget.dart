import 'package:delivery_app/exports.dart';

class FirebaseGeneralImageWidget extends StatelessWidget {
  final String fileName;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;

  const FirebaseGeneralImageWidget({
    super.key,
    required this.fileName,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: FirebaseHelper.getImageUrl(fileName),
      builder: (context, snapshot) {
        if ([ConnectionState.waiting, ConnectionState.active]
            .contains(snapshot.connectionState)) {
          return Container();
        }
        if (snapshot.hasError) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              width: width,
              height: height,
              color: Colors.grey,
              child: Icon(Icons.error,
                  size: (height ?? width ?? 100) * 0.5, color: Colors.red),
            ),
          );
        }
        if (snapshot.hasData) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: Image.network(
              snapshot.data!,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        }
        return ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            width: width,
            height: height,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
