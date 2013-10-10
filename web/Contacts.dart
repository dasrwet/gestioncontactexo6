part of gestioncontactexo6;

var contacts = new List();

init() {
  var ct1 = new Contact();
  ct1.cle = (contacts.length+1).hashCode;
  ct1.nom = "DOSSOU";
  ct1.prenom = "Codjo";
  ct1.phone = "+22995067125";
  ct1.email = "doscodj@yahoo.fr";
  contacts.add(ct1);
  var ct2 = new Contact();
  ct2.cle = (contacts.length+1).hashCode;
  ct2.nom = "AGROIA";
  ct2.prenom = "Harmeet";
  ct2.phone = "+33671949662";
  ct2.email = "harm@yahoo.fr";
  contacts.add(ct2);
  
  var ct3 = new Contact();
  ct3.cle = (contacts.length+1).hashCode;
  ct3.nom = "TOUDJI";
  ct3.prenom = "Sestane";
  ct3.phone = "+15817775593";
  ct3.email = "sestanetoudji@yahoo.fr";
  contacts.add(ct3);
}

class Contact {
  var cle, nom, prenom, phone, email;
}


 
