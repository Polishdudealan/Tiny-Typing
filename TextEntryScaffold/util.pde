HashMap<String, color> Colors = new HashMap<String, color>();

class Coordinate(){
    Coordinate(int x_, int y_){
        x = x_;
        y = y_
    }
    int x, y;
}
d = {'q': }
HashMap<char, ArrayList<int>> symbols = new HashMap<char, ArrayList<int>>(){
    add(new ArrayList<int>(100, 100)),
    add(new ArrayList<int>(50, 50))
}

Enum ButtonState{
    PRESSED,
    UNPRESSED
}

Enum PanelState{
    EXPANDED,
    COLLAPSED
}

class Color{
    Color(int red, int green, int blue){
        r = red;
        g = green;
        b = blue;
    }

    Color(int gray){
       r = gray;
       g = gray;
       b = gray; 
    }

    int r, g, b;

    color c = color(r, g, b);
}

class Panel{

    Panel(int xCoor, int yCoor, int xLength, int yLength){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = UNPRESSED;
        backgroundColor = color(200);
    }

    Panel(int xCoor, int yCoor, int xLength, int yLength, int backgndColor){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = UNPRESSED;
        backgroundColor = backgndColor
    }


    // Pass in relative x and y coordinates
    void addButton(int xCoor, int yCoor, int xLength, int yLength, color backgndColor_, char symbol, color symbolColor_){
        SymbolButton newButton = new SymbolButton(xCoor, yCoor, xLength, yLength, backgndColor_, symbol, symbolColor_);
        buttonList.add(newButton);
    }

    void draw(){
        if(state = EXPANDED){
            fill(background);
            rect(expandedPanelStartX, expandedPanelStartY, sizeOfInputArea, sizeOfInputArea * (3/4));
            drawPanelButtons();
        }
        else{ // COLLAPSED
            //draw the rectangle
            stroke(0);
            strokeWeight(5);
            fill(rectColor);
            rect(xCor, yCor, rectWidth, rectHeight);
        }
    }

    void drawPanelButtons(){
        for(button : buttonList){
            fill(button.backgroundColor);
            rect(x + button.x, y + button.y, button.xLen, button.yLen);
            fill(button.symbolColor.c);
            text(button.symbol, x + (button.x / 2.0), y + (button.y / 2.0));
        }

    }

    boolean mouseInRegion(){
        return (mouseX > xCor && mouseX < xCor+rectWidth 
            && mouseY > yCor && mouseY < yCor+rectHeight);
    }

    // Top left corner
    int x, y;
    int xlen, ylen;
    Panel state;
    color backgroundColor;

    ArrayList<SymbolButton> buttonList = new ArrayList<SymbolButton>();
}

class SymbolButton{

    SymbolButton(int xCoor, int yCoor, int xLength, int yLength){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = UNPRESSED;
    }

    SymbolButton(int xCoor, int yCoor, int xLength, int yLength, Color backgndColor){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = UNPRESSED;
        backgroundColor = backgndColor;
    }

    SymbolButton(int xCoor, int yCoor, int xLength, int yLength, color backgndColor, char symbol_, color symbolColor_){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = UNPRESSED;
        symbol = symbol_;
        symbolColor = symbolColor_
    }

    // x, y are relative coordinates to the panel class
    int x, y;
    int xlen, ylen;
    ButtonState state;
    char symbol;
    color backgroundColor;
    color symbolColor;
}