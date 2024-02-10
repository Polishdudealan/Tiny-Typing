
//WatchFace(width/2-sizeOfInputArea/2, height/2-sizeOfInputArea/2, sizeOfInputArea)
enum FaceMode{
    PANEL,
    LETTER_BUTTONS,
    NOTHING
}
class WatchFace{

    float x, y, sideLength;
    Panel left, center, right;
    Panel[] panels;
    Panel selectedPanel;
    PFont font;
    FaceMode mode;
    String currentTyped = "";

    // ArrayList<LetterButton> topLBThreeConfig; // three config
    // ArrayList<LetterButton> topLBFourConfig; //four config
    // ArrayList<LetterButton> bottomLetterButtons; //universal to all pages



    WatchFace(float x, float y, float  sideLength, PFont font){
        this.x = x;
        this.y = y;
        this.sideLength  = sideLength;
        this.mode  = FaceMode.NOTHING;
        this.font = font;
        lettersEnteredTotal = 0;
        _initPanels();
        _initLetterButtons();
    }

    void _initPanels(){
        float panelY = y + sideLength/4;
        float panelHeight = 3*sideLength/4;
        left = new Panel(x, panelY, this.sideLength/3, panelHeight, 
            LIGHT_GRAY, "qwe\nasd\nzxc");

        center = new Panel(x+sideLength/3, panelY, this.sideLength/3, panelHeight,
            LIGHT_GRAY, "rtyu\nfgh\nvbn");

        right = new Panel(x+2*sideLength/3, panelY, this.sideLength/3, panelHeight,
            LIGHT_GRAY, "iop\njkl\nm");

        panels = new Panel[]{left, center, right};
    }

    void _initLetterButtons(){
        // topLBThreeConfig = new ArrayList<LetterButton>();
        // topLBFourConfig = new ArrayList<LetterButton>();
        // bottomLetterButtons = new ArrayList<LetterButton>();

        float lbSideLength = sideLength/4;
        float lbY = y + sideLength/8;
        // initize leftButtons
        ArrayList<LetterButton> buttons = new ArrayList<LetterButton>();
        for(int i = 0; i < 3; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }
        //initialize bottom six letter buttons
        for(int i = 0; i < 3; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY + lbSideLength + lbSideLength/4,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }

        for(int i = 0; i < 3; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY + 2*lbSideLength + lbSideLength/2,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }

        left.setButtons(buttons);

        //center buttons
        buttons = new ArrayList<LetterButton>();
        for(int i = 0; i < 4; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength),
                    lbY,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }
        //initialize bottom six letter buttons
        for(int i = 0; i < 3; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY + lbSideLength + lbSideLength/4,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }

        for(int i = 0; i < 3; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY + 2*lbSideLength + lbSideLength/2,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }

        center.setButtons(buttons);


        //right buttons
        buttons = new ArrayList<LetterButton>();
        for(int i = 0; i < 3; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }
        //initialize bottom six letter buttons
        for(int i = 0; i < 3; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY + lbSideLength + lbSideLength/4,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }
        buttons.add(
            new LetterButton(
                x+ 1*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                lbY + 2*lbSideLength + lbSideLength/2,//+i*lbSideLength+lbSideLength/4,
                lbSideLength,
                lbSideLength
            )
        );
        right.setButtons(buttons);



        

    }

    void clearText(){
        currentTyped = "";
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
            drawLetterButtons();
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

    void addSpace(){
        currentTyped += " ";
    }

    void backspace(){
        if(currentTyped.length()>0){
            currentTyped = currentTyped.substring(0, currentTyped.length() - 1);
        }
        //currentTyped = ? 
    }


    

    void onMouseReleased(){
        if(mode == FaceMode.PANEL){
            for (Panel p: panels){
                if(p.mouseInRegion()){
                    mode = FaceMode.LETTER_BUTTONS;
                    selectedPanel = p;
                }
            }
        }
        else if (mode == FaceMode.LETTER_BUTTONS){
            for (LetterButton lb: selectedPanel.buttons){
                if(lb.mouseInRegion()){
                    currentTyped += Character.toString(lb.getSymbol());
                    mode = FaceMode.PANEL;
                }
            }
            //TODO GET CHARACTER AND RETURN
        }
    }


    void drawPanels(){
        left.draw();
        right.draw();
        center.draw();
    }

    void drawLetterButtons(){
        // for(int i = 0; i < topLBThreeConfig.size(); i++){
        //     topLBThreeConfig.get(i).setSymbol( selectedPanel.letters.charAt(i) );
        //     topLBThreeConfig.get(i).draw();
        // }

        selectedPanel.drawButtons();

    }

}

