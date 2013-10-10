library gestioncontactexo6;
import 'dart:html';
//import 'dart:math';
//import 'dart:async';

part 'Contacts.dart';

String lis;
display() {
  String list = '''<table align=center border=1><tr><th>Num</th><th>Nom</th><th>Prenom</th><th>Phone</th><th>E-Mail</th><th>Mod</th><th>Supp</th></tr>''';
  for (var contact in contacts) {
    var alink = '''
    <tr><td>${contact.cle}</td>
        <td>${contact.nom}</td>
        <td>${contact.prenom}</td>
        <td>${contact.phone}</td>
        <td>${contact.email}</td> 
    <td><a href="#"  onClick="$test("contact.nom")"><img src="image/modifier.gif" border=0></a></td>
    <td><a href="#" onclick="${test(contact.cle)}"><img src="image/supprimer.gif" border=0></a></td></tr>''';
    list = '$list ${alink}';
  }
  var alink= '<tr><td colspan=7>-</td></tr><tr><td colspan=7 align="right"><input type="button" id="NvAjout" value="Nouveau Ajout" /> </td></tr></table>';
  list = '$list ${alink}';
  // the HTML library defines a global "document" variable
  document.query('#sample_container_id').innerHtml = list;
  query('#NvAjout').onClick.listen(NvAjout);
  //document.query('#sample_container_id2').innerHtml = list;
}
// ajout de nouveau conact
void nouveauAjout()
{
   lis = '''<table align=center border=1><tr><td colspan=2><h3>Nouveau</h3></td></tr>
      <tr><td>Numero </td> <td><input type="text" disabled="disabled" name="numr" id="Numr" value="${contacts.length+1}"></td></tr>
      <tr><td>Nom </td> <td><input type="text"  name="noms" id="noms" value="test"></td></tr>
      <tr><td>prenom </td> <td><input type="text"  name="prenoms" id="prenoms" ></td></tr>
      <tr><td>Phone </td> <td><input type="text"  name="phone" id="phones" ></td></tr>
      <tr><td>Email </td> <td><input type="text"  name="emails" id="emails" ></td></tr>
<tr><td colspan=2>-</td></tr>
<tr><td colspan=2 align=right><input type="button" name="ajouter" id="ajouter" value="AJOUTER"></td></tr>
</table>
    ''';
 document.query('#sample_container_id2').innerHtml = lis;
 query('#ajouter').onClick.listen(ajouter);
 
}
void ajouter(MouseEvent event){
  var contactCount = contacts.length;
  var contact = new Contact();
  contact.cle = contacts.length+1;
  contact.nom = document.getElementById('noms').text;
  contact.prenom = query('#prenoms').text;
  contact.phone = document.query('#phones').text.toString();
  contact.email = document.query('#emails').text.toString();
  var added = contacts.add(contact);
  display();
}
void NvAjout(MouseEvent event) {
  nouveauAjout();
}
void  test(num non)
{ var list =non;
  document.query('#sample_container_id2').innerHtml = list.toString();
 }

void main() {
  init();
  display();
 
}
/*void main() {
  query("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(reverseText);
}

void reverseText(MouseEvent event) {
  var text = query("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  query("#sample_text_id").text = buffer.toString();
}*/
