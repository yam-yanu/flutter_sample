import 'dart:async';

import 'package:firebase/firestore.dart';
import 'package:flutter_sample/model/skill.dart';
import 'package:flutter_sample/model/user.dart' as UserModel;
import 'package:flutter_web/material.dart';
import 'package:flutter_sample/model/activity.dart';
import 'package:firebase/firebase.dart';

class ActivityBloc {
  StreamController<String> _searchActivitiesController = StreamController<String>();
  StreamController<List<Activity>> _activitiesController = StreamController<List<Activity>>();
  StreamController<Activity> _activityController = StreamController<Activity>();
  Map<String, Activity> _activities = {};

  StreamSink<String> get searchActivities => _searchActivitiesController.sink;
  Stream<List<Activity>> get activities => _activitiesController.stream;

  ActivityBloc() {
    _searchActivities('');

    _searchActivitiesController.stream.listen((word) {
      _searchActivities(word);
    });

    this._activitiesController
        .stream
        .transform(
          StreamTransformer<List<Activity>, List<Activity>>.fromHandlers(
            handleData: (List<Activity> activities, EventSink sink) {
              activities.forEach((Activity activity) {
                this._activities[activity.reference.id] = activity;
              });
              sink.add(this._activities.values.toList());
            }
          )
        );
    this._activityController.stream.listen((Activity activity) {
      this._activitiesController.sink.add([activity]);
    });
  }

  void dispose() {
    _searchActivitiesController.close();
    _activitiesController.close();
    _activityController.close();
  }

  void _searchActivities(String word) async {
    firestore().collection('Activity').onSnapshot.listen((QuerySnapshot snapshots) {
      snapshots.forEach((DocumentSnapshot activitySnapshot) {
        Future skillNeedsFuture = activitySnapshot.ref
          .collection('skillNeeds')
          .get()
          .then((QuerySnapshot skillNeedsSnapshots) {
            return skillNeedsSnapshots.docs.map((DocumentSnapshot skillSnapshot) {
              return Skill.fromSnapshot(skillSnapshot);
            }).toList();
          });

        Future userFuture = firestore()
          .collection('User')
          .doc(activitySnapshot.data()['userMainRef'].id)
          .get()
          .then((DocumentSnapshot userSnapshot) {
            return UserModel.User.fromSnapshot(userSnapshot);
          });

        Future.wait([skillNeedsFuture, userFuture]).then((List results) {
          this._activityController.sink.add(Activity.fromSnapshot(activitySnapshot, results[0], results[1]));
        });
      });
    });
  }
}

class ActivityProvider extends InheritedWidget {
  ActivityProvider({
    Key key,
    ActivityBloc activityBloc,
    Widget child,
  })  : activityBloc = activityBloc ?? ActivityBloc(),
        super(key: key, child: child);

  final ActivityBloc activityBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ActivityBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ActivityProvider) as ActivityProvider)
          .activityBloc;
}
