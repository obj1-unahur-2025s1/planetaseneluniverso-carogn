class Construccion{

}

class Muralla inherits Construccion{
  const longitud

  method valor()=longitud*10
}

class Museo inherits Construccion{
  const superficie
  const indiceImportancia

  method valor()=superficie*indiceImportancia
}