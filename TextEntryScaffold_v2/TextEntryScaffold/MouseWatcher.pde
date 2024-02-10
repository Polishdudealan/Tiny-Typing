class MouseWatcher{
	float pressX, pressY;
	float releaseX, releaseY;
	float sideLength;

	float xDiff, yDiff;

	MouseWatcher(float sideLength){
		
		//sideLenth is number of pixels per inch
		this.sideLength = sideLength;
	}


	void onMousePressed(){
		pressX = mouseX;
		pressY = mouseY;
	}

	void onMouseReleased(){
		releaseX = mouseX;
		releaseY = mouseY;
		xDiff = releaseX - pressX;
		yDiff = releaseY - pressY;

		print("Mouse released with xDiff " + xDiff + " is swipe??" + isSwipe());
		
	}

	boolean isSwipe(){
		return abs(xDiff) > (sideLength/3);
	}

	boolean isLeftSwipe(){
    	return isSwipe() && xDiff < 0; 
	}

	boolean isRightSwipe(){
		return isSwipe() && xDiff > 0;
	}



}
