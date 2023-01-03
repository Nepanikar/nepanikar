// Source: https://github.com/Cretezy/linkify/pull/52.
import 'package:linkify/linkify.dart';

final _phoneNumberRegex = RegExp(
  r'(.*?)((\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{3,4})',
  caseSensitive: false,
  dotAll: true,
);

class PhoneNumberLinkifier extends Linkifier {
  const PhoneNumberLinkifier();

  @override
  List<LinkifyElement> parse(List<LinkifyElement> elements, LinkifyOptions options) {
    final list = <LinkifyElement>[];

    for (final element in elements) {
      if (element is TextElement) {
        final match = _phoneNumberRegex.firstMatch(element.text);

        if (match == null) {
          list.add(element);
        } else {
          final text = element.text.replaceFirst(match.group(0)!, '');

          if (match.group(1)?.isNotEmpty == true) {
            list.add(TextElement(match.group(1)!));
          }

          if (match.group(2)?.isNotEmpty == true) {
            list.add(PhoneNumberElement(match.group(2)!.replaceFirst(RegExp('tel:'), '')));
          }

          if (text.isNotEmpty) {
            list.addAll(parse([TextElement(text)], options));
          }
        }
      } else {
        list.add(element);
      }
    }

    return list;
  }
}

/// Represents an element containing a phone number.
class PhoneNumberElement extends LinkableElement {
  PhoneNumberElement(this.phoneNumber) : super(phoneNumber, 'tel:$phoneNumber');

  final String phoneNumber;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneNumberElement &&
          runtimeType == other.runtimeType &&
          phoneNumber == other.phoneNumber;

  @override
  int get hashCode => phoneNumber.hashCode;

  @override
  String toString() {
    return 'PhoneNumberElement{phoneNumber: $phoneNumber}';
  }
}
