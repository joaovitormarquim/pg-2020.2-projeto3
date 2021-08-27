PImage mapaNormais;
PImage imagemDifusa;
PImage imagemEspecular;
PImage imagemFinal;

int branco = 255;
int cinza = 167;
int preto = 0;

int controleDifuso[] = {branco, preto, branco};
int controleEspecular[] = {branco, preto, branco};
int controleDoVermelho = preto;
int controleDoVerde = preto;
int controleDoAzul = preto;

float r = 255;
float g = 255;
float b = 255;

int fonteDoBotaoComponente = 30;
int fonteDoBotaoCores = 25;

PVector direcaoDaVista = new PVector(0, 1, 1);
PVector direcaoDaLuz;
color corDaLuz;
float brilho;
float coordX, coordY;

// start rendering
void setup() {
    // general config
    background(0);
    size(800, 800);
    // loading images
    imagemDifusa = loadImage("./Imagens/d.png");
    imagemEspecular = loadImage("./Imagens/s.png");
    mapaNormais = loadImage("./Imagens/n.png");
    // defining inital controls
    brilho = 1;
    corDaLuz = color(255, 255, 255, 255);
    direcaoDaLuz = new PVector(-1, 0, 1).normalize();
    coordX = width/2.0 - imagemDifusa.width/2.0;
    coordY = height/2.0 - imagemDifusa.height/2.0;
}

void draw() {
    botoes();
    corDaLuz = color(r, g, b);
    direcaoDaLuz = new PVector(mouseX - width/10, mouseY - height/10, 0.1).normalize();
    imagemFinal = createImage(imagemDifusa.width, imagemDifusa.height, ARGB);
    renderizarImagem();
    image(imagemFinal, coordX, coordY);
}
