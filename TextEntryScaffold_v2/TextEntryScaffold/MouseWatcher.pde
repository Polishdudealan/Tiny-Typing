class MouseWatcher{
	float pressX, pressY;
	float releaseX, releaseY;



	void onMousePressed(){
		pressX = mouseX;
		pressY = mouseY;
	}

	void onMouseReleased(){
		releaseX = mouseX;
		releaseY = mouseY;
	}



}
