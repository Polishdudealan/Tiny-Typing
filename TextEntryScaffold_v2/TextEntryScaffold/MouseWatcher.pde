class MouseWatcher{
	float pressX, pressY;
	float releaseX, releaseY;
	float sideLength;

	float xDiff, yDiff;

	boolean inRegion;

	MouseWatcher(float sideLength){
		
		//sideLenth is number of pixels per inch
		this.sideLength = sideLength;
		inRegion = false;
	}

	void reset(){
		onMousePressed();
		onMouseReleased();
		inRegion = false;
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

		print("Mouse released with xDiff " + xDiff + " yDiff" + yDiff +" " + abs(yDiff) );
		
	}

	boolean isySwipe(){
		return abs(yDiff) > sideLength/4;
	}

	boolean isxSwipe(){
		return abs(xDiff) > (sideLength/3);
	}

	boolean isLeftSwipe(){
    	return isxSwipe() && xDiff < 0; 
	}

	boolean isRightSwipe(){
		return isxSwipe() && xDiff > 0;
	}



}
