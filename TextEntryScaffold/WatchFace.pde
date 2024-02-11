
//WatchFace(width/2-sizeOfInputArea/2, height/2-sizeOfInputArea/2, sizeOfInputArea)
enum FaceMode{
    PANELS,
    LETTER_BUTTONS,
    NOTHING
}

class WatchFace{

    float x, y, sideLength;
    //Panel left, center, right;
    //Panel[] panels = {left, center, right};
    
    int LEFT = 0;
    int CENTER = 1;
    int RIGHT = 2;
    
    ArrayList<Panel> panels = new ArrayList<Panel>();
    
    PFont font;
    FaceMode mode;
    String currentTyped = "";
    int selectedPanel;

    WatchFace(float x, float y, float sideLength, PFont font){
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
        
        float buttonWidth = sideLength/4.0;
        float buttonHeight = sideLength/4.0;
        
        Panel left = new Panel(x, panelY, this.sideLength/3, panelHeight, color(255, 0, 0), 0, sideLength);

        left.addButton(0 * sideLength/4.0, 0, buttonWidth, sideLength/4.0, color(255, 255, 255), 'q', BLACK);
        left.addButton(1 * sideLength/4.0, 0, buttonWidth, sideLength/4.0, color(255, 255, 255), 'w', BLACK);
        left.addButton(2 * sideLength/4.0, 0, buttonWidth, sideLength/4.0, color(255, 255, 255), 'e', BLACK);
        
        left.addButton(0 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, sideLength/4.0, color(255, 255, 255), 'a', BLACK);
        left.addButton(1 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, sideLength/4.0, color(255, 255, 255), 's', BLACK);
        left.addButton(2 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, sideLength/4.0, color(255, 255, 255), 'd', BLACK);
        
        left.addButton(0 * sideLength/4.0, 2 * sideLength/4.0, buttonWidth, sideLength/4.0, color(255, 255, 255), 'z', BLACK);
        left.addButton(1 * sideLength/4.0, 2 * sideLength/4.0, buttonWidth, sideLength/4.0, color(255, 255, 255), 'x', BLACK);
        
        Panel center = new Panel(x+sideLength/3, panelY, this.sideLength/3, panelHeight, color(0, 255, 0), 1, sideLength);
        
        center.addButton(0 * sideLength/4.0, 0, buttonWidth, buttonHeight, color(200, 100, 0), 'r', BLACK);
        center.addButton(1 * sideLength/4.0, 0, buttonWidth, buttonHeight, color(200, 100, 0), 't', BLACK);
        center.addButton(2 * sideLength/4.0, 0, buttonWidth, buttonHeight, color(200, 100, 0), 'y', BLACK);
        center.addButton(3 * sideLength/4.0, 0, buttonWidth, buttonHeight, color(200, 100, 0), 'u', BLACK);
        
        center.addButton(0 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'f', BLACK);
        center.addButton(1 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'g', BLACK);
        center.addButton(2 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'h', BLACK);
        
        center.addButton(0 * sideLength/4.0, 2 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'c', BLACK);
        center.addButton(1 * sideLength/4.0, 2 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'v', BLACK);
        center.addButton(2 * sideLength/4.0, 2 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'b', BLACK);

        Panel right = new Panel(x+2*sideLength/3, panelY, this.sideLength/3, panelHeight, color(0, 0, 255), 2, sideLength);
        
        right.addButton(1 * sideLength/4.0, 0, buttonWidth, buttonHeight, color(200, 100, 0), 'i', BLACK);
        right.addButton(2 * sideLength/4.0, 0, buttonWidth, buttonHeight, color(200, 100, 0), 'o', BLACK);
        right.addButton(3 * sideLength/4.0, 0, buttonWidth, buttonHeight, color(200, 100, 0), 'p', BLACK);
        
        right.addButton(1 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'j', BLACK);
        right.addButton(2 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'k', BLACK);
        right.addButton(3 * sideLength/4.0, 1 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'l', BLACK);
        
        right.addButton(1 * sideLength/4.0, 2 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'n', BLACK);
        right.addButton(2 * sideLength/4.0, 2 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), 'm', BLACK);
        right.addButton(3 * sideLength/4.0, 2 * sideLength/4.0, buttonWidth, buttonHeight, color(200, 100, 0), ' ', BLACK);
        
        // Add panels to array
        panels.add(left);
        panels.add(center);
        panels.add(right);
    }

    void setMode(FaceMode newMode){
        mode = newMode;
    }
    
    void reset(){
      mode = FaceMode.PANELS;
    }

    void draw(){
        fill(100);
        // Note: width and height are variables defined by the Processing library. For
        // more information, please refer to Processing's reference.
        rect(this.x, this.y, this.sideLength, this.sideLength); //input area should be 1" by 1"
        //System.out.println("watchface draw");
        if (mode != FaceMode.NOTHING){
            drawEnteredText();
        }

        if(mode == FaceMode.PANELS){
            System.out.println("PANELS mode");
            panels.get(LEFT).state = PanelState.COLLAPSED;
            panels.get(CENTER).state = PanelState.COLLAPSED;
            panels.get(RIGHT).state = PanelState.COLLAPSED;
            panels.get(LEFT).draw();
            panels.get(CENTER).draw();
            panels.get(RIGHT).draw();
        }
        else if(mode == FaceMode.LETTER_BUTTONS){
            panels.get(selectedPanel).state = PanelState.EXPANDED;
            panels.get(selectedPanel).draw();
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

    void onMousePressed(){
        if(mode == FaceMode.PANELS){
          System.out.println("WatchFace State: PANEL -> LETTER_BUTTONS");
            for (Panel p: panels){
              System.out.println("test0.1");
              if(p == null){
                System.out.println("p is null :(");
              }
                if(p != null && p.mouseInRegion()){
                    mode = FaceMode.LETTER_BUTTONS;
                    selectedPanel = p.ID;
                }
            }
        }
        else if (mode == FaceMode.LETTER_BUTTONS){
          System.out.println("WatchFace State: LETTER_BUTTONS -> PANEL");
          //TODO GET CHARACTER AND RETURN
          
          // Loop over buttons in current panel and check mouse coords
          for(SymbolButton b: panels.get(selectedPanel).buttonList){
              if(b != null && panels.get(selectedPanel).mouseInButtonRegion(b.x, b.y, b.xLen, b.yLen)){
                
                // Draw letter here
                currentTyped += b.symbol;         
              }
          } // for
          // Need to collapse the panel no matter where the user clicks
          mode = FaceMode.PANELS;
      }
    }
}
