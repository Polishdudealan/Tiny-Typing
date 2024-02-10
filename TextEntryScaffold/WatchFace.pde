
//WatchFace(width/2-sizeOfInputArea/2, height/2-sizeOfInputArea/2, sizeOfInputArea)
enum FaceMode{
    PANEL,
    LETTER_BUTTONS,
    NOTHING
}
class WatchFace{

    float x, y, sideLength;
    Panel left, center, right;
    Panel[] panels = {left, center, right};
    PFont font;
    FaceMode mode;
    String currentTyped = "";
    Panel selectedPanel;

    WatchFace(float x, float y, float  sideLength, PFont font){
        this.x = x;
        this.y = y;
        this.sideLength  = sideLength;
        this.mode  = FaceMode.NOTHING;
        this.font = font;
        _initPanels();
    }

    void _initPanels(){
        float panelY = y + sideLength/4;
        float panelHeight = 3*sideLength/4;
        left = new Panel(x, panelY, this.sideLength/3, panelHeight, color(255, 0, 0));

        left.addButton(0 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'q', color(200, 100, 0));
        left.addButton(1 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'w', color(200, 100, 0));
        left.addButton(2 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'e', color(200, 100, 0));
        
        center = new Panel(x+sideLength/3, panelY, this.sideLength/3, panelHeight,
            color(0, 255, 0));

        right = new Panel(x+2*sideLength/3, panelY, this.sideLength/3, panelHeight,
            color(0, 0, 255));
    }

    void setMode(FaceMode newMode){
        mode = newMode;
    }
    
    void reset(){
      mode = FaceMode.PANEL;
    }

    void draw(){
        fill(100);
        // Note: width and height are variables defined by the Processing library. For
        // more information, please refer to Processing's reference.
        rect(this.x, this.y, this.sideLength, this.sideLength); //input area should be 1" by 1"
        if (mode != FaceMode.NOTHING){
            drawEnteredText();
        }

        if(mode == FaceMode.PANEL){
            drawPanels();
        }
        else if(mode == FaceMode.LETTER_BUTTONS){
            selectedPanel.drawPanelButtons();
        }


        
    }

    void drawEnteredText(){
        fill(200);
        textAlign(LEFT);
        textFont(font);
        text("Entered: " + currentTyped +"|", x, y, sideLength, sideLength/4); //draw what the user has entered thus far 
        //
        //text("" + currentLetter, width/2, height/2-sizeOfInputArea/4); //draw current letter
        //textFont(font); //Reset font size
    }


    void drawPanels(){
        left.draw();
        right.draw();
        center.draw();
    }

    void drawLetterButtons(){
        
    }

    void onMousePressed(){
        if(mode == FaceMode.PANEL){
            for (Panel p: panels){
                if(p.mouseInRegion()){
                    mode = FaceMode.LETTER_BUTTONS;
                    selectedPanel = p;
                    p.state = PanelState.EXPANDED;
                }
            }
        }
        else if (mode == FaceMode.LETTER_BUTTONS){
            //TODO GET CHARACTER AND RETURN
        }
    }

}
/*
class Panel{
    ArrayList<String> letters;
    float xCor, yCor, rectWidth, rectHeight;
    color rectColor;
    String drawText = "";

    Panel(float xCor, float yCor, float rectWidth, float rectHeight, color rectColor, ArrayList<String> letters){
        this.xCor = xCor;
        this.yCor = yCor;
        this.rectWidth = rectWidth;
        this.rectHeight = rectHeight;
        this.rectColor = rectColor;
    }

    void draw(){
        //draw the rectangle
        stroke(0);
        strokeWeight(5);
        fill(rectColor);
        rect(xCor, yCor, rectWidth, rectHeight);

        //text("q w e", )
    }

    boolean mouseInRegion(){
        return (mouseX > xCor && mouseX < xCor+rectWidth 
            && mouseY > yCor && mouseY < yCor+rectHeight);
    }
}

class SymbolGrid{

}*/
