class LetterButton extends ClickableRect {
    char symbol;
    LetterButton(float xCor, float yCor, float rectWidth, float rectHeight){
        super(xCor, yCor, rectWidth, rectHeight, color(200));
        setSymbol('!'); // no symbol set
    }

    LetterButton(float xCor, float yCor, float rectWidth, float rectHeight, color rectColor, char symbol){
        super(xCor, yCor, rectWidth, rectHeight, rectColor);
        setSymbol(symbol);
    }

    void setSymbol(char symbol){
        this.symbol = symbol;
        drawText = Character.toString(symbol);
    }

    char getSymbol(){
        return symbol;
    }
}