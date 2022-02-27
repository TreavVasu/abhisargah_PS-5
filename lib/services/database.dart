import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Database{
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  Future<void> setUserTestResult(List<int>?options , String group) async{
    User? user=FirebaseAuth.instance.currentUser;
    if(user==null)return ;
    String ?userId=user.uid;
    Map<String,dynamic>data={};
    data['options']=options;
    data['group']=group;

    List<dynamic>?userData=await getPastResultOfUser();
    try {
      if(userData==null){
        List<Map<String,dynamic>>newUserData=[];

        newUserData.add(data);
        await firestore.collection('users').doc(userId).set({
          'pastResult':newUserData
        });
      }
      else{
        userData.add(data);
        await firestore.collection('users').doc(userId).set({
          'pastResult':userData
        });
      }
    } on Exception catch (e) {
      // TODO
     rethrow;
    }

  }
  Future<List<dynamic>?> getPastResultOfUser()async{
    User? user=FirebaseAuth.instance.currentUser;
    if(user==null)return [];
    String userId=user.uid;
    DocumentSnapshot snapshot=await firestore.collection('users').doc(userId).get() ;
    Map<String,dynamic>?data=snapshot.data() as  Map<String ,dynamic>?;
    return  data ==null? null :data['pastResult']  ;
  }
}