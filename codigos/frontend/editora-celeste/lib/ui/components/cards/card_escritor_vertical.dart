import 'package:editora_celeste/domain/entidades/Escritor.dart';
import 'package:editora_celeste/ui/pages/outros/writer_registration_page.dart';
import 'package:flutter/material.dart';

class CardEscritorVertical extends StatefulWidget {
  final Escritor escritor;
  const CardEscritorVertical(this.escritor, { Key? key }) : super(key: key);

  @override
  _CardEscritorVerticalState createState() => _CardEscritorVerticalState();
}

class _CardEscritorVerticalState extends State<CardEscritorVertical> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => WriterRegistrationPage(widget.escritor),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey[200]!
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          )
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 125,
              child: Stack(
                children: [
                  Container(
                    height: 95,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10)
                      )
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10)
                      ),
                      child: Opacity(
                        opacity: 0.4,
                        child: Image.network(
                          widget.escritor.imagem ?? "",
                          height: 95,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 45,
                      left: 20
                    ),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(120),
                      ),
                      color: Colors.red
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(80)
                      ),
                      child: Image.network(
                        widget.escritor.imagem ?? "",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.escritor.nomeArtistico!,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(widget.escritor.emailEscritor!),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}