class Snake {
  PVector snakeLoc = new PVector((floor(random(7, 7+b.boardWidth))), (floor(random(b.boardHeight))));
  
  float xDir = 1;
  float yDir = 0;
  int total = 2;
  
  ArrayList<PVector> body = new ArrayList<PVector>();

  
  void render() {
    fill(theme.snake); //HEX# 47FFE8
    stroke(theme.snakeStroke);
    rect(snakeLoc.x*scl, snakeLoc.y*scl, scl, scl);
    
    for (int i = 0; i < body.size(); i++) {
      rect(body.get(i).x*scl, body.get(i).y*scl, scl, scl);
    }
    
  }
  
  boolean eat() {
    float d = dist(snakeLoc.x, snakeLoc.y, f.food.x, f.food.y);
    
    if (d < 1) {
      total++;
      return true;
    } else {
      return false;
    }
  }
  
  
  void death() {
    for (int i = 0; i < body.size(); i++) {
      PVector pos = body.get(i);
      float d = dist(snakeLoc.x, snakeLoc.y, pos.x, pos.y);
      if (d < 1) {
        gameOver();
      }//menabrak badan
    }
    if (level > 0) {
      float p;
      for (int i = 0; i < f.poison.size(); i++) {
        p = dist(snakeLoc.x, snakeLoc.y, f.poison.get(i).x, f.poison.get(i).y);

        if (p < 1) {
          gameOver();
        }//memakan poison
      }
    }
  }
  void gameOver() {
    fill(255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text("GAME OVER", (14+b.boardWidth)/2*scl, b.boardHeight/2*scl);
    textAlign(CENTER, TOP);
    text("PRESS 'R' TO RESTART", (14+b.boardWidth)/2*scl, b.boardHeight/2*scl);
    body.clear();
    noLoop();
        
    if (score > highScore) {
      highScore = score;
    }
    level = 0; 
  }

  
  void update() {
    if (total > 0) {
      if (total == body.size()) {
        body.remove(0);
        print('y');
      }
      body.add(new PVector(snakeLoc.x, snakeLoc.y));
    } 
    
    snakeLoc.x += xDir;
    snakeLoc.y += yDir;
    
    snakeLoc.x = constrain(snakeLoc.x, 7, 6+b.boardWidth);
    snakeLoc.y = constrain(snakeLoc.y, 0, b.boardHeight-1); //memastikan kepala ular tidak melewati

  }
}
