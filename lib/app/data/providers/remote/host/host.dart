part of '../../providers_impl.dart';

class Host {
  //se utiliza el onlyUrl para no incluir el segmento
  // api/v1/siipne-movil/


  static getDes() {
    // return "https://192.168.80.71/";
    return "https://siipne3wv2.policia.gob.ec/";
    return "https://des.policia.gob.ec/";
  }

  static getTest() {
    //return "https://192.168.80.75/";
    //return "https://test.policia.gob.ec/";
    return "https://test.policia.gob.ec/";
  }

  static getProd() {
    return "https://siipne.policia.gob.ec/";
  }


  static gethost({bool onlyUrl = false}) {
    String url = '';


    String path = "appmovil/ipat/index.php";
    if(onlyUrl){
      path='';
    }
    switch (AppConfig.AmbienteUrl) {
      case Ambiente.desarrollo:
        url = getDes() + path; //Desarrollo

        break;
      case Ambiente.prueba:
        url = getTest() + path; //Pruebas

        break;
      case Ambiente.produccion:
        url = getProd() + path; //Produccion

        break;
    }
    return url;
  }



  static getAmbiente() {
    String ambiente = '';
    switch (AppConfig.AmbienteUrl) {
      case Ambiente.desarrollo:
        ambiente = "Desc"; //Desarrollo

        break;
      case Ambiente.prueba:

        ambiente="Test";
        break;
      case Ambiente.produccion:
        ambiente = "Prod"; //Produccion

        break;
    }
    return ambiente;
  }






}
