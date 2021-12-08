extends TextureRect

var image
var size

var list = []
#sensitivity variable.
var s = 0.02

func _ready():
	ColorGrouping()

func ColorGrouping():
	
	calculate_appearance()
	#edit_pixels()
	
					
func calculate_appearance():
	var up
	var down
	var right
	var left
	var current
	
	image = self.texture.get_data()
	size = image.get_size()
	
	image.lock()
	
	
	for w in range(0,size.x):
		for h in range(0,size.y):
			
			#get up down left right pixels
			up = image.get_pixel(w,h-1)
			down = image.get_pixel(w,h+1)
			left = image.get_pixel(w-1,h)
			right = image.get_pixel(w+1,h)
			
			current = currentPixel.new()
			current.create(w,h,image.get_pixel(w,h))
			
			
			#and compare it with current.
			if image.get_pixel(w,h-1) != null:
				up = up.r - current.r + up.g - current.g + up.b - current.b
			if image.get_pixel(w,h+1) != null:
				down = down.r - current.r + down.g - current.g + down.b - current.b
			if image.get_pixel(w-1,h) != null:
				left = left.r - current.r + left.g - current.g + left.b - current.b
			
			if image.get_pixel(w+1,h) != null:
				right = right.r - current.r + right.g - current.g + right.b - current.b
			
			image.set_pixel(w,h,Color(1,1,1,1))
			
			
			#list for assembling similar appearances.
			for i in range(0,list.size()+1):
				if list.size() == 0:
					list.append([current])
				else:
					# if sum of biases is larger than sensitivity.
					if abs(list[i][0].r- current.r )+ abs(list[i][0].g - current.g)+ abs(list[i][0].b-current.b) > s:
						list[i].append(current)
					else:
						list.append([current])
						
	
	
				
func edit_pixels():
	
	image.lock()
	
	for i in list.size():
		for j in list[i].size():
			var pixel = list[i][j]
			var color = Color(pixel.r*0.1,pixel.g*0.1,pixel.b*0.1,pixel.a)
			image.set_pixel(list[i][j].x,list[i][j].y,color)
		
	var itex = ImageTexture.new()
	itex.create_from_image(image)
	self.set_texture(itex)
	
	image.unlock()	

class currentPixel:
	var w
	var h
	var color
	
	func getW() -> self.w:
		return w
	func getH() -> self.h:
		return h
	func getColor() -> color:
		return color
	func create(w,h,current):
		self.w = w
		self.h = h
		self.color = current
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
