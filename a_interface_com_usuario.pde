void botoes() {
    stroke(controleDifuso[0]);
    strokeWeight(4);
    fill(controleDifuso[1]);
    rect(2, 2, width/4-4, 40);
    fill(controleDifuso[2]);
    textSize(fonteDoBotaoComponente);
    textAlign(CENTER, CENTER);
    text("Difuso", width/8, 20);

    stroke(controleEspecular[0]);
    strokeWeight(4);
    fill(controleEspecular[1]);
    rect(width/4+2, 2, width/4-4, 40);
    fill(controleEspecular[2]);
    textSize(fonteDoBotaoComponente);
    textAlign(CENTER, CENTER);
    text("Especular", 3*width/8, 20);
    
    stroke(controleDoVermelho);
    strokeWeight(4);
    fill(r, 0, 0);
    circle(7*width/12+20, 22, 40);
    fill(preto);
    textSize(fonteDoBotaoCores);
    textAlign(CENTER, CENTER);
    text("R", 7*width/12+20, 22);    

    stroke(controleDoVerde);
    strokeWeight(4);
    fill(0, g, 0);
    circle(9*width/12, 22, 40);
    fill(preto);
    textSize(fonteDoBotaoCores);
    textAlign(CENTER, CENTER);
    text("G", 9*width/12, 22);

    stroke(controleDoAzul);
    strokeWeight(4);
    fill(0, 0, b);
    circle(11*width/12-20, 22, 40);
    fill(preto);
    textSize(fonteDoBotaoCores);
    textAlign(CENTER, CENTER);
    text("B", 11*width/12-20, 22);
}

void mouseClicked() {
    // mostrar ou esconder o componente difuso
    if (((mouseX > 2) && (mouseX <= width/4-2)) && ((mouseY >= 2) && (mouseY <= 40))) {
        if(controleDifuso[1] == cinza) {
            controleDifuso[0] = branco;
            controleDifuso[1] = preto;
            controleDifuso[2] = branco;
        } else {
            controleDifuso[0] = preto;
            controleDifuso[1] = cinza;
            controleDifuso[2] = preto;
        }
    } else if(((mouseX >= width/4-2) && (mouseX <= width/2-2)) && ((mouseY >= 2) && (mouseY <= 40))) {
    // mostrar ou esconder componente especular
        if(controleEspecular[1] == cinza) {
            controleEspecular[0] = branco;
            controleEspecular[1] = preto;
            controleEspecular[2] = branco;
        } else {
            controleEspecular[0] = preto;
            controleEspecular[1] = cinza;
            controleEspecular[2] = preto;
        }
    } else if((abs(mouseX - (7*width/12+20)) <= 22) && (abs(mouseY -22) <= 22)) {
        //estado para alterar a cor vermelha
        if(controleDoVermelho == preto) {
            controleDoVermelho = branco;
        } else {
            controleDoVermelho = preto;
        }
    } else if((abs(mouseX - (9*width/12)) <= 22) && (abs(mouseY -22) <= 22)) {
        //estado para alterar a cor verde
        if(controleDoVerde == preto) {
            controleDoVerde = branco;
        } else {
            controleDoVerde = preto;
        }
    } else if((abs(mouseX - (11*width/12-20)) <= 22) && (abs(mouseY -22) <= 22)) {
        //estado para alterar a cor azul
        if(controleDoAzul == preto) {
            controleDoAzul = branco;
        } else {
            controleDoAzul = preto;
        }
    }
}

void keyPressed() {
    if(key == CODED) {
        if(controleDoVermelho == branco) {
            if(keyCode == UP) {
                r = min(r + 5, 255);
            } else if (keyCode == DOWN) {
                r = max(r-5, 0);
            }
        }
        if(controleDoVerde == branco) {
            if(keyCode == UP) {
                g = min(g + 5, 255);
            } else if (keyCode == DOWN) {
                g = max(g-5, 0);
            }
        }
        if(controleDoAzul == branco) {
            if(keyCode == UP) {
                b = min(b + 5, 255);
            } else if (keyCode == DOWN) {
                b = max(b-5, 0);
            }
        }
    }
}
