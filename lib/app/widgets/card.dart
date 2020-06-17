import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/core/interfaces/preferences_repository.dart';
import 'package:psico_help/app/core/repositories/content_repository.dart';
import 'package:psico_help/app/model/content.model.dart';
import 'package:psico_help/app/model/testimony.model.dart';
import 'package:psico_help/app/widgets/custom_dialog.dart';

class CustomCard extends StatelessWidget {
  final NetworkImage image;
  final String title;
  final String description;
  final String extraDescription;
  final Content content;
  final Testimony testimony;
  final int index;
  final dense;
  final isThreeLine;
  final bool showRating;
  final Function onTapCard;

  const CustomCard(
      {Key key,
      this.image,
      @required this.title,
      @required this.description,
      this.extraDescription,
      this.index,
      this.dense,
      this.showRating,
      this.isThreeLine,
      this.onTapCard,
      this.content,
      this.testimony})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _alert(context);
        // title ==  'Conte sua história' ? showContent(context) : onTapCard();
        switch (title) {
          case 'Conte sua história':
            showContent(context);
            break;

          case 'Depoimentos':
            Navigator.pushNamed(context, '/content');
            break;

          default:
            onTapCard(content: content, testimony: testimony);
        }
      },
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.only(right: 5.0),
        constraints: BoxConstraints(minHeight: 75.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withAlpha(30),
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
                  offset: Offset(
                    15.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 5 Vertically
                  )),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 10,
              child: ListTile(
                trailing: Visibility(
                  replacement: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15.0,
                      ),
                      onPressed: () {}),
                  visible: showRating != null,
                  child: RatingBar(
                    initialRating: content != null ? content.rating / 5 : 0.0,
                    minRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      double doubleRating = double.parse(rating.toString());
                      if (content != null) {
                        Modular.get<ContentRepository>().sendRating(
                            content.documentId, doubleRating.toInt());

                        _alert(
                            message:
                                "Obrigado por avaliar nosso conteúdo \n Você avaliou com nota: ${rating.toInt()}",
                            context: context,
                            positiveBtnText: 'OK',
                            positiveBtnOnPressed: () {
                              Navigator.of(context);
                            },
                            color: Consts.end,
                            topChild: Icon(
                              Icons.thumb_up,
                              size: 50.0,
                            ));
                      }
                    },
                  ),
                ),
                leading: CircleAvatar(
                  radius: 29.0,
                  backgroundImage: image,
                  child:
                      image == null ? Text(firstLetter(this.title)) : Text(''),
                ),
                // contentPadding: const EdgeInsets.all(15.0),

                title: Text(
                  this.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff59474b)),
                ),

                subtitle: Text(
                  this.description,
                  maxLines: 4,
                  textAlign: TextAlign.left,
                  textScaleFactor: 0.8,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: const Color(0xff99a2b3)),
                ),
                dense: dense ?? dense,
                isThreeLine: isThreeLine ?? false,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showContent(context) async {
    var firestore = await FirebaseAuth.instance.currentUser();
    // var isAdmin = await Modular.get<IPreferences>().getBool('IS_ADMIN');

    Modular.get<IPreferences>().getUser().then((value) => {
          (value.object != null || firestore != null)
              ? Navigator.pushNamed(context, '/content/create')
              : Navigator.pushReplacementNamed(context, '/signin')
        });
  }

  _alert(
      {context,
      title,
      message,
      negativeBtnText,
      positiveBtnText,
      positiveBtnOnPressed,
      color,
      topChild}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: title ?? "",
        message: message ?? "",
        negativeBtnText: negativeBtnText ?? "Fechar",
        positiveBtnText: "Continuar",
        color: color ?? Colors.white,
        topChild: topChild ?? null,
        positiveBtnOnPressed: () {
          Navigator.pushNamed(context, '/content');
        },
      ),
    );
  }

  firstLetter(String text) {
    List<String> chars = text.trim().split('');
    return chars[0];
  }
}
