import java.util.Map;
//HashMap<String, color> Colors = new HashMap<String, color>();

//class Coordinate(){
//    Coordinate(int x_, int y_){
//        x = x_;
//        y = y_;
//    }
//    int x, y;
//}
// d = {'q': }
//HashMap<char, ArrayList<int>> symbols = new HashMap<char, ArrayList<int>>(){
//    add(new ArrayList<int>(100, 100)),
//    add(new ArrayList<int>(50, 50))
//};

enum ButtonState{
    PRESSED,
    UNPRESSED
}

enum PanelState{
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

    Panel(float xCoor, float yCoor, float xLength, float yLength){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = PanelState.COLLAPSED;
        backgroundColor = color(200);
    }

    Panel(float xCoor, float yCoor, float xLength, float yLength, int backgndColor){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = PanelState.COLLAPSED;
        backgroundColor = backgndColor;
    }


    // Pass in relative x and y coordinates
    void addButton(float xCoor, float yCoor, float xLength, float yLength, color backgndColor_, char symbol, color symbolColor_){
        SymbolButton newButton = new SymbolButton(xCoor, yCoor, xLength, yLength, backgndColor_, symbol, symbolColor_);
        buttonList.add(newButton);
    }

    void draw(){
        if(state == PanelState.EXPANDED){
            fill(backgroundColor);
            rect(expandedPanelStartX, expandedPanelStartY, sizeOfInputArea, sizeOfInputArea * (3/4));
            drawPanelButtons();
        }
        else{ // COLLAPSED
            //draw the rectangle
            stroke(0);
            strokeWeight(5);
            fill(backgroundColor);
            rect(x, y, xLen, yLen);
        }
    }

    void drawPanelButtons(){
        for(SymbolButton button : buttonList){
            fill(button.backgroundColor);
            rect(x + button.x, y + button.y, button.xLen, button.yLen);
            fill(button.symbolColor);
            text(button.symbol, x + (button.x / 2.0), y + (button.y / 2.0));
        }

    }

    boolean mouseInRegion(){
        return (mouseX > x && mouseX < x + xLen 
            && mouseY > y && mouseY < y + yLen);
    }

    // Top left corner
    float x, y;
    float xLen, yLen;
    PanelState state;
    color backgroundColor;

    ArrayList<SymbolButton> buttonList = new ArrayList<SymbolButton>();
}

class SymbolButton{

    SymbolButton(float xCoor, float yCoor, float xLength, float yLength){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = ButtonState.UNPRESSED;
    }

    SymbolButton(float xCoor, float yCoor, float xLength, float yLength, color backgndColor){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = ButtonState.UNPRESSED;
        backgroundColor = backgndColor;
    }

    SymbolButton(float xCoor, float yCoor, float xLength, float yLength, color backgndColor, char symbol_, color symbolColor_){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = ButtonState.UNPRESSED;
        symbol = symbol_;
        symbolColor = symbolColor_;
    }

    // x, y are relative coordinates to the panel class
    float x, y;
    float xLen, yLen;
    ButtonState state;
    char symbol;
    color backgroundColor;
    color symbolColor;
}
