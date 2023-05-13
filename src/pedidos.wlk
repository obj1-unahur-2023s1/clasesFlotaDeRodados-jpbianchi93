import rodados.*

class Pedidos {
	const property distancia
	var property tiempoMaximo
	const property cantPasajeros
	var property coloresIncompatibles = #{}
	
	method velocidadRequerida() {
		return distancia/tiempoMaximo
	}

	method puedeSatisfacer(unRodado){
		return 	unRodado.velocidad()>=self.velocidadRequerida() + 10 &&
				unRodado.capacidad()>=cantPasajeros &&
				not self.esteColorEsImpompatible(unRodado)
	}
	method esteColorEsImpompatible(unColor){
		return coloresIncompatibles.contains(unColor)
	}
}

