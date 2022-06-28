import wollok.game.*
import consola.*
import menu.*
import gameManager.*

class Juego {
	var property position = null
	var property color 
	
	method iniciar(){
        mainMenu.iniciar()	
	}
	
	method terminar(){

	}
	method image() = "juego" + color + ".png"
	

}
