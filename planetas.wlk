import personas.*
import construcciones.*

class Planeta {
  const habitantes = []
  const construcciones = []

  method sumarHabitantes(listaDeHabitantes){
    habitantes.addAll(listaDeHabitantes)
  }
  method construcciones()=construcciones
  method habitantesDestacados() = habitantes.filter({ h => h.esDestacada() })

  method habitanteConMas() = habitantes.max({ h => h.recurso() })

  method delegacionDiplomatica() {
    var delegacion = self.habitantesDestacados().asList()
    var maximo = self.habitanteConMas()

    if (not delegacion.contains(maximo)) {
      delegacion.add(maximo)
    }

    return delegacion
  }

  method esValioso() {
    return construcciones.sum({ c => c.valor() }) > 100
  }
}
