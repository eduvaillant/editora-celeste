import 'package:components_venver/material.dart';
import 'package:flutter/material.dart';

import 'add_rating_page.dart';
import 'book_registration_page.dart';
import 'book_type_registration_page.dart';
import 'chapter_registration_page.dart';
import 'city_registration_page.dart';
import 'favorite_registration_page.dart';
import 'insert_post_page.dart';
import 'listing_page.dart';
import 'login_page.dart';
import 'make_purchase_page.dart';
import 'neighborhood_registration_page.dart';
import 'reader_registration_page.dart';
import 'report_post_page.dart';
import 'subscription_type_registration_page.dart';
import 'uf_registration_page.dart';
import 'writer_registration_page.dart';

class ChooseScreen extends StatefulWidget {
  @override
  _ChooseScreenState createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolher tela"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _button("Login", LoginPage()),
            _button("Registrar leitor", ReaderRegistrationPage()),
            _button("Registrar livro", BookRegistrationPage()),
            _button("Registrar capítulo", ChapterRegistrationPage()),
            _button("Registrar UF", UfRegistrationPage()),
            _button("Registrar cidade", CityRegistrationPage()),
            _button("Registrar bairro", NeighborhoodRegistrationPage()),
            _button("Registrar tipo de livro", BookTypeRegistrationPage()),
            _button("Registrar tipo de assinatura", SubscriptionTypeRegistrationPage()),
            _button("Registrar escritor", WriterRegistrationPage()),
            _button("Adicionar avaliação", AddRatingPage()),
            _button("Cadastrar favorito", FavoriteRegistrationPage()),
            _button("Realizar pagamento", MakePurchasePage()), // ! Falta terminar
            _button("Inserir post", InsertPostPage()),
            _button("Denunciar post", ReportPostPage()),
            _button(
              "Listagem de avaliações\n(por livro e período de tempo)", 
              ListingPage(listingPageBy: ListingPageBy.bookAndTime, listingPageType: ListingPageType.rating),
            ),
            _button(
              "Listagem de avaliações\n(por escritor e período de tempo)", 
              ListingPage(listingPageBy: ListingPageBy.writerAndTime, listingPageType: ListingPageType.rating),
            ),
            _button(
              "Listagem de avaliações\n(por leitor e período de tempo)", 
              ListingPage(listingPageBy: ListingPageBy.readerAndTime, listingPageType: ListingPageType.rating),
            ),
            _button(
              "Listagem de visualizações\n(por escritor)", 
              ListingPage(listingPageBy: ListingPageBy.writer, listingPageType: ListingPageType.view),
            ),
            _button(
              "Listagem de visualizações\n(por livro)", 
              ListingPage(listingPageBy: ListingPageBy.book, listingPageType: ListingPageType.view),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String name, Widget page) {
    return OwButton(
      labelText: name,
      onPressed: () {
        // OwRouter.bottomStack(context, page);
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => page),
        );
      },
      margin: EdgeInsets.all(8),
    );
  }
}