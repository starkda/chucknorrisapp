import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateLocal(String curJoke) async {
  content = await myFile.readAsString();
  if (content.isNotEmpty) {
    await myFile.writeAsString('$content\n$curJoke');
  }
  else {
    myFile.writeAsString(curJoke);
  }
}

Future<void> updateCloud(String curJoke) async {
  CollectionReference base = FirebaseFirestore.instance.collection('hime');
  DocumentSnapshot jokeDoc = await base.doc('VA4xNDZLN0YYpDi7L8oW').get();
  Map<String, dynamic> cur = jokeDoc.data() as Map<String, dynamic>;
  cur['joke'].add(curJoke);
  base.doc('VA4xNDZLN0YYpDi7L8oW').set(cur);
}

Future<void> setCloud() async{
  CollectionReference base = FirebaseFirestore.instance.collection('hime');
  DocumentSnapshot jokeDoc = await base.doc('VA4xNDZLN0YYpDi7L8oW').get();
  Map<String, dynamic> cur = jokeDoc.data() as Map<String, dynamic>;
  cur['joke'] = (await myFile.readAsString()).split('\n');
  base.doc('VA4xNDZLN0YYpDi7L8oW').set(cur);
}
Future<void> setLocal(Set<dynamic> jokes) async {
  await myFile.writeAsString('');
  for (String joke in jokes){
    if (joke.isNotEmpty){
    await updateLocal(joke);}
  }
}