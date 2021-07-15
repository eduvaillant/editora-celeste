// import 'package:components_venver/material.dart';
// import 'package:flutter/material.dart';

// enum ListingPageBy {
//   bookAndTime,
//   writerAndTime,
//   readerAndTime,
//   writer,
//   book,
// }

// enum ListingPageType {
//   rating,
//   view,
// }

// class ListingPage extends StatefulWidget {
//   final ListingPageBy listingPageBy;
//   final ListingPageType listingPageType;
//   const ListingPage({
//     Key key,
//     this.listingPageBy,
//     this.listingPageType,
//   }) : super(key: key);

//   @override
//   _ListingPageState createState() => _ListingPageState(listingPageBy, listingPageType);
// }

// class _ListingPageState extends State<ListingPage> {
//   final ListingPageBy listingPageBy;
//   final ListingPageType listingPageType;

//   _ListingPageState(this.listingPageBy, this.listingPageType);

//   String title;
//   String listTypeText;
//   String bottomButtonLabel;
//   Widget topWidget;
//   Widget listWidget;

//   @override
//   void initState() { 
//     super.initState();
//     _definePageAttributes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Text(
//               listTypeText,
//               style: TextStyle(
//                 fontSize: 24,
//               ),
//             ),
//             SizedBox(height: 10,),
//             topWidget,
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 color: Colors.grey[300],
//               ),
//               // height: 200,
//               child: listWidget,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: OwButton(
//         margin: EdgeInsets.all(8),
//         labelText: bottomButtonLabel,
//         onPressed: () {

//         },
//       ),
//     );
//   }

//   Widget _authorNameDropdown() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Nome do autor"),
//         OwDropdown(
//           hintText: "Nome do autor",
//           margin: EdgeInsets.only(bottom: 20),
//         ),
//       ],
//     );
//   }

//   Widget _dateTimeTextField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Data"),
//         OwTextField(
//           hintText: "00/00/0000",
//           suffixIcon: Icon(Icons.date_range),
//           margin: EdgeInsets.only(bottom: 10),
//         ),
//       ],
//     );
//   }

//   Widget _ratingList() {
//     List<Map<String, dynamic>> ratingList = [
//       {
//         "user": "João Almeida",
//         "rate": 5,
//         "book": "Romeu e Julieta",
//         "msg": "Livro muito bom, gostei de mais",
//         "date": DateTime(2021, 06, 16),
//       },
//       {
//         "user": "Ana Maria",
//         "rate": 4,
//         "book": "A riqueza das nações",
//         "msg": "Livro muito bom, mas achei meio confuso",
//         "date": DateTime(2021, 06, 17),
//       },
//       {
//         "user": "Joice de Souza",
//         "rate": 5,
//         "book": "A república",
//         "msg": "Maravilhoso! Não tenho nem palavras para expressar o quão sensacional este livro é",
//         "date": DateTime(2021, 06, 17),
//       },
//     ];

//     return ListView.separated(
//       padding: EdgeInsets.symmetric(vertical: 5),
//       shrinkWrap: true,
//       itemCount: ratingList.length,
//       separatorBuilder: (context, i) {
//         return Divider(color: Colors.black,);
//       },
//       itemBuilder: (context, i) {
//         String user = "${ratingList[i]["user"]}";
//         String rate = "${"★" * ratingList[i]["rate"]}${"☆" * (5 - ratingList[i]["rate"])}";
//         String date = "${"0" * (2 - ratingList[i]["date"].day.toString().length)}${ratingList[i]["date"].day}/${"0" * (2 - ratingList[i]["date"].month.toString().length)}${ratingList[i]["date"].month}/${ratingList[i]["date"].year}";
//         return ListTile(
//           title: Text("Por: $user   ($date)   $rate"),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Livro: ${ratingList[i]["book"]}", style: TextStyle(color: Colors.black),),
//               SizedBox(height: 5,),
//               Text("${ratingList[i]["msg"]}", style: TextStyle(fontSize: 14),),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _visualizationList() {
//     List<Map<String, dynamic>> viewers = [
//       {
//         "user": "Matheus Britto",
//         "date": DateTime(14, 06, 2021),
//       },
//       {
//         "user": "Nicollas Vaillant",
//         "date": DateTime(14, 06, 2021),
//       },
//       {
//         "user": "Eduardo Cardozo",
//         "date": DateTime(14, 06, 2021),
//       },
//       {
//         "user": "Gustavo Gobbi",
//         "date": DateTime(14, 06, 2021),
//       },
//       {
//         "user": "Lucas Martinz",
//         "date": DateTime(14, 06, 2021),
//       },
//       {
//         "user": "Vitória Fonseca",
//         "date": DateTime(14, 06, 2021),
//       },
//       {
//         "user": "Eliana Batista",
//         "date": DateTime(14, 06, 2021),
//       },
//     ];

//     return ListView.separated(
//       shrinkWrap: true,
//       itemCount: viewers.length,
//       separatorBuilder: (context, i) {
//         return Divider(color: Colors.black,);
//       },
//       itemBuilder: (context, i) {
//         String date = "${"0" * (2 - viewers[i]["date"].day.toString().length)}${viewers[i]["date"].day}/${"0" * (2 - viewers[i]["date"].month.toString().length)}${viewers[i]["date"].month}/${viewers[i]["date"].year}";
//         return Container(
//           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           child: Text("${viewers[i]["user"]} ($date)"),
//         );
//       },
//     );
//   }

//   void _definePageAttributes() {
//     bottomButtonLabel = "Visualizar";

//     switch (listingPageType) {
//       case ListingPageType.rating:
//         title = "Listar avaliações";
//         topWidget = _dateTimeTextField();
//         listWidget = _ratingList();
//         break;
//       case ListingPageType.view:
//         title = "Listar visualizações";
//         topWidget = _authorNameDropdown();
//         listWidget = _visualizationList();
//         break;
//     }

//     listTypeText = "Por ";
//     switch (listingPageBy) {
//       case ListingPageBy.bookAndTime:
//         listTypeText += "livro e período de tempo";
//         break;
//       case ListingPageBy.writerAndTime:
//         listTypeText += "escritor e período de tempo";
//         break;
//       case ListingPageBy.readerAndTime:
//         listTypeText += "leitor e período de tempo";
//         break;
//       case ListingPageBy.writer:
//         listTypeText += "escritor";
//         break;
//       case ListingPageBy.book:
//         listTypeText += "livro";
//         break;
//     }
//   }
// }