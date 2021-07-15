import 'package:editora_celeste/domain/entidades/Livro.dart';
import 'package:editora_celeste/ui/pages/livro/detalhes_livro.dart';
import 'package:editora_celeste/ui/pages/outros/book_registration_page.dart';
import 'package:flutter/material.dart';

class CardLivroVertical extends StatelessWidget {
  final Livro livro;
  const CardLivroVertical(this.livro, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context, 
        //   MaterialPageRoute(
        //     builder: (context) => DetalhesLivro(livro),
        //   ),
        // );
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => BookRegistrationPage(livro),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              width: 150,
              height: 266,
              child: Hero(
                tag: livro.imagemCapa!,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12)
                  ),
                  child: Image.network(
                    livro.imagemCapa!,
                    width: 150,
                    height: 266,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 195,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor.withOpacity(.2),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            livro.titulo!,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
                          ),
                          Text(
                            "${livro.tipoDeLivro!.genero!} - ${livro.tipoDeLivro!.subgenero!}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            livro.escritor!.nomeArtistico!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}