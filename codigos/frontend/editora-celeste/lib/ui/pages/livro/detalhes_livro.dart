import 'package:editora_celeste/domain/entidades/Livro.dart';
import 'package:flutter/material.dart';

class DetalhesLivro extends StatefulWidget {
  final Livro livro;
  const DetalhesLivro(this.livro, { Key? key }) : super(key: key);

  @override
  _DetalhesLivroState createState() => _DetalhesLivroState();
}

class _DetalhesLivroState extends State<DetalhesLivro> {
  @override
  Widget build(BuildContext context) {
    double tela = (MediaQuery.of(context).size.width / 2);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: 25
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.livro.imagemCapa!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12)
                    ),
                    child: Image.network(
                      widget.livro.imagemCapa!,
                      width: tela,
                      height: tela + (tela * (9/16)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30)
                ),
                color: Colors.grey[200]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.livro.titulo!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.livro.subtitulo!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withOpacity(.2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12)
                      ),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).accentColor
                      )
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.livro.escritor!.nomeArtistico!,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "${widget.livro.tipoDeLivro!.genero!} - ${widget.livro.tipoDeLivro!.subgenero!}"
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Capítulos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.separated(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.livro.qtdCapitulos!,
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(.2),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text("Capítulo ${++index}"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.share),
      ),
    );
  }
}