int cellSize = 15;  
int cols, rows; 
int[][] maze;
int playerX = 1, playerY = 1; 
int exitX, exitY; 

void setup() {
  size(800, 800);
  cols = width / cellSize;
  rows = height / cellSize;
  
  resetGame(); 
}

void draw() {
  drawMaze();
  drawPlayer();
  

  if (playerX == exitX && playerY == exitY) {
    textSize(32);
    fill(0, 255, 0);
    text("Farewell!", width / 2 - 80, height / 2);
    noLoop();  
  }
}

void keyPressed() {
  
  if (keyCode == UP && maze[playerX][playerY - 1] == 0) playerY--;
  if (keyCode == DOWN && maze[playerX][playerY + 1] == 0) playerY++;
  if (keyCode == LEFT && maze[playerX - 1][playerY] == 0) playerX--;
  if (keyCode == RIGHT && maze[playerX + 1][playerY] == 0) playerX++;
  

  if (key == ' ') {
    resetGame();
  }
}

void drawMaze() {
  background(255);
  

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (maze[i][j] == 1) {
        fill(100);  
        rect(i * cellSize, j * cellSize, cellSize, cellSize);
      }
    }
  }
  
 
  fill(125,30,30);
  ellipse(exitX * cellSize + cellSize / 2, exitY * cellSize + cellSize / 2, cellSize, cellSize);
}

void drawPlayer() {

  pushMatrix();
  translate(playerX * cellSize + cellSize / 2, playerY * cellSize + cellSize / 2);
  

  fill(255, 220, 180);  
  ellipse(0, 0, cellSize, cellSize);  
  
 
  fill(255, 0, 0);
  ellipse(0, 5, 10, 10);
  

  noFill();
  stroke(120, 20, 220);
  strokeWeight(1.5);
  arc(0, 10, 20, 10, 0, PI);
  
 
  fill(0);
  ellipse(-8, -5, 5, 5);  
  ellipse(8, -5, 5, 5);   
  
 
  fill(120, 20, 30);
  arc(0, -cellSize / 2 + 10, cellSize / 2, cellSize / 3, PI, TWO_PI);
  popMatrix();
}

void generateMaze() {

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (i == 0 || i == cols - 1 || j == 0 || j == rows - 1) {
        maze[i][j] = 1;  
      } else if (random(1) < 0.3) {
        maze[i][j] = 1;  
      } else {
        maze[i][j] = 0;  
      }
    }
  }
  

  maze[1][1] = 0;
  maze[exitX][exitY] = 0;
}

void resetGame() {

  maze = new int[cols][rows];
  generateMaze();
  

  exitX = cols - 2;
  exitY = rows - 2;
  

  playerX = 1;
  playerY = 1;
  

  drawMaze();
}
