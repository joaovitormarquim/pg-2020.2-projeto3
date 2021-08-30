// calcula a reflexão de um vetor
PVector reflect(PVector incident, PVector normal) {
    PVector normalVectorNormalized = normal.normalize();
    return incident.sub(normalVectorNormalized.mult(2*incident.dot(normalVectorNormalized)));
}

// captura um pixem da imagem
// dada uma imagem, e duas coordenadas x e y, sabendo que a imagem é um array unidimensional onde as linhas estao em sequencia.
color getPixel(PImage image, int pixelX, int pixelY) {
    return image.pixels[pixelY*image.width + pixelX];
}

// calcula a componente difusa
color calculateDiffuseComponent(color diffuse, color normal) {
    PVector normalVectorNormalized = new PVector(red(normal), green(normal), blue(normal)).normalize();
    float diffuseProportion = max(0, normalVectorNormalized.dot(lightDirection));
    color diffuseComponent = color(red(diffuse)*diffuseProportion, green(diffuse)*diffuseProportion, blue(diffuse)*diffuseProportion, alpha(diffuse));
    return lightenColor(diffuseComponent);
}

color calculateSpecularComponent(color especular, color normal) {
    PVector normalVectorNormalized = new PVector(red(normal), green(normal), blue(normal)).normalize();
    PVector incident = PVector.mult(lightDirection, -1);
    PVector reflected = reflect(incident, normalVectorNormalized);
    float specularProportion = pow(max(0, viewDirection.dot(reflected)), brightness);
    color specularComponent = color(red(especular)*specularProportion, green(especular)*specularProportion, blue(especular)*specularProportion, alpha(especular));
    return lightenColor(specularComponent);
}

// junta os dois componentes
color composeComponents(color diffuseColor, color specularColor) {
    float redComponent = (red(diffuseColor) + red(specularColor));
    float greenComponent = (green(diffuseColor) + green(specularColor));
    float blueComponent = (blue(diffuseColor) + blue(specularColor));
    return color(redComponent, greenComponent, blueComponent, alpha(diffuseColor));
}

// ilumina a cor da luz, muda a cor da luz
color lightenColor(color _color) {
    float lightenRed = red(_color)*red(lightColor)/255.0;
    float lightenGreen = green(_color)*green(lightColor)/255.0;
    float lightenBlue = blue(_color)*blue(lightColor)/255.0;
    return color(lightenRed, lightenGreen, lightenBlue, alpha(_color));
}

// Calcula o phong
// para cada pixel vai ajustar a cor, desenhando a imagem.
PImage renderImage(PImage composedImage) {
    for(int y = 0; y < diffuseImage.height; y++) {
        for(int x = 0; x < diffuseImage.width; x++) {
            color normal = getPixel(normalVectors, x, y);
            color diffuse = getPixel(diffuseImage, x, y);
            color especular = getPixel(specularImage, x, y);
            color diffuseColor = calculateDiffuseComponent(diffuse, normal);
            color specularColor = calculateSpecularComponent(especular, normal);

            if((diffuseControl[0] == WHITE) && (specularControl[0] == WHITE)) {
                composedImage.pixels[y*diffuseImage.width + x] = composeComponents(diffuseColor, specularColor);
            } else if((diffuseControl[0] == WHITE) && (specularControl[0] == BLACK)) {
                composedImage.pixels[y*diffuseImage.width + x] = diffuseColor;
            } else if((diffuseControl[0] == BLACK) && (specularControl[0] == WHITE)) {
                composedImage.pixels[y*diffuseImage.width + x] = specularColor;
            } else {
                composedImage.pixels[y*diffuseImage.width + x] = normal;
            }
        }
    }

    return composedImage;
}
