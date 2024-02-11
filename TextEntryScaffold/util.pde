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

color BLACK = color(0,0,0);
color RED = color(255, 0, 0);
color GREEN = color(0, 255, 0);
color BLUE = color(0, 0, 255);


enum ButtonState{
    PRESSED,
    UNPRESSED
}

enum PanelState{
    EXPANDED,
    COLLAPSED
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

    Panel(float xCoor, float yCoor, float xLength, float yLength, int backgndColor, int id, float sideLength){
        x = xCoor;
        y = yCoor;
        xLen = xLength;
        yLen = yLength;
        state = PanelState.COLLAPSED;
        backgroundColor = backgndColor;
        ID = id;
        sideLen = sideLength;
    }


    // Pass in relative x and y coordinates
    void addButton(float xCoor, float yCoor, float xLength, float yLength, color backgndColor_, char symbol, color symbolColor_){
        SymbolButton newButton = new SymbolButton(xCoor, yCoor, xLength, yLength, backgndColor_, symbol, symbolColor_);
        buttonList.add(newButton);
    }

    // Happens for each panel
    void draw(){
      System.out.println("Panel ID: " + ID);
        if(state == PanelState.EXPANDED){
            System.out.println("Panel State: EXPANDED");
            fill(backgroundColor);
            //fill(255, 0, 0);
            rect(expandedPanelStartX, expandedPanelStartY, sideLen, sideLen * (3.0/4.0));
            drawPanelButtons();
        }
        else{ // COLLAPSED 
            System.out.println("Panel State: COLLAPSED");
            //draw the rectangle
            stroke(0);
            strokeWeight(5);
            fill(backgroundColor);
            rect(x, y, xLen, yLen);
            
            // Want to draw QWERTY representation on panels so users know where to click
        }
    }

    void drawPanelButtons(){
        for(SymbolButton button : buttonList){
            fill(button.backgroundColor);
            fill(color(255, 255, 255));
            rect(expandedPanelStartX + button.x, expandedPanelStartY + button.y, button.xLen, button.yLen);
            fill(button.symbolColor);
            text(button.symbol, expandedPanelStartX + button.x + (button.xLen / 2.0), expandedPanelStartY + button.y + (button.yLen / 2.0));
        }
    }

    boolean mouseInRegion(){
        return (mouseX > x && mouseX < x + xLen 
            && mouseY > y && mouseY < y + yLen);
    }
    
    boolean mouseInButtonRegion(float buttonX, float buttonY, float buttonW, float buttonH){
      return (mouseX > expandedPanelStartX + buttonX && mouseX < expandedPanelStartX + buttonX + buttonW
              && mouseY > expandedPanelStartY + buttonY && mouseY < expandedPanelStartY + buttonY + buttonH);
    }

    // Top left corner
    float x, y;
    float xLen, yLen;
    PanelState state;
    color backgroundColor;
    int ID;
    float sideLen;
    float expandedPanelStartX = width/2.0-sizeOfInputArea/2.0;
    float expandedPanelStartY = height/2.0-sizeOfInputArea/2.0 + sizeOfInputArea/4.0;

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
