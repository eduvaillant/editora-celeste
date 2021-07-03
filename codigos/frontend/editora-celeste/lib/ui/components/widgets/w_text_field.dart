// import 'package:components_venver/functions.dart';
// import 'package:components_venver/material.dart';
// import 'package:components_venver/src/settings/init.dart';
// // import 'package:components_venver/src/settings/filter_mask.dart';
// import 'package:components_venver/src/settings/mask_type.dart';
// import 'package:components_venver/theme/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// // import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:components_venver/src/utils/helpers/text_field_type.dart';

// export 'package:components_venver/src/utils/helpers/text_field_type.dart';

// // ! Colocar type com um ícone apagável (TextField de 'CPF / CNPJ na nota' do carrinho)

// // ! VER controllers / formatters
// /*
// https://pub.dev/packages/flutter_masked_text
// https://pub.dev/packages/mask_text_input_formatter
// https://pub.dev/packages/masked_text_formatter
// https://pub.dev/packages/extended_masked_text
// https://pub.dev/packages/masked_controller
// https://pub.dev/packages/masked_text_input_formatter
// */

// // ! Pq a rota não é feita com enum?
// // ! Adicionar autoFocus (lista de focusNode) no withSuggestions
// /* // ! Ver sobre enum's
// https://www.educative.io/blog/dart-2-language-features
// */

// /*  // ! Ver...
//     ScrollbarTheme(
//       data: ScrollbarThemeData(
//         thumbColor: MaterialStateProperty.all(Colors.green),
//         crossAxisMargin: 20, // Largura (interna) clicável da barra (apenas clicável, a barra não fica mais larga)
//         trackBorderColor: MaterialStateProperty.all(Colors.red),
//         trackColor: MaterialStateProperty.all(Colors.orange),
//         mainAxisMargin: 50,
//         minThumbLength: 50,
//       ),
//       child: Scrollbar(child: SingleChildScrollView()),
//     );
//     CupertinoSearchTextField( // import 'package:flutter/cupertino.dart';
//       onChanged: (_) {},
//     );
// */
// // ? Flutter devtools vscode
// // ? https://github.com/gskinnerTeam/flutter-folio
// // ? https://flutter.dev/docs/development/add-to-app/multiple-flutters (crash reporting)
// // ! https://flutter.dev/docs/development/ui/widgets/cupertino (cupertino widgets)
// // ? https://medium.com/codechai/a-simple-search-bar-in-flutter-f99aed68f523
// // ? https://pub.dev/packages/animated_text_kit
// // ? https://pub.dev/packages/textfield_search
// // ? https://pub.dev/packages/bottom_navy_bar
// // ! https://pub.dev/packages/font_awesome_flutter
// // ? https://pub.dev/packages/flutter_local_notifications
// // ? https://pub.dev/packages/just_audio
// // ? https://stackoverflow.com/questions/66542199/what-is-materialstatepropertycolor (MaterialStateProperty das cores no ScrollbarThemeData)

// /*
// ! Criar um componente de carregamento central (CenterLoading)
// return Center(
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         alignment: Alignment.center,
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).appBarTheme.actionsIconTheme.color),
//           strokeWidth: 5.0,
//         ),
//       ),
//     );
// */

// // ! Colocar pro tipo de dinheiro não ter como mover o cursor
// // ! Colocar pro tipo number ter 2 setinhas (incremento e decremento e um atributo STEP (como no dropdown))
// // ! Colocar pro tipo date ter um ícone com um datePicker
// // ! Colocar pro tipo time ter um ícone com um seletor de horário (tipo o seletor de cronômetro do Honor)
// // ! Colocar pro tipo dateTime ter um ícone com um seletor data e hora
// // ! Colocar uma opção (ou um widget) pra ter um Switch para habilitar/desabilitar o TextField (como no 'CPF / CNPJ' do carrinho)

// // ignore: must_be_immutable
// class OwTextField extends StatelessWidget {
//   final String? labelText;
//   final String? hintText;
//   final String? errorText;
//   final String? helperText;
//   final Widget? suffixIcon;
//   final TextInputType? keyboardType;
//   final TextInputAction? textInputAction;
//   final dynamic? controller; // TextEditingController
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String>? onFieldSubmitted;
//   final FocusNode? focusNode;
//   final FocusNode? nextFocusNode;
//   final ValueChanged<String>? onChanged;
//   final Function? onTap;
//   final FormFieldSetter<String>? onSaved;
//   final int? maxLength;
//   final int? minLines;
//   final int? maxLines;
//   final EdgeInsets? margin;
//   final bool? enabled;
//   final bool? enableInteractiveSelection;
//   final bool? autofocus;
//   final bool? obscureText;
//   final bool? maxLengthEnforced;
//   final bool? readOnly;
//   final TextCapitalization? textCapitalization;
//   final String? counterText;
//   final Color? color;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? suffixText;
//   final String? prefixText;
//   final List<dynamic>? suggestionsList;
//   final bool? ignoreAccentsOnSuggestion;
//   final bool? caseSensitiveOnSuggestion;
//   final TextFieldType? fieldType;
//   final bool? unfocusIfNoNextFocusNode;
//   final List<FocusNode>? focusNodeList;
//   final int? focusNodeIndex;
//   final ValueChanged<String>? onSuggestionSelected;
//   final bool? automaticFocusWithFocusNodeList;
//   final bool? repeatItemsOnSuggestionList;
//   // final VoidCallback onPressedSuffix;

//   static const String assertMsgFocusNodeList = "If you are using 'focusNodeList', you need to pass its position with 'focusNodeIndex'";
//   static const String assertMsgSuggestions = "'suggestionsList' can not be null";
//   // static const BorderRadius circularBorderRadius  = BorderRadius.all(Radius.circular(10));

//   OwTextField({
//     Key? key,
//     this.controller,
//     this.fieldType,
//     this.labelText,
//     this.hintText,
//     this.helperText,
//     this.errorText,
//     this.keyboardType,
//     this.textInputAction,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.obscureText = false,
//     this.readOnly = false,
//     this.autofocus = false,
//     this.enabled = true,
//     this.maxLengthEnforced = true,
//     this.onFieldSubmitted,
//     this.focusNode,
//     this.onChanged,
//     this.onTap,
//     this.counterText,
//     this.maxLength,
//     this.minLines = 1,
//     this.maxLines = 1,
//     this.margin,
//     this.prefixText,
//     this.suffixText,
//     this.suffixIcon,
//     this.enableInteractiveSelection = true,
//     this.color,
//     this.inputFormatters,
//     this.onSaved,
//     this.validator,
//     this.nextFocusNode,
//     this.unfocusIfNoNextFocusNode = true,
//     this.focusNodeList,
//     this.focusNodeIndex,
//     this.automaticFocusWithFocusNodeList = true,
//   }): this.suggestionsList = null,
//       this.ignoreAccentsOnSuggestion = null,
//       this.caseSensitiveOnSuggestion = null,
//       this.onSuggestionSelected = null,
//       this.repeatItemsOnSuggestionList = null,
//       // assert(
//       //   controller is TextEditingController,
//       //   "'controller' is not TextEditingController",
//       // ),
//       assert(
//         (focusNodeList == null && focusNodeIndex == null) || (focusNodeList != null && focusNodeIndex != null), 
//         assertMsgFocusNodeList,
//       ),
//       super(key: key);

//   OwTextField.withSuggestions({
//     Key? key,
//     this.controller,
//     this.labelText,
//     this.hintText,
//     this.helperText,
//     this.errorText,
//     this.keyboardType,
//     this.textInputAction,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.obscureText = false,
//     this.enabled = true,
//     this.maxLengthEnforced = true,
//     this.onFieldSubmitted,
//     this.focusNode,
//     this.onChanged,
//     this.onTap,
//     this.counterText,
//     this.maxLength,
//     this.minLines = 1,
//     this.maxLines = 1,
//     this.margin,
//     this.prefixText,
//     this.suffixText,
//     this.enableInteractiveSelection = true,
//     this.suffixIcon,
//     this.color,
//     this.suggestionsList,
//     this.inputFormatters,
//     this.autofocus = false,
//     this.readOnly = false,
//     this.nextFocusNode,
//     this.ignoreAccentsOnSuggestion = true,
//     this.caseSensitiveOnSuggestion = false,
//     this.unfocusIfNoNextFocusNode = true,
//     this.focusNodeList,
//     this.focusNodeIndex,
//     this.automaticFocusWithFocusNodeList = true,
//     this.onSuggestionSelected,
//     this.repeatItemsOnSuggestionList = false,
//   }): this.fieldType = null,
//       this.onSaved = null,
//       this.validator = null,
//       assert(
//         suggestionsList != null, 
//         assertMsgSuggestions,
//       ),
//       assert(
//         (focusNodeList == null && focusNodeIndex == null) || (focusNodeList != null && focusNodeIndex != null), 
//         assertMsgFocusNodeList,
//       ),
//       super(key: key);

//   // OwTextField.type({
//   //   Key key,
//   //   @required this.fieldType,
//   //   this.controller,
//   //   this.labelText,
//   //   this.hintText,
//   //   this.helperText,
//   //   this.errorText,
//   //   this.keyboardType,
//   //   this.textInputAction,
//   //   this.textCapitalization = TextCapitalization.sentences,
//   //   this.obscureText = false,
//   //   this.readOnly = false,
//   //   this.autofocus = false,
//   //   this.enabled = true,
//   //   this.maxLengthEnforced = true,
//   //   this.onFieldSubmitted,
//   //   this.focusNode,
//   //   this.onChanged,
//   //   this.onTap,
//   //   this.counterText,
//   //   this.maxLength,
//   //   this.minLines = 1,
//   //   this.maxLines = 1,
//   //   this.margin,
//   //   this.prefixText,
//   //   this.suffixText,
//   //   this.nextFocusNode,
//   //   this.enableInteractiveSelection = true,
//   //   this.color,
//   //   this.inputFormatters,
//   //   this.suffixIcon,
//   //   this.onSaved,
//   //   this.validator,
//   //   this.unfocusIfNoNextFocusNode = true,
//   //   this.focusNodeList,
//   //   this.focusNodeIndex,
//   //   this.automaticFocusWithFocusNodeList = true,
//   // })  : this.suggestionsList = null,
//   //       this.onSuggestionSelected = null,
//   //       this.ignoreAccentsOnSuggestion = null,
//   //       this.caseSensitiveOnSuggestion = null,
//   //       this.repeatItemsOnSuggestionList = null,
//   //       // assert(
//   //       //   controller is MaskedTextController || controller is MoneyMaskedTextController,
//   //       //   "'controller' is not MaskedTextController or MoneyMaskedTextController",
//   //       // ),
//   //       assert(
//   //         (focusNodeList == null && focusNodeIndex == null) || (focusNodeList != null && focusNodeIndex != null), 
//   //         assetMsgFocusNodeList,
//   //       ),
//   //       super(key: key);

//   TextInputType? _keyboardType;
//   List<TextInputFormatter>? _inputFormatters;
//   TextCapitalization? _textCapitalization;
//   Function? _goToNextFocusNode;
//   TextInputAction? _textInputAction = TextInputAction.next;
//   FocusNode? _nextFocusNode;
//   FocusNode? _focusNode;
//   ValueChanged<String>? _changeMask;
//   Widget? _suffixIcon;
//   int? _minLines, _maxLines;
//   String? _prefixText;

//   @override
//   Widget build(BuildContext context) {
//     changeTextFieldType(context);
//     defineFocusNode(context);
    
//     return Container(
//       key: key,
//       margin: margin,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//       ),
//       child: _textField(context),
//     );
//   }

//   Widget _textField(BuildContext context) {
//     if(suggestionsList == null) {
//       return TextFormField(
//         inputFormatters: inputFormatters ?? _inputFormatters,
//         keyboardType: keyboardType ?? _keyboardType,
//         textCapitalization: textCapitalization ?? _textCapitalization,
//         minLines: minLines ?? _minLines,
//         maxLines: maxLines ?? _maxLines,
//         maxLengthEnforced: maxLengthEnforced,
//         enabled: enabled,
//         enableInteractiveSelection: enableInteractiveSelection,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: color ?? Theme.of(context).cardColor,
//           labelText: labelText,
//           hintText: hintText,
//           errorText: errorText,
//           counterText: counterText,
//           alignLabelWithHint: false,
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Theme.of(context).secondaryHeaderColor,
//               width: 1,
//             ),
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//             borderSide: BorderSide(
//               color: Theme.of(context).secondaryHeaderColor,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//             borderSide: BorderSide(
//               color: Theme.of(context).secondaryHeaderColor,
//             ),
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 20, 
//             vertical: 18,
//           ),
//           labelStyle: TextStyle(
//             color: Theme.of(context).primaryTextTheme.bodyText1.color,
//           ),
//           errorBorder: UnderlineInputBorder(
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//             borderSide: BorderSide(color: Theme.of(context).errorColor),
//           ),
//           helperText: helperText,
//           helperMaxLines: 3,
//           errorStyle: TextStyle(
//             color: Theme.of(context).errorColor,
//           ),
//           suffixText: suffixText,
//           prefixText: prefixText ?? _prefixText,
//           suffixIcon: suffixIcon ?? _suffixIcon,
//         ),
//         onTap: onTap,
//         onSaved: onSaved,
//         onChanged: (value) {
//           if(onChanged != null) {
//             onChanged(value);
//           }
//           if(_changeMask != null) {
//             _changeMask(value);
//           }
//         },
//         // onChanged: onChanged,
//         maxLength: maxLength,
//         readOnly: readOnly,
//         validator: validator,
//         controller: controller,
//         textInputAction: textInputAction ?? _textInputAction,
//         // onFieldSubmitted: onFieldSubmitted,
//         onFieldSubmitted: (_) {
//           if(onFieldSubmitted != null) {
//             onFieldSubmitted(_);
//           }
//           if(_goToNextFocusNode != null) {
//             _goToNextFocusNode();
//           }
//         },
//         focusNode: _focusNode,
//         obscureText: obscureText,
//         autofocus: autofocus,
//       );
//     } else {
//       return TypeAheadField(
//         suggestionsBoxDecoration: SuggestionsBoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//         ),
//         textFieldConfiguration: TextFieldConfiguration(
//           autofocus: autofocus,
//           controller: controller,
//           keyboardType: keyboardType,
//           textInputAction: textInputAction ?? _textInputAction,
//           textCapitalization: textCapitalization,
//           obscureText: obscureText,
//           enabled: enabled,
//           maxLengthEnforced: maxLengthEnforced,
//           enableInteractiveSelection: enableInteractiveSelection,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: color ?? Theme.of(context).cardColor,
//             labelText: labelText,
//             hintText: hintText,
//             errorText: errorText,
//             counterText: counterText,
//             alignLabelWithHint: true,
//             border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Theme.of(context).secondaryHeaderColor,
//                 width: 1,
//               ),
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//               borderSide: BorderSide(
//                 color: Theme.of(context).secondaryHeaderColor,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//               borderSide: BorderSide(
//                 color: Theme.of(context).secondaryHeaderColor,
//               ),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 20, 
//               vertical: 18,
//             ),
//             labelStyle: TextStyle(
//               color: Theme.of(context).primaryTextTheme.bodyText1.color,
//             ),
//             errorBorder: UnderlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               borderSide: BorderSide(
//                 color: Theme.of(context).errorColor,
//               ),
//             ),
//             helperText: helperText,
//             helperMaxLines: 3,
//             errorStyle: TextStyle(
//               color: Theme.of(context).errorColor,
//             ),
//             suffixText: suffixText,
//             prefixText: prefixText,
//             suffixIcon: suffixIcon,
//           ),
//           onSubmitted: (_) {
//             if(onFieldSubmitted != null) {
//               onFieldSubmitted(_);
//             }
//             if(_goToNextFocusNode != null) {
//               _goToNextFocusNode();
//             }
//           },
//           focusNode: _focusNode,
//           onChanged: onChanged,
//           onTap: onTap,
//           maxLength: maxLength,
//           minLines: minLines,
//           maxLines: maxLines,
//           inputFormatters: inputFormatters,
//         ),
//         suggestionsCallback: (string) {
//           // return await _getSuggestionsList(string);
//           return _getSuggestionsList(string);
//         },
//         noItemsFoundBuilder: (_) {
//           return const SizedBox();
//         },
//         itemBuilder: (context, suggestion) {
//           return ListTile(
//             title: Text(
//               suggestion.toString(),
//               style: const TextStyle(fontWeight: FontWeight.w500),
//             ),
//             trailing: const Icon(Icons.touch_app_outlined),
//           );
//         },
//         onSuggestionSelected: (suggestion) {
//           if(onSuggestionSelected != null) {
//             onSuggestionSelected(suggestion?.toString());
//           }
//           if(controller != null) {
//             controller.text = suggestion?.toString() ?? "";
//           }
//         },
//       );
//     }
//   }

//   void changeTextFieldType(BuildContext context) {
//     if(fieldType != null) {
//       const String assertMsgMaskedTextController = "'controller' is not MaskedTextController";
//       switch(fieldType.type) {
//         case TextFieldMaskType.name:
//           _keyboardType = TextInputType.name;
//           _textCapitalization = TextCapitalization.words;
//           break;

//         case TextFieldMaskType.email:
//           _keyboardType = TextInputType.emailAddress;
//           _textCapitalization = TextCapitalization.none;
//           break;

//         case TextFieldMaskType.password: // ? Ver se dá para melhorar
//           _keyboardType = TextInputType.visiblePassword; // Testar, se não, usar TextInputType.text
//           _textCapitalization = TextCapitalization.none;
//           // if(obscureText != null) {
//           //   _suffixIcon = OwActivableIcon(
//           //     activated: obscureText, 
//           //     onPressed: () {
//           //     },
//           //   );
//           // }
//           break;

//         case TextFieldMaskType.multiText: // ? Ver se dá para melhorar
//           _keyboardType = TextInputType.multiline;
//           _textInputAction = TextInputAction.newline;
//           _minLines = 2;
//           _maxLines = 12;
//           break;

//         case TextFieldMaskType.cep:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           controller.updateMask(MaskType.cep);
//           // var _mask = OwMaskedFormatter.cep(); // initialText: controller?.text ?? ""
//           // _inputFormatters = [_mask];
//           break;

//         case TextFieldMaskType.search: // ? Ver se dá para melhorar
//           _keyboardType = TextInputType.text;
//           _textInputAction = TextInputAction.search;
//           // textInputAction: TextInputAction.done, // Nos filtros, é usado done, pq ao digitar, ele já pesquisa automaticamente, já em outros lugares, deve ser serach, pois só pesquisará quando pressionar
//           // icon: controller.text.isNotEmpty
//           //   ? const Icon(Icons.close, color: Colors.grey,)
//           //   : const Icon(Icons.search, color: Colors.grey,),
//           // onPressedSuffix: controller.text.isNotEmpty ? (){
//           //   controller.clear();
//           //   pesquisar(categoria, controller.text);
//           // } : null,
//           break;

//         case TextFieldMaskType.cardNumber:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           controller.updateMask(MaskType.cardNumber);
//           // final _mask = OwMaskedFormatter.cardNumber(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // _inputFormatters = [_mask];
//           break;

//         case TextFieldMaskType.cardCvv:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           controller.updateMask(MaskType.cardCvv);
//           // final _mask = OwMaskedFormatter.cardCvv(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // _inputFormatters = [_mask];
//           break;

//         case TextFieldMaskType.cardDateYY:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           controller.updateMask(MaskType.cardDateYY);
//           // final _mask = OwMaskedFormatter.cardDateYY(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // _inputFormatters = [_mask];
//           break;

//         case TextFieldMaskType.cardDateYYYY:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           controller.updateMask(MaskType.cardDateYYYY);
//           // final _mask = OwMaskedFormatter.cardDateYYYY(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // _inputFormatters = [_mask];
//           break;

//         case TextFieldMaskType.date: // ? Talvez um ícone pra abrir um datePick
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.datetime;
//           controller.updateMask(MaskType.date);
//           // final _mask = OwMaskedFormatter.date(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // _inputFormatters = [_mask];
//           break;

//         case TextFieldMaskType.dateTime: // ? Talvez um ícone pra abrir um datePick
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.datetime;
//           controller.updateMask(fieldType.mask ?? MaskType.dateTime);
//           break;

//         case TextFieldMaskType.time: // ? Talvez um ícone pra abrir tipo um datePick de horário
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.datetime;
//           controller.updateMask(MaskType.time);
//           break;

//         case TextFieldMaskType.cpf:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           controller.updateMask(MaskType.cpf);
//           // final _mask = OwMaskedFormatter.cpf(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // _inputFormatters = [_mask];
//           break;

//         case TextFieldMaskType.cnpj:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           controller.updateMask(MaskType.cnpj);
//           // final _mask = OwMaskedFormatter.cnpj(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // _inputFormatters = [_mask];
//           break;
        
//         case TextFieldMaskType.cpfCnpj:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           String _cpfMask = MaskType.cpf + "0";
//           _changeMask = (_) {
//             if(controller.text.length <= MaskType.cpf.length && controller.mask != _cpfMask) {
//               controller.updateMask(_cpfMask);
//             } else if(controller.text.length > MaskType.cpf.length && controller.mask != MaskType.cnpj) {
//               controller.updateMask(MaskType.cnpj);
//             }
//           };
//           _changeMask(controller.text);
//           // if(!(controller is MaskedTextController)) {
//           //   throw ArgumentError.value(
//           //     controller,
//           //     "controller is not MaskedTextController", // Name
//           //     "Invalid controller: The controller needs to be instantiated as MaskedTextController class", // Message
//           //   );
//           // } 
//           // MaskTextInputFormatter _maskFormatter;
//           // if(controller?.text?.length == MaskType.cpf.length) { // ? E se controller?.text for null ?
//           //   _maskFormatter = OwMaskedFormatter.cpf(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // } else {
//           //   _maskFormatter = OwMaskedFormatter.cnpj(initialText: controller?.text); // initialText: controller?.text ?? ""
//           // }
//           // _inputFormatters = [_maskFormatter];
//           // _changeMask = () {
//           //   int _position = controller?.selection?.baseOffset;
//           //   String _text = _maskFormatter.getUnmaskedText();
//           //   String _mask = _maskFormatter.getMask();
//           //   if(_text.length > 10 && _mask != MaskType.cpf) {
//           //     _maskFormatter.updateMask(mask: MaskType.cpf, filter: FilterMask.number);
//           //     controller.updateMask(MaskType.cpf);
//           //     controller.selection = TextSelection.fromPosition(TextPosition(offset: _position));
//           //   } else if(_text.length <= 10 && _mask != MaskType.cnpj) {
//           //     _maskFormatter.updateMask(mask: MaskType.cnpj, filter: FilterMask.number);
//           //     controller.updateMask(MaskType.cnpj);
//           //     controller.selection = TextSelection.fromPosition(TextPosition(offset: _position));
//           //   }
//           // };
//           break;

//         case TextFieldMaskType.landlineCell:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           String _landlineMask = MaskType.phones(10) + "0";
//           _changeMask = (_) {
//             if(controller.text.length <= MaskType.phones(10).length && controller.mask != _landlineMask) {
//               controller.updateMask(_landlineMask);
//             } else if(controller.text.length > MaskType.phones(10).length && controller.mask != MaskType.phones(11)) {
//               controller.updateMask(MaskType.phones(11));
//             }
//           };
//           _changeMask(controller.text);
//           // if(!(controller is MaskedTextController)) {
//           //   throw ArgumentError.value(
//           //     controller,
//           //     "controller is not MaskedTextController", // Name
//           //     "Invalid controller: The controller needs to be instantiated as MaskedTextController class", // Message
//           //   );
//           // } 
//           // var maskFormatter = OwMaskedFormatter.phones(11, initialText: controller?.text);
//           // // _inputFormatters = [maskFormatter];
//           // _changeMask = () {
//           //   int position = controller?.selection?.baseOffset;
//           //   String text = maskFormatter.getUnmaskedText();
//           //   String mask = maskFormatter.getMask();
//           //   if(text.length >= 11 && mask != '(00) 00000-0000') {
//           //     maskFormatter.updateMask(mask: '(00) 00000-0000', filter: { "0": RegExp(r'[0-9]') });
//           //     controller.updateMask('(00) 00000-0000');
//           //     controller.selection = TextSelection.fromPosition(TextPosition(offset: position));
//           //   } else if(text.length <= 10 && mask != '(00) 0000-00000') {
//           //     maskFormatter.updateMask(mask: '(00) 0000-00000', filter: { "0": RegExp(r'[0-9]') });
//           //     controller.updateMask('(00) 0000-00000');
//           //     controller.selection = TextSelection.fromPosition(TextPosition(offset: position));
//           //   }
//           // };
//           // // MaskTextInputFormatter _maskFormatter;
//           // // if(controller?.text?.length == MaskType.phones(10).length) { // ! E se controller?.text for null ?????
//           // //   _maskFormatter = OwMaskedFormatter.phones(10, initialText: controller?.text); // initialText: controller?.text ?? ""
//           // // } else {
//           // //   _maskFormatter = OwMaskedFormatter.phones(11, initialText: controller?.text); // initialText: controller?.text ?? ""
//           // // }
//           // // _inputFormatters = [_maskFormatter];
//           // // _changeMask = () {
//           // //   int _position = controller?.selection?.baseOffset;
//           // //   String _text = _maskFormatter.getUnmaskedText();
//           // //   String _mask = _maskFormatter.getMask();
//           // //   if(_text.length > 10 && _mask != MaskType.phones(10)) {
//           // //     _maskFormatter.updateMask(mask: MaskType.phones(10), filter: FilterMask.number);
//           // //     controller.updateMask(MaskType.cpf); // ! Descomentar
//           // //     controller.selection = TextSelection.fromPosition(TextPosition(offset: _position));
//           // //   } else if(_text.length <= 10 && _mask != MaskType.phones(11)) {
//           // //     _maskFormatter.updateMask(mask: MaskType.phones(11), filter: FilterMask.number);
//           // //     controller.updateMask(MaskType.cnpj); // ! Descomentar
//           // //     controller.selection = TextSelection.fromPosition(TextPosition(offset: _position));
//           // //   }
//           // };
//           break;
          
//         case TextFieldMaskType.phones:
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           if(fieldType.quantity != null) {
//             controller.updateMask(MaskType.phones(fieldType.quantity));
//             // final _mask = OwMaskedFormatter.phones(
//             //   fieldType.numbersQuantity,
//             //   initialText: controller?.text, // initialText: controller?.text ?? ""
//             // );
//             // _inputFormatters = [_mask];
//           } else {
//             // ! Terminar
//           }
//           break;

//         case TextFieldMaskType.money: // ? Ver se dá para melhorar
//           // assert(controller is MoneyMaskedTextController);
//           // _hintText = "0,00";
//           _prefixText = StandardConfig.currencySymbol + " ";
//           _keyboardType = TextInputType.phone;
//           break;

//         case TextFieldMaskType.integer: // ? Melhorar: Talvez colocar pra ter um número inteiro máximo que pode ser digitado (ex: até 9926)
//           assert(controller is MaskedTextController, assertMsgMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           int zerosQuantity = fieldType.min;
//           bool minMaxEqual = fieldType.min == fieldType.max;
//           controller.updateMask(MaskType.integer(
//             minMaxEqual
//               ? fieldType.max + 1
//               : fieldType.max
//           ));
//           _changeMask = (value) {
//             int integer = int.tryParse(controller.text);
//             if(integer != null && integer != 0) {
//               int i = 0;
//               for(; i < value.length; i++) {
//                 if(value[i] != "0") {
//                   break;
//                 }
//               }
//               if(controller.text[0] != 0) {
//                 controller.updateText(value.substring(i));
//               }
//             } else if(integer == 0) {
//               controller.updateText("0" * zerosQuantity);
//             }
//             if(controller.text.length < zerosQuantity) {
//               controller.updateText("0" * (zerosQuantity - controller.text.length) + controller.text);
//             }

//             if(minMaxEqual) {
//               controller.updateText(controller.text.substring(0, fieldType.min));
//             }
//           };
//           _changeMask(controller.text);
//           break;

//         case TextFieldMaskType.decimal:
//           assert(controller is MoneyMaskedTextController);
//           _keyboardType = TextInputType.phone;
//           break;

//         case TextFieldMaskType.chat: // ? Ver se dá para melhorar
//           _keyboardType = TextInputType.multiline;
//           _textInputAction = TextInputAction.newline;
//           _minLines = 2;
//           _maxLines = 12;
//           // _suffixIcon = ...;
//           break;
//       }
//     }
//   }

//   void defineFocusNode(BuildContext context) {
//     _focusNode = focusNode;
//     _nextFocusNode = nextFocusNode;

//     if(focusNodeList != null && focusNodeList.length > focusNodeIndex) {
//       _focusNode = _focusNode ?? focusNodeList[focusNodeIndex];
//     }
//     if(focusNodeList != null && focusNodeList.length > focusNodeIndex + 1) {
//       _nextFocusNode = _nextFocusNode ?? focusNodeList[focusNodeIndex + 1];
//     }

//     if(_nextFocusNode != null) {
//       _textInputAction = TextInputAction.next;
//       if(automaticFocusWithFocusNodeList) {
//         _goToNextFocusNode = () {
//           // FocusScope.of(context).requestFocus(_nextFocusNode);
//           FN.nextFn(context, _nextFocusNode);
//         };
//       }
//     } else {
//       _textInputAction = TextInputAction.done;
//       if(unfocusIfNoNextFocusNode && automaticFocusWithFocusNodeList) {
//         _goToNextFocusNode = () {
//           // FocusScope.of(context).unfocus();
//           FN.unfocusFn(context);
//         };
//       }
//     }
//   }

//   Iterable<dynamic> _getSuggestionsList(String string) {
//     List<dynamic> suggestions = [];
//     if(suggestionsList != null && suggestionsList.isNotEmpty) {
//       suggestions = suggestionsList;
//     }
    
//     var result = suggestions.where((element) {
//       String item = element.toString();
//       String word = string.toString();
//       if(!caseSensitiveOnSuggestion) {
//         item = item.toLowerCase();
//         word = word.toLowerCase();
//       }
//       if(ignoreAccentsOnSuggestion) {
//         item = OwFormat.removeAccentAndPonctuation(item, useLowerCase: false);
//         word = OwFormat.removeAccentAndPonctuation(word, useLowerCase: false);
//       }
//       return item.contains(word);
//     });

//     return repeatItemsOnSuggestionList
//       ? result
//       : result.toSet().toList();
//   }
// }









// /* // ! Ver depois
// https://stackoverflow.com/questions/50395032/flutter-textfield-with-currency-format

// [THIS CODE DOESN'T WORKS FOR ALL CASES]

// I just got it working this way, sharing in case someone needs too:

// TextField

// TextFormField(  
//     //validator: ,  
//     controller: controllerValor,  
//     inputFormatters: [  
//         WhitelistingTextInputFormatter.digitsOnly,
//         // Fit the validating format.
//         //fazer o formater para dinheiro
//         CurrencyInputFormatter()
//     ],
//     keyboardType: TextInputType.number, ...

// TextInputFormatter

// class CurrencyInputFormatter extends TextInputFormatter {

//     TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

//         if(newValue.selection.baseOffset == 0){
//             print(true);
//             return newValue;
//         }

//         double value = double.parse(newValue.text);

//         final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");

//         String newText = formatter.format(value/100);

//         return newValue.copyWith(
//             text: newText,
//             selection: new TextSelection.collapsed(offset: newText.length));
//     }
// }
// */


// /*
// DV (conta banco)

// final _regExpMeiFancyName = RegExp(r'^[a-zA-Z0-9]+');

// inputFormatters: [
//   UpperCaseTextFormatter(),
//   FilteringTextInputFormatter.allow(_regExpMeiFancyName),
// ],
// */