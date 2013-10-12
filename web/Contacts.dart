part of gestioncontactexo6;

//var contacts = new List();
class Contact extends ConceptEntity<Contact>{
  var cles, nom, prenom, phone, email,adresse;
   get cle => cles;
  set cle(name) {
    cles = name;
    if (code == null) {
      code = cles.toString();
    }
  }
  Contact newEntity() => new Contact();
}

class Contacts extends ConceptEntities<Contact> {

  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();

}
 
