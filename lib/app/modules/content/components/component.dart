import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:psico_help/app/core/constantes.dart';
import 'package:psico_help/app/model/content.model.dart';
import 'package:psico_help/app/model/testimony.model.dart';
import 'package:psico_help/app/modules/content/widgets/child_testimonys_details.dart';
import 'package:psico_help/app/widgets/card.dart';

class Component {
  BuildContext ctx;

  BoxDecoration decoration() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Consts.start, Consts.end]),
    );
  }

  Widget nextedScroolView({
    ctx,
    scrollController,
    streamController,
    theme,
    height,
    top,
    isRounded
  }) {
    this.ctx = ctx;
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: theme,
            expandedHeight: height * .3,
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18.0,),
              onPressed: () {
                Navigator.of(context).pop();
              }),
            titleSpacing: 0.0,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              // print('constraints=' + constraints.toString());
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                centerTitle: true,
                title: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    //opacity: top == 80.0 ? 1.0 : 0.0,
                    opacity: 1.0,
                    child: Text(
                      'Depoimentos',
                      style: TextStyle(color: Colors.white),
                    )),
                background: Image.asset('assets/images/top_content_page03.png'),
              );
            }),
          ),
        ];
      },
      body: Container(
        height: height * .67,
        decoration: BoxDecoration(
            color: Color(0xfff5f2fa),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isRounded ? 60.0 : 0.0),
                topRight: Radius.circular(isRounded ? 60.0 : 0.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Observer(builder: (_) {
            List<Testimony> list = streamController.testimonyList.data;

            if (streamController.testimonyList.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Testimony testimony = list[index];
                String age = testimony.age > 0
                    ? ', ${testimony.age.toString()} anos'
                    : "";
                return CustomCard(
                    dense: true,
                    isThreeLine: true,
                    title: '${testimony.name}$age',
                    testimony: testimony,
                    description: testimony.body,
                    onTapCard: onTapCard);
              },
            );
          }),
        ),
      ),
    );
  }

  onTapCard({Content content, Testimony testimony}) {
    List<dynamic> dataArgs = [
      ChildTestimonysDetails(testimony: testimony,),
      testimony
    ];
    Navigator.pushNamed(ctx, '/content/details', arguments: dataArgs);
  }


}
