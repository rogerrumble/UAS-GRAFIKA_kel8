class Board {
  int boardWidth;
  int boardHeight;
  int currentScore = 0;
  
  Board(int w, int h) {
    boardWidth = w;
    boardHeight = h;
  }
  
  void render() {
    noStroke();
    fill(theme.background); //HEX# 2B2E32
    rect(140, 0, b.boardWidth*scl, b.boardHeight*scl);
  }
  
  void level() {
    if (currentScore == 5) {
      level++;
      f.currentLevel++;
      fr += 2;
      frameRate(fr);
      currentScore = 0;
    }
  }
  
}
