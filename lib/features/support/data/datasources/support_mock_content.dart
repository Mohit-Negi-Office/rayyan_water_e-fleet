import 'package:rayyan_driver/features/support/data/models/policy_document_model.dart';

/// Placeholder policy text from the Figma frames.
const supportMockSections = [
  PolicySectionModel(
    body:
        'Our website is intended for personal, non-commercial use only. You '
        'may not use our website for any illegal or unauthorized purpose.',
  ),
  PolicySectionModel(
    heading: 'Product Information',
    body:
        'We make every effort to ensure that the product information on our '
        'website is accurate and up-to-date. However, we do not guarantee the '
        'accuracy or completeness of the product information and reserve the '
        'right to make changes or corrections at any time.',
  ),
  PolicySectionModel(
    heading: 'Orders',
    body:
        'All orders are subject to our acceptance and availability of the '
        'products. We reserve the right to refuse any order for any reason.',
  ),
  PolicySectionModel(
    heading: 'Prices and Payment',
    body:
        'All prices on our website are in [currency] and are subject to '
        'change without notice. We accept payment by [payment methods]. You '
        'are responsible for any applicable taxes, duties, or fees.',
  ),
  PolicySectionModel(
    heading: 'Shipping and Delivery',
    body:
        'We will ship your order to the shipping address you provide at '
        'checkout. We are not responsible for any delays or errors in '
        'delivery caused by the carrier. Delivery times are estimates and '
        'not guaranteed.',
  ),
  PolicySectionModel(
    heading: 'Governing Law',
    body:
        'These terms and conditions shall be governed by and construed in '
        'accordance with the laws of [jurisdiction]. Any disputes arising out '
        'of or in connection with these terms and conditions shall be '
        'resolved in the courts of [jurisdiction].',
  ),
];

const String _faqAnswer =
    'Our website is intended for personal, non-commercial use only. You may '
    'not use our website for any illegal or unauthorized purpose.';

/// Questions from the FAQs frame (`5000:105687`).
const supportMockFaqs = [
  FaqModel(question: 'What payment options do you offer?', answer: _faqAnswer),
  FaqModel(question: 'How long does shipping take?', answer: _faqAnswer),
  FaqModel(question: 'Do you offer free shipping?', answer: _faqAnswer),
  FaqModel(question: 'Can I track my order?', answer: _faqAnswer),
  FaqModel(question: 'What payment options do you offer?', answer: _faqAnswer),
  FaqModel(question: 'How long does shipping take?', answer: _faqAnswer),
  FaqModel(question: 'Do you offer free shipping?', answer: _faqAnswer),
  FaqModel(question: 'Can I track my order?', answer: _faqAnswer),
];
