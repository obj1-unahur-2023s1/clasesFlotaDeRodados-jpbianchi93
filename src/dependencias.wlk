import rodados.*
import pedidos.*

class Dependencias {
	const flota = []
	const pedidos = []
	var property empleados
	
	method agregarAFlota(rodado){flota.add(rodado)}
	method quitarDeFlota(rodado){flota.remove(rodado)}
	method agregarPedido(unPedido){pedidos.add(unPedido)}
	method quitarPedido (unPedido){pedidos.remove(unPedido)}
	method pesoTotalFlota(){
		return flota.sum({r=>r.peso()})
	}
	method estaBienEquipada() {
		return (flota.size()>=3) && (flota.all({r=>r.velocidad()>=100}))
	}
	method capacidadTotalEnColor(color) {
		return flota.filter({r=>r.color()==color}).sum({r=>r.capacidad()})
	}
	method colorDelRodadoMasRapido() {
		return flota.max({r=>r.velocidad()}).color()
	}
	method capacidadFlota() {
		return flota.sum({r=>r.capacidad()})
	}
	method capacidadFaltante() {
		return 0.max(empleados-self.capacidadFlota())
	}
	method esGrande() {
		return empleados>=40 && flota.size()>=5
	}
	method totalPasajerosEnPedidos(){
		return pedidos.sum({p=>p.cantPasajeros()})
	}
	method hayAlgunRodadoQueSatisfaceUnPedido(unPedido){
		return flota.any({r=>unPedido.puedeSatisfacer(r)})
	}
	method pedidosNoPuedeSatisfacer(){
		return pedidos.filter({p=>not self.hayAlgunRodadoQueSatisfaceUnPedido(p)})
	}
	method todosLosPedidosTienenColorIncompatible(unColor){
		return pedidos.all({p=>p.colorIncompatible(unColor)})
	}
}
