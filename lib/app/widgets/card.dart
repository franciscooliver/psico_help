import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:psico_help/app/core/interfaces/preferences_repository.dart';
import 'package:psico_help/app/widgets/CustomDialog.dart';

class CustomCard extends StatelessWidget {
  final NetworkImage image;
  final String title;
  final String description;
  final String extraDescription;
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
      this.isThreeLine, this.onTapCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _alert(context);
        // title ==  'Conte sua história' ? showContent(context) : onTapCard();
        switch (title) {
          case 'Conte sua história' :
            showContent(context);
            break;

          case 'Depoimentos':
            Navigator.pushNamed(context, '/content');
            break;

          default:
            onTapCard();


        }
      },
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.only(right: 5.0),
        constraints: BoxConstraints(
          minHeight: 75.0
        ),
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
                      icon: Icon(Icons.arrow_forward_ios, size: 15.0,),onPressed: (){}),
                  visible: showRating != null,
                  child: RatingBar(
                    initialRating: 3,
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
                      print(rating);
                    },
                  ),
                ),
                leading: CircleAvatar(
                  radius: 29.0,
                  backgroundImage: image,
                  child: image == null 
                  ? Text(firstLetter(this.title))
                  : Text(''),
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
                  softWrap: true,
                  maxLines: 4,
                  textAlign: TextAlign.left,
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


  _alert(context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: "Success",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        negativeBtnText: "Fechar",
        positiveBtnText: "Continuar",
        positiveBtnOnPressed: () {
          Navigator.pushNamed(context, '/content');
        },
      ),
    );
  }

  firstLetter(String text){
    List<String> chars = text.trim().split('');
    return chars[0];
  }
}
