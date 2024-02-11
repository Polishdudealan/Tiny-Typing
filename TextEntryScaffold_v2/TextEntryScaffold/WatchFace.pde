
//WatchFace(width/2-sizeOfInputArea/2, height/2-sizeOfInputArea/2, sizeOfInputArea)
enum FaceMode{
    PANEL,
    LETTER_BUTTONS,
    NOTHING,
    INSTRUCTIONS
}
class WatchFace{

    float x, y, sideLength;
    Panel left, center, right;
    Panel[] panels;
    Panel selectedPanel;
    PFont font;
    FaceMode mode;
    String currentTyped = "";
    

    char cursor = '_';//'▮';

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
            LIGHT_GRAY, "q w e\na s d\nz x c");

        center = new Panel(x+sideLength/3, panelY, this.sideLength/3, panelHeight,
            LIGHT_GRAY, "r t y u\nf g h\nv b");

        right = new Panel(x+2*sideLength/3, panelY, this.sideLength/3, panelHeight,
            LIGHT_GRAY, "i o p\nj k l\nn m");

        panels = new Panel[]{left, center, right};
    }

    void _initLetterButtons(){
        // topLBThreeConfig = new ArrayList<LetterButton>();
        // topLBFourConfig = new ArrayList<LetterButton>();
        // bottomLetterButtons = new ArrayList<LetterButton>();

        float lbSideLength = sideLength/4;
        float lbY = y +sideLength/4 ;//y + sideLength/8;
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
                    lbY + lbSideLength ,//+ lbSideLength/4,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }

        for(int i = 0; i < 3; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY + 2*lbSideLength ,//+ lbSideLength/2,//+i*lbSideLength+lbSideLength/4,
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
                    lbY + lbSideLength ,//+ lbSideLength/4,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }

        for(int i = 0; i < 2; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY + 2*lbSideLength, //+ lbSideLength/2,//+i*lbSideLength+lbSideLength/4,
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
                    lbY + lbSideLength, //+ lbSideLength/4,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }

        for(int i = 0; i < 2; i++){
            buttons.add(
                new LetterButton(
                    x+ i*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                    lbY + 2*lbSideLength, //+ lbSideLength/2,//+i*lbSideLength+lbSideLength/4,
                    lbSideLength,
                    lbSideLength
                )
            );
        }

        /*
        buttons.add(
            new LetterButton(
                x+ 1*(lbSideLength + lbSideLength/4) + lbSideLength/4,
                lbY + 2*lbSideLength, //+ lbSideLength/2,//+i*lbSideLength+lbSideLength/4,
                lbSideLength,
                lbSideLength
            )
        );*/
        right.setButtons(buttons);



        

    }

    void clearText(){
        currentTyped = "";
    }

    void setMode(FaceMode newMode){
        mode = newMode;
    }
    

    void setPanelMode(){
        mode = FaceMode.PANEL;
    }

    void reset(){
      mode = FaceMode.INSTRUCTIONS;//FaceMode.PANEL;
    }

    void draw(){
        fill(100);
        // Note: width and height are variables defined by the Processing library. For
        // more information, please refer to Processing's reference.
        rect(this.x, this.y, this.sideLength, this.sideLength); //input area should be 1" by 1"

        if (mode == FaceMode.INSTRUCTIONS){
            drawInstructions();
            
        }
        else if (mode != FaceMode.NOTHING){
            drawEnteredText();
        }

        if(mode == FaceMode.PANEL){
            drawPanels();
        }
        else if(mode == FaceMode.LETTER_BUTTONS){
            drawLetterButtons();
        }
        
    }

    void drawInstructions(){
        //draws text in center of rectangle
        textAlign(CENTER);
        //textFont(createFont("NotoSans-Regular.ttf", 100 * displayDensity));
        textSize(20); //scale to rectangle width
        fill(LIGHT_GRAY);
        String instr = "INSTRUCTIONS:\n\nClick panel to go to letter buttons\n\nWhile in letter buttons, select a letter to \ntype or swipe up to return to panels\n\nSwipe left for backspace\n\nSwipe right for space";
        text(instr, int(x+sideLength*.5), int(y+sideLength*.1)); //center in rect

    }

    void drawEnteredText(){
        fill(200);
        textAlign(LEFT);
        textFont(font);
        textLeading(40);
        text(currentTyped +cursor, x, y, sideLength, sideLength/4); //draw what the user has entered thus far 
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
        if (!mouseInRegion()) return;

        if(mode == FaceMode.INSTRUCTIONS){
            mode = FaceMode.PANEL;
        }
        else if(mode == FaceMode.PANEL){
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


    boolean mouseInRegion(){
        return (mouseX > x && mouseX < x+sideLength 
            && mouseY > y && mouseY < y+sideLength);
    }

}

