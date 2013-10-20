library gestioncontactexo6;
import 'dart:html';
//import 'dart:math';
//import 'dart:async';
import 'package:web_ui/web_ui.dart';

import 'package:dartlero/dartlero.dart';

part 'Contacts.dart';

String lis;
var contacts = new Contacts();
var fn = new FontOnclik();
init() {
  var ct1 = new Contact();
  ct1.cle = ('CO_'+(contacts.length+1).toString()+'_DO');
  ct1.nom = "DOSSOU";
  ct1.prenom = "Codjo";
  ct1.phone = "+22995067125";
  ct1.email = "doscodj@yahoo.fr";
  ct1.adresse = "Carre 721, gbegamey, 04 BP 1331, COTONOU BENIN";
  
  contacts.add(ct1);
  var ct2 = new Contact();
  ct2.cle = ('HA_'+(contacts.length+1).toString()+'_AG');
  ct2.nom = "AGROIA";
  ct2.prenom = "Harmeet";
  ct2.phone = "+33671949662";
  ct2.email = "harm@yahoo.fr";
  ct2.adresse = "29 rue du prof Joseph Nicolas, 69008 Lyon France";
  contacts.add(ct2);
  
  var ct3 = new Contact();
  ct3.cle = ('SE_'+(contacts.length+1).toString()+'_TO');
  ct3.nom = "TOUDJI";
  ct3.prenom = "Sestane";
  ct3.phone = "+15817775593";
  ct3.email = "sestanetoudji@yahoo.fr";
  ct3.adresse = "2592 RUE DE LA VENDEE, QC G1T 1B6";
  
  contacts.add(ct3);
}
 display() {
  String list = '''<table align=center border=1><tr><th>Num</th><th>Nom</th><th>Prenom</th><th>Phone</th><th>E-Mail</th><th>Adresse</th><th>Mod</th><th>Supp</th></tr>''';
  var clor="#c8bfe7";
  for (var contact in contacts) {
    var att1 = '_'+contact.cle;
    if(clor=="#c8bfe7")
    {clor="#FFC2A6";}else{clor="#c8bfe7";}
    var alink = '''
    <tr><td bgcolor="${clor}">${contact.cle}</td>
        <td bgcolor="${clor}">${contact.nom}</td>
        <td bgcolor="${clor}">${contact.prenom}</td>
        <td bgcolor="${clor}">${contact.phone}</td>
        <td bgcolor="${clor}">${contact.email}</td>
        <td bgcolor="${clor}">${contact.adresse}</td> 
    <td bgcolor="${clor}"><a href="#"  title="${contact.cle}" ><img src="image/modifier.gif" id="${contact.cle}" name="${contact.cle}"  border=0></a></td>
    <td bgcolor="${clor}"><a href="#"  title="${contact.cle}" ><img src="image/supprimer.gif" id="${att1}" alt="${contact.cle}" border=0></a></td></tr>''';
    list = '$list ${alink}';
    
  } 
  var alink= '<tr><td colspan=8>-</td></tr><tr><td colspan=8 align="right"><input type="button" id="NvAjout" value="Nouveau Ajout" /> </td></tr></table>';
  list = '$list ${alink}';
  
  // the HTML library defines a global "document" variable
  document.query('#sample_container_id').innerHtml = list;
 
  for (var contact in contacts) {
    var att = '#'+contact.cle;
    var att1 = '#_'+contact.cle;
    query(att).onClick.listen(mdf);
    query(att1).onClick.listen(spm);
  }
  query('#NvAjout').onClick.listen(NvAjout);
  document.query('#sample_container_id2').innerHtml = '';
}

// -------- DEBUT NOUVEAU ENREGISTREMENT-------
// BOUTON POUR APPEL DU FORMULAIRE D'AJOUT D'UN NOUVEAU CONTACT
void NvAjout(MouseEvent event) {
  misAjout(null,null,null,null,null,null,'NOUVEAU');
 //window.alert("Gilo");
}

 void mdf(Event event) {
   //(event.target as ImageElement).id; 
   //window.alert((event.target as ImageElement).id);
   var id = (event.target as ImageElement).id;
  contactModif(id);
}
 void spm(Event event) {
   //(event.target as ImageElement).id; 
   if (window.confirm("Confirmez la suppression?"))
   {
    var id = (event.target as ImageElement).alt;
    supp(id);
    window.alert("Suppression effectuee avec succes");
  }
}
// BOUTON QUI AJOUTE UN NOUVEAU CONTACT
void ajouter(MouseEvent event){
  
  InputElement names =query('#noms');
  InputElement surname = query('#prenoms');
  InputElement numbers = query('#phones');
  InputElement mail = query('#emails');
  TextAreaElement adresse = query('#adresses');
  var contactCount = contacts.length; 
  var contact = new Contact();
  contact.cle = surname.value.trim()[0]+surname.value.trim()[1]+'_'+(contacts.length+1).toString()+'_'+names.value.trim()[0]+names.value.trim()[1];
  contact.nom = names.value.trim();
  contact.prenom = surname.value.trim();
  contact.phone = numbers.value.trim();
  contact.email = mail.value.trim();
  contact.adresse = adresse.value.trim();
  contacts.add(contact);
  display();
}
// -------- FIN NOUVEAU ENREGISTREMENT-------

// --------DEBUT MODIFICATION---------------- 
// FONCTION QUI APPEL L'INSTANT DE CONTACT A MODIFIE
contactModif(ids)
{
  var contact = contacts.find(ids.toString());
  var ContactCount = contacts.length;
  misAjout(ids,contact.nom,contact.prenom,contact.phone,contact.email,contact.adresse,'MODIFIER');
}
//BOUTON QUI VALIDE LA MODIFICATION
void modifier(MouseEvent event){
  InputElement cle =query('#Numr');
  InputElement names =query('#noms');
  InputElement surname = query('#prenoms');
  InputElement numbers = query('#phones');
  InputElement mail = query('#emails');
  TextAreaElement adresse = query('#adresses');
  var contact = contacts.find(cle.value.toString());
  var ContactCount = contacts.length;
  contact.nom = names.value.trim();
  contact.prenom = surname.value.trim();
  contact.phone = numbers.value.trim();
  contact.email = mail.value.trim();
  contact.adresse = adresse.value.trim();
  //contacts.remove(contact);
  contacts.add(contact);
  display();
}
//-------- FIN MODIFICATION--------------



// --------- DEBUT SUPPRESSION-------------
//void supprimer(MouseEvent event){
  //supp(1);
//}
//------- FONCTION DE SUPPRESSION D'UNE INSTANT DE CONTACT
supp(non)
{ 
  var contact = contacts.find(non.toString());
  var ContactCount = contacts.length;
  contacts.remove(contact);
  display(); 
}
//--------- FIN SUPPRESSION-------------------



//FONCTION DE MISE A JOUR (NOUVEAU CONTACT OU MODIFICATION DE CONTACT)

void misAjout(ids,names,surnames,tel,couri,adres,type)
{
  var nm, btn;
  if(type=='NOUVEAU')
  {
    nm=contacts.length+1;
    btn='''<input type="button" name="ajouter" id="ajouter" value="AJOUTER">''';
  } else {
    nm=ids;
    btn='''<input type="button" name="modifier" id="modifier" value="MODIFIER">''';
  } 
   lis = '''<form><table align=center border=1 class="autre"><tr><td colspan=2><h1>${type}</h1></td></tr>
      <tr><td>Numero </td> <td><input type="text" disabled="disabled" name="numr" id="Numr" value="${nm}"></td></tr>
      <tr><td>Nom </td> <td><input type="text"  name="noms" id="noms" value="${names}" /></td></tr>
      <tr><td>prenom </td> <td><input type="text"  name="prenoms" id="prenoms" value="${surnames}" /></td></tr>
      <tr><td>Phone </td> <td><input type="text"  name="phones" id="phones" value="${tel}" /></td></tr>
      <tr><td>Email </td> <td><input type="text"  name="emails" id="emails" value="${couri}" /></td></tr>
      <tr><td>Adresse </td> <td><textarea  name="adresses" id="adresses" />${adres}</textarea></td></tr>
<tr><td colspan=2>-</td></tr>
<tr><td colspan=2 align=right>${btn}<input type="reset" name="annuler" id="annuler" value="Annuler"></td></tr>
</table></form>
    ''';
 document.query('#sample_container_id2').innerHtml = lis;
 if(type=='NOUVEAU')
 {query('#ajouter').onClick.listen(ajouter);} else {
 query('#modifier').onClick.listen(modifier); } 
 
}
class FontOnclik extends WebComponent {
  test(non){ document.query('#sample_container_id2').innerHtml =non;}
}



void main() {
  init();
  display();
}