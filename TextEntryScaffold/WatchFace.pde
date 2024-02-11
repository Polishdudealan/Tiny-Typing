
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
        Panel left = new Panel(x, panelY, this.sideLength/3, panelHeight, color(255, 0, 0), 0, sideLength);

        left.addButton(0 * sideLength/4.0, 0, 100, 100, color(255, 255, 255), 'q', color(200, 0, 100));
        //left.addButton(1 * sideLength/4.0, 0, sideLength/4.0 - 5, sideLength/4.0 - 5, color(255, 255, 255), 'w', color(200, 0, 100));
        //left.addButton(2 * sideLength/4.0, 0, sideLength/4.0 - 5, sideLength/4.0 - 5, color(255, 255, 255), 'e', color(200, 0, 100));
        
        Panel center = new Panel(x+sideLength/3, panelY, this.sideLength/3, panelHeight, color(0, 255, 0), 1, sideLength);
        
        center.addButton(0 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'r', color(200, 100, 0));
        center.addButton(1 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 't', color(200, 100, 0));
        center.addButton(2 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'y', color(200, 100, 0));
        center.addButton(3 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'u', color(200, 100, 0));

        Panel right = new Panel(x+2*sideLength/3, panelY, this.sideLength/3, panelHeight, color(0, 0, 255), 2, sideLength);
        
        right.addButton(0 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'i', color(200, 100, 0));
        right.addButton(1 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'o', color(200, 100, 0));
        right.addButton(2 * sideLength/4.0, 0, sideLength/4.0, sideLength/4.0, color(200, 100, 0), 'p', color(200, 100, 0));
        
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

        fill(200);
        rect(this.x + this.sideLength/4, this.y, this.sideLength/4, this.sideLength/4);
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
                    //p.state = PanelState.EXPANDED;
                }
            }
        }
        else if (mode == FaceMode.LETTER_BUTTONS){
          System.out.println("WatchFace State: LETTER_BUTTONS -> PANEL");
          //TODO GET CHARACTER AND RETURN
          
          // Loop over buttons in current panel and check mouse coords
          for(SymbolButton b: panels.get(selectedPanel).buttonList){
              if(b != null && panels.get(selectedPanel).mouseInButtonRegion(b.x, b.y, b.xLen, b.yLen)){
                mode = FaceMode.PANELS;
                
                // Draw letter here
                currentTyped += b.symbol;
                
              }
          } // for
          // Need to collapse the panel no matter where the user clicks
          //panels.get(selectedPanel).state = PanelState.COLLAPSED;
      }
    }
}
