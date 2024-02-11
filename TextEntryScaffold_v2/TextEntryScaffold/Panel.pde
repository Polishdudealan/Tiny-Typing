class Panel extends ClickableRect {
    String letters;
    ArrayList<LetterButton> buttons;

    Panel(float xCor, float yCor, float rectWidth, float rectHeight, color rectColor, String letters){
        super(xCor, yCor, rectWidth, rectHeight, rectColor);
        setLetters(letters);
    }

    void setLetters(String letters){
        drawText = letters;
        this.letters = letters.replace("\n", "").replace(" ", "");
    }



    void setButtons(ArrayList<LetterButton> butts){
        buttons = butts;
        for(int i = 0; i < letters.length(); i++){//letters length should always be same as buttons length
            buttons.get(i).setSymbol(letters.charAt(i));
        }
    }

    void drawCenterText(){
        //draws text in center of rectangle
        textAlign(CENTER);
        //textFont(createFont("NotoSans-Regular.ttf", 100 * displayDensity));
        //textSize(int(rectWidth*.2)); //scale to rectangle width
        textLeading(80);
        fill(BLACK);
        text(drawText, int(xCor+rectWidth*.5), int(yCor+rectHeight*.25)); //center in rect
    }

    void drawButtons(){
        for(LetterButton b: buttons){
            b.draw();
        }
    }


}