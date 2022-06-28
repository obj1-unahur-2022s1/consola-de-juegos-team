import wollok.game.*
import snake.*
import food.*
import menu.*


object juego {
//	method start() {
//		game.start()
//	}
	
	method configure() {
		game.title("Snake Game")
//		game.boardGround("fondo.png")
//		game.width(32)
//		game.height(32)
//		game.cellSize(16)
		
		// Visuales
		game.addVisual(snake)
		game.addVisual(new Food())
		game.addVisual(new Insecto())
		game.addVisual(new Rayo(position = game.at(0,0)))
		game.addVisual(puntos)
		
		
		// Colisiones
		game.onCollideDo(snake, {obstacle => obstacle.onCollide()})
	}
}


object sonido {
	var musicVolume = 0.1
	var sfxVolume = 0.25
	
	const gameplayMusic = self.music("gameplay")
	const gameOverMusic = self.music("gameover")
	
	method music(name) {
		 const sound = game.sound("audio/music/" + name + ".mp3")
		 sound.shouldLoop(true)
		 sound.volume(musicVolume)
		 return sound
	}
	
	method effect(name){
		const sound = game.sound("audio/sfx/" + name + ".mp3")
		sound.volume(sfxVolume)
		return sound
	}
	
	method pop() { self.playSound([self.effect("pop1"), self.effect("pop2")].anyOne()) }
	
	method spider() { self.playSound(self.effect("spider")) }
	
	method playSound(sound){ game.schedule(0, {sound.play()}) }
	
	method setup() {
		game.schedule(500, {gameplayMusic.play()})
	}
	
	
}

object puntos {
	
	var cantidadPuntos = 0
	
	method position() = game.at(1,game.height()-3)
	
	method cantidadPuntos() = cantidadPuntos
	
	method sumarPuntos(puntos) { cantidadPuntos += puntos }
	
	method text() = self.cantidadPuntos().toString() + " puntos"
	
	method onCollide(){}
	
}
