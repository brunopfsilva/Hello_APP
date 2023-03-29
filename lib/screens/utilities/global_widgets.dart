import 'package:flutter/material.dart';
import 'package:hello_app/screens/paycheck/paycheck_view_screen.dart';
import 'package:hello_app/screens/utilities/global_user.dart';
import '../../models/global_user_model.dart';
import '../../models/paychecks_model.dart';
import '../../models/terms_of_use_model.dart';
import '../../service/paycheks_service.dart' as apiPaycheck;
import 'package:hello_app/service/terms_of_use_service.dart' as termsUse;
import '../paycheck/widgets/paycheck_tile.dart';
import '../shared/global_title.dart';

class GlobalWidgets {
  Widget FutureWidgetGlobalUser(String message) {
    return FutureBuilder<GlobalUserModel>(
      future: GlobalUser().getUser(),
      builder: (BuildContext context, AsyncSnapshot<GlobalUserModel> snapshot) {
        if (snapshot.hasData) {
          return GlobalTitle(
              userName: snapshot.data!.userName,
              message: message,
              focusNode: FocusNode());
        } else {
          return SizedBox();
        }
      },
    );
  }
}

Widget FutureBuilderAccount(Function _refresh, BuildContext context) {
  return FutureBuilder<List<PaycheckModel>>(
    future: apiPaycheck.PaychecksService().ListPaycheck(),
    builder:
        (BuildContext context, AsyncSnapshot<List<PaycheckModel>> snapshot) {
      List<Widget> children;
      if (snapshot.hasData) {
        return ListView.separated(
          // controller: _scrollCtrl,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          itemCount: snapshot.data!.length,
          itemBuilder: (_, index) => PaycheckTile(
            title: snapshot.data![index].namePaycheck.toString(),
            subtitle: snapshot.data![index].subNamePaycheck.toString(),
            onPressedView: () async {
              print(snapshot.data![index].namePaycheck);
              String path = await apiPaycheck.PaychecksService()
                  .DownloadPaycheck(snapshot.data![index], _refresh);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaycheckViewScreen(
                      path: path,
                      title: snapshot.data![index].namePaycheck.toString()),
                ),
              );
            },
          ),
          separatorBuilder: (_, __) => Divider(
            color: Colors.grey.withOpacity(0.4),
            height: 0.0,
            thickness: 0.0,
          ),
        );
      } else if (snapshot.hasError) {
        children = <Widget>[
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Error: ${snapshot.error}'),
          )
        ];
      } else {
        children = const <Widget>[
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          ),
        ];
      }
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      );
    },
  );
}

FutureBuilder<TermsOfUseModel> FutureBuilderText(
    BuildContext context, int idCompany) {
  return FutureBuilder<TermsOfUseModel>(
      future: termsUse.TermsOfUseService.getTerm(idCompany),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(
              snapshot.data!.term,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}
