import processing.sound.*;
SoundFile Music;
PFont gotham;
Board b;
Snake snake;
Food f;
Theme theme;

int scl = 20;
int score = 0;
int highScore = 0;
int level = 0;
int fr = 8;
 

void setup() {
  Music = new SoundFile(this, "undertale.mp3");
  Music.loop();
  size(900, 800);
  theme = new Theme();
  theme.theme01();
  gotham = createFont("Gotham-Bold.otf", 12);
  textFont(gotham);
  b = new Board(30, 30);
  snake = new Snake();
  f = new Food();
  frameRate(fr);
  
  
}


void draw() {
  background(0, 0, 0);
  translate((width/2)-((b.boardHeight/2)*scl)-100, (height/2)-((b.boardHeight/2)*scl));
  noStroke();
  scoreBoard();
  
  b.render();
  b.level();
  f.render();
  
  snake.update();
  snake.render();
  snake.death();
  
  f.foodLocation();
  
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && snake.xDir != 0 && snake.yDir != 1) {
      snake.xDir = 0;
      snake.yDir = -1;
    } else if (keyCode == DOWN && snake.xDir != 0 && snake.yDir != -1) {
      snake.xDir = 0;
      snake.yDir = 1;     
    } else if (keyCode == LEFT && snake.xDir != 1 && snake.yDir != 0) {
      snake.xDir = -1;
      snake.yDir = 0;
    } else if (keyCode == RIGHT && snake.xDir != -1 && snake.yDir != 0) {
      snake.xDir = 1;
      snake.yDir = 0;
    }
  }
  //RESTART
  if (key == 'r') {
    Music.stop();
    setup();
    loop();
    score = 0;
    fr = 8;
    frameRate(fr);
  } else if (key == 'p') {
    noLoop();
  } else if (key == 'o') {
    loop();
  } 

}

void scoreBoard() {
  int textLocx = 0;
  int textLocy = 20;
  
  fill(255);
  textSize(90);
  textAlign(LEFT);
  text("Snake Game", 140, -10);
  
  //SCOREBOARD
  fill(255);
  textSize(12);
  textAlign(LEFT);
  text("SCORE: ", textLocx, textLocy);
  text(score, textLocx+50, textLocy);
  text("HIGH SCORE: ", textLocx, textLocy+15);
  text(highScore, textLocx+85, textLocy+15);
  text("LEVEL: ", textLocx, textLocy+30);
  text(level, textLocx+45, textLocy+30);
  text("PAUSE: P", textLocx, textLocy+55);
  text("PLAY: O", textLocx, textLocy+70);
  text("LEVEL:", textLocx, textLocy+95);
  text(level, textLocx+45, textLocy+95);
  
  //ITEM INFO
  fill(theme.food);
  rect(textLocx, textLocy+110, scl, scl); 
  text("FOOD", textLocx+scl+5, textLocy+122);  
 
  fill(theme.snake);
  rect(textLocx, textLocy+135, scl, scl); 
  text("SNAKE", textLocx+scl+5, textLocy+147);    
  
  stroke(theme.poisonStroke);
  fill(theme.poison);
  rect(textLocx, textLocy+160, scl, scl); 
  text("POISON", textLocx+scl+5, textLocy+172); 
  
    
}
