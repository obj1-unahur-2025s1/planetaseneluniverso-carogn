import construcciones.*

class Persona{
  var cantMonedas=20
  var edad

  method recurso()=cantMonedas
  method edad()=edad
  method esDestacada(){
    return self.edad().between(18, 65) || self.recurso()>30
  }

  method gastarMonedas(unaCantidad){
    cantMonedas=cantMonedas-unaCantidad
  }

  method ganarMonedas(unaCantidad){
    cantMonedas=cantMonedas+unaCantidad
  }

  method cumplirAños(){
    edad=edad-1
  }
}

class Productor inherits Persona {
  var tecnicas = ["cultivo"]
  var planetaDondeVive

  override method recurso() = super() * tecnicas.size()

  override method esDestacada() {
    return super() || tecnicas.size() > 5
  }

  method aprenderTecnica(unaTecnica) {
    tecnicas.add(unaTecnica)
  }

  method realizar(tecnica, tiempo) {
    if (tecnicas.contains(tecnica)) {
      self.ganarMonedas(tiempo * 3)
    } else {
      self.gastarMonedas(1)
    }
  }

  method trabajar(tiempo, planeta) {
    if (planeta == planetaDondeVive && not tecnicas.isEmpty()) {
      var ultima = tecnicas.last()
      self.realizar(ultima, tiempo)
    }
  }
}

class Constructor inherits Persona {
  var construccionesRealizadas = 0
  var region
  var planetaDondeVive

  override method recurso() = super() + (construccionesRealizadas * 10)

  override method esDestacada() = construccionesRealizadas > 5

  method construir(){
    construccionesRealizadas=construccionesRealizadas+1}

  method trabajar(tiempo, planeta) {
    self.gastarMonedas(5)
    construccionesRealizadas = construccionesRealizadas + 1

    var construccion = self.construccionSegunRegion(tiempo)
    planeta.construcciones().add(construccion)
  }

  method construccionSegunRegion(tiempo) {
    if (region == "montania") {
      return new Muralla(longitud=tiempo / 2)
    }
    else if (region == "costa") {
      return new Museo(superficie=tiempo, indiceImportancia=1)
    }
    else if (region == "llanura") {
      if (self.esDestacada()) {
        var nivel = (self.recurso() / 10).min(5).max(1)
        return new Museo(superficie=tiempo, indiceImportancia=nivel)
      } else {
        return new Muralla(longitud=tiempo / 2)
      }
    }
    else (region == "desierto") {
      // región nueva: construye muralla más chica
      return new Muralla(longitud=tiempo / 4)
    }
  }
}



