import wollok.game.*
import snake.*
import gameManager.*

object mainMenu {

	method iniciar() {
		game.addVisual(fondoMenu)
		game.addVisual(iniciarJuego)
		game.addVisual(controles)
		game.addVisual(salir)
		game.addVisual(selector)
		self.controles()
	}

	method controles() {
		keyboard.w().onPressDo({ selector.subir()})
		keyboard.s().onPressDo({ selector.bajar()})
		keyboard.e().onPressDo({ controles.close()})
		keyboard.enter().onPressDo({ selector.seleccion().iniciar()})
	}
}

object selector {

	var opciones = [ iniciarJuego, controles, salir ]
	const property image = "selector.png"

	method position() = game.at(self.seleccion().position().x(),self.seleccion().position().y())


	method seleccion() = opciones.head()

	method bajar() {
		const seleccionActual = self.seleccion()
		opciones.remove(seleccionActual)
		opciones.add(seleccionActual)
	}

	method subir() {
		const ultimaSeleccion = opciones.last()
		opciones.remove(ultimaSeleccion)
		opciones = [ ultimaSeleccion ] + opciones
	}

}

object iniciarJuego {

	const property position = game.at(2,18)

	method image() {
		return "iniciar.png"
	}

	method iniciar() {
		game.clear()
		juego.configure()
		snake.initialize()
		sonido.setup()
	}
	
	method onColiide(){}

}

object controles {

	const property position = game.at(2,14)

	method image() {
		return "controles.png"
	}

	method iniciar() {
		game.addVisual(menuControles)
	}

	method close() {
		game.removeVisual(menuControles)
	}
	
	method onCollide(){}

}

object salir {

	const property position = game.at(2,10)

	method image() {
		return "salir.png"
	}

	method iniciar() {
		game.stop()
	}
	
	method onCollideDo(){}

}


object menuControles {

	const property position = game.at(0,0)

	method image() {
		return "controless.png"
	}

}

object endMenu {

	method iniciar() {
		game.clear()
		game.addVisual(gameOver)
		self.terminarJuego()
	}

	method terminarJuego() {
		keyboard.q().onPressDo({ game.stop()})
		
	}
}

object gameOver {
	
	method image() = "youDie.png"
	method position() = game.at(0, 0)
	
}

object fondoMenu {
	
	method image() = "menu.png"
	method position() = game.at(0, 0)
	
}