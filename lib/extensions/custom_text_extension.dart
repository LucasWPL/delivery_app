import 'package:delivery_app/exports.dart';

extension CustomText on Text {
  Text getStyle(TextStyle newStyle) {
    return Text(
      data!,
      textAlign: textAlign,
      overflow: overflow,
      style: (style == null) ? newStyle : style!.merge(newStyle),
    );
  }

  // -- Cores --
    Text get brandPrimary => getStyle(
        const TextStyle(
          color: BrandColors.primaryColor,
        ),
      );


  // -- Tamanhos --

  Text get w400s8 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 8,
        ),
      );

  Text get w400s10 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),
      );

  Text get w400s12 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      );

  Text get w400s14 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      );

  Text get w400s16 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      );

  Text get w400s18 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      );

  Text get w500s10 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
      );

  Text get w500s12 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      );

  Text get w500s14 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      );

  Text get w500s16 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      );

  Text get w500s18 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      );

  Text get w600s10 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      );

  Text get w600s12 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      );

  Text get w600s14 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      );

  Text get w600s16 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      );

  Text get w600s18 => getStyle(
        const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      );
}
