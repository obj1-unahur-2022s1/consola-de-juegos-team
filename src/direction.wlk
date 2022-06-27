import wollok.game.*

class Direction2D {
	var randomize = true
	var direction = [0, 0]
	
	method initialize(){
		if(randomize) direction = self.random()
	}
	
	method random() = [self.up(), self.down(), self.left(), self.right()].anyOne()
	
	method x() = direction.get(0)
	method y() = direction.get(1)
	
	method set(newDirection) { direction = [newDirection.x(), newDirection.y()] }
	method dirOf(list) = new Direction2D(direction=list)
	
	method up() = [0, 1]
	method down() = [0, -1]
	method right() = [1, 0]
	method left() = [-1, 0]
	
	method setUp(){ direction = self.up() }
	method setDown(){ direction = self.down() }
	method setRight(){ direction = self.right() }
	method setLeft(){ direction = self.left() }
	
	method isOpposite(newDirection) = self.dirOf(newDirection).x() == -self.x() || self.dirOf(newDirection).y() == -self.y()
	
	override method toString() {
		var dir
		if(direction == self.up()) dir = "Up"
		if(direction == self.down()) dir = "Down"
		if(direction == self.right()) dir = "Right"
		if(direction == self.left()) dir = "Left"
		return dir
	}
}
