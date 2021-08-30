PImage normalVectors;
PImage diffuseImage;
PImage specularImage;
PImage composedImage;

int WHITE = 255;
int GREY = 160;
int BLACK = 0;

int diffuseControl[] = {WHITE, BLACK, WHITE};
int specularControl[] = {WHITE, BLACK, WHITE};

float red = 255;
float green = 255;
float blue = 255;

PVector viewDirection = new PVector(0, 1, 1);
PVector lightDirection;
color lightColor;
float brightness;
float coordX, coordY;

// start rendering
void setup() {
    // general config
    background(0);
    size(800, 800);
    // loading images
    diffuseImage = loadImage("./Imagens/d.png");
    specularImage = loadImage("./Imagens/s.png");
    normalVectors = loadImage("./Imagens/n.png");
    // defining inital controls
    brightness = 0.5;
    lightColor = color(255, 255, 255, 255);
    lightDirection = new PVector(-1, 0, 1).normalize();
    coordX = width/2.0 - diffuseImage.width/2.0;
    coordY = height/2.0 - diffuseImage.height/2.0;
}

void draw() {
    buttons();
    lightColor = color(red, green, blue);
    lightDirection = new PVector(mouseX - width/10, mouseY - height/10, 0.1).normalize();
    composedImage = createImage(diffuseImage.width, diffuseImage.height, ARGB);
    renderImage();
    image(composedImage, coordX, coordY);
}
