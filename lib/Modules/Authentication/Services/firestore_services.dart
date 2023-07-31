import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  saveData() async {
    Map<String, dynamic> data = {
      "name": "ALI",
      "age": 11,
      "isVerified": false,
      "subjects": [
        "Eng",
        "URD",
        "PHY",
      ],
    };

    await FirebaseFirestore.instance.collection("users").doc("1").set(data);
  }

  updateData() async {
    Map<String, dynamic> data = {
      "name": "Kashif",
      "age": 22,
      // "isVerified": true,
      "subjects": [
        "URD",
        "PHY",
      ],
      "Uni": "KFUEIT"
    };

    // await FirebaseFirestore.instance.collection("users").doc("1").update(data);
    await FirebaseFirestore.instance
        .collection("users")
        .doc("1")
        .set(data, SetOptions(merge: true));
  }

  delete() async {
    ///Delete a doc

    // await FirebaseFirestore.instance.collection("users").doc("1").delete();

    ///Delete all docs
    // var collection = FirebaseFirestore.instance.collection('users');
    // var snapshots = await collection.get();
    // for (var doc in snapshots.docs) {
    //   await doc.reference.delete();
    // }
    ///Delete  doc where uni = KFUEIT
    var collection = FirebaseFirestore.instance
        .collection('users')
        .where("Uni", isEqualTo: "KFUEIT");
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  getData() async {
    ///Get A Doc

    // DocumentSnapshot documentSnapshot =
    //     await FirebaseFirestore.instance.collection("users").doc("1").get();
    // if (documentSnapshot.exists) {
    //   print(documentSnapshot.data);
    //   print(documentSnapshot.id);
    //   print(documentSnapshot.get("name"));
    //   print(documentSnapshot.get("age"));
    //   print(documentSnapshot.get("subjects"));
    // print(getFromFirebase(documentSnapshot.data()));
    // print(documentSnapshot.get("dbkj"));
    // }

    ///GET ALL Docs
    // QuerySnapshot snapshot =
    //     await FirebaseFirestore.instance.collection("users").get();
    // print(snapshot.size);
    // print(snapshot.docs);
    // for (var doc in snapshot.docs) {
    //   print(doc.data());
    // }
    ///GET ALL Docs where uni =IUB
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("Uni", isEqualTo: "KFUEIT")
        .get();
    print(snapshot.size);
    print(snapshot.docs);
    for (var doc in snapshot.docs) {
      print(doc.data());
    }
  }

// getFromFirebase(dynamic data) {
//   return data["dlfkbd"]??"vme vj";
// }
}