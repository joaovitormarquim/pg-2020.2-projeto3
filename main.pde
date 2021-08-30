// phong é uma simplificação de um modelo de iluminação virtual. Divide a iluminação em ambiente, difusa e especular.
// a iluminação ambiente é um valor "fixo" que divide a iluminação ambiente de um coeficiente dirigido ao objeto. nao tem a ver com a fonte da luz.
// Os outros dois componentes, sao os dois componentes de iluminação sobre o ambiente. O expoente q é o nível de reflexão.
// Podem existir várias fontes de luz, por isso que é um somatório.
// a difusão é quando a luz bate e se difunde, tem a ver com caracteristicas proprias do objeto. uma parte é absorvida e a outra é refletida de modo difuso. não depende de onde o olho está. 
// a luz especular tem a ver com a capacidade do objeto de refletir a luz. depende do ponto de vista.

// para cada pixel da imagem, tem uma especia de vetor que n é bem uma cor, é um vetor, que cria uma especia de matriz de vetores onde cada um tem uma especie de normal em relacao ao pixel. o mapeamento de normal é que cria a luz. 

// mapa de vetores normais. é uma matriz de vetores, está como imagem para facilitar
PImage normalVectors;
// como se fosse os kds. é também um mapa de vetores. mapa de vetores de cores.
PImage diffuseImage;
// como se fosse os ks. é também um mapa de vetores. mapa de vetores de cores.
PImage specularImage;

// constantes para auxiliar.
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
    background(BLACK);
    size(800, 800);
    // loading images
    diffuseImage = loadImage("./Imagens/d.png");
    specularImage = loadImage("./Imagens/s.png");
    normalVectors = loadImage("./Imagens/n.png");
    // defining inital controls
    brightness = 1;
    coordX = width/2.0 - diffuseImage.width/2.0;
    coordY = height/2.0 - diffuseImage.height/2.0;
}

void draw() {
    buttons();
    lightColor = color(red, green, blue);
    lightDirection = new PVector(mouseX - width/10, mouseY - height/10, 0.1).normalize();
    // create image cria uma imagem vazia com o tamanho da imagem desejada. o renderizar imagem é que coloca a cor nela.
    PImage composedImage = renderImage(createImage(diffuseImage.width, diffuseImage.height, ARGB));
    image(composedImage, coordX, coordY);
}
