class ClickableRect{
    //class that creates draws a rectangle and can check if the mouse if in that rectangle
    float xCor, yCor, rectWidth, rectHeight;
    color rectColor;
    String drawText = "";
    

    ClickableRect(float xCor, float yCor, float rectWidth, float rectHeight){
        this.xCor = xCor;
        this.yCor = yCor;
        this.rectWidth = rectWidth;
        this.rectHeight = rectHeight;
        this.rectColor = GRAY; //default color
    }

    ClickableRect(float xCor, float yCor, float rectWidth, float rectHeight, color rectColor){
        this.xCor = xCor;
        this.yCor = yCor;
        this.rectWidth = rectWidth;
        this.rectHeight = rectHeight;
        this.rectColor = rectColor;
    }

    ClickableRect(float xCor, float yCor, float rectWidth, float rectHeight, String text){
        this.xCor = xCor;
        this.yCor = yCor;
        this.rectWidth = rectWidth;
        this.rectHeight = rectHeight;
        this.rectColor = WHITE; //if text is added, default to white fill
        this.drawText = text;
    }


    void draw(){
        //draw the rectangle
        stroke(0);
        strokeWeight(1);
        fill(rectColor);
        rect(xCor, yCor, rectWidth, rectHeight);
        if(drawText != ""){
            drawCenterText();
        }
    }


    boolean mouseInRegion(){
        return (mouseX > xCor && mouseX < xCor+rectWidth 
            && mouseY > yCor && mouseY < yCor+rectHeight);
    }


    void drawCenterText(){
        //draws text in center of rectangle
        textAlign(CENTER);
        //textFont(createFont("NotoSans-Regular.ttf", 100 * displayDensity));
        //textSize(int(rectWidth*.2)); //scale to rectangle width
        fill(BLACK);
        text(drawText, int(xCor+rectWidth*.5), int(yCor+rectHeight*.5)); //center in rect
    }


}