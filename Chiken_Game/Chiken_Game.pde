int puntaje;
int tiempo;
int game=0;
PImage maiz;
PFont font;
PFont resultado;
PImage fondo;
PImage pantalla;
PImage pollo;
int cuadros=0;
int vel =1;
float posX[];
float posY[];
int estado [];
int x1= 150;
float distancia=0;


void setup() {

  size (300, 300);
  
  posX =new float[100];
  posY =new float[100];
  
  estado = new int [100];
  
  font = createFont("Mager.otf", 20);
  resultado = font;
  tiempo=60; 
  
  for(int i=0; i<100; i++){
    

  posX[i]=random(300);
  posY[i]=random(300);
  
  estado[i]+=2;
  
}
}

void draw(){
  
    fondo = loadImage("fondo.png");
    pantalla = loadImage("pantallas.png");
    
    
  if (game==1){
    cuadros++;
    if(cuadros ==10){
    tiempo--;
    cuadros=0;
    
    }
  }  
  //patallas
  switch(game) {
    
  case 0:
  //pantalla inicio
    background(pantalla);
    textFont(font, 15); 
    textAlign(CENTER);
    text("Haz que el pollito coma la mayor cantidad", 160, 110);
    text("de maiz en un minuto.",160,130);
    textFont(font); 
    textAlign(CENTER);
    text("Jugar", 150, 210);
    break;
    
  case 1: 
  //pantalla juego
    background(fondo);
    textFont(font); 
    text("Puntaje: "+puntaje,38,40);
    text("Tiempo: "+tiempo, 40, 20);
    
    for(int i=0; i<10;i++){
      
     maiz = loadImage("Maiz.png"); 
     image(maiz,posX[i],posY[i]);
     posY[i] =posY[i]+5;
     
     if(posY[i]>height){
       posY[i] =0;
     
     }
     if(x1>width){
       x1 =width-30;
     
     }
     else if(x1<0){
       x1 =30;
     
     }
     
     if(posX[i]-20<x1 && posX[i]+20>x1 && posY[i]>(height-20)) {
         puntaje +=1;
         println("p: "+puntaje);
     }else{
       
     }
   }
   tecladoInteraction();
   if(tiempo==0){
    game=2;
    }
    
    break;
    
    case 2:
    //pantalla final
    background(pantalla);
    textFont(resultado, 20); 
    textAlign(CENTER);
    text("Fin del juego\n\nTu puntaje es de: " +puntaje, 150, 70);
    textFont(font); 
    text("Reiniciar", 150, 180);
    break;
  }
  if(mousePressed == true){
    //reiniciar
    tiempo=60;
    puntaje=0;
    x1=width/2;
    game=1;
    
  
  }
  else if(mousePressed==false){
    fondo = loadImage("fondo.png");

  }else if (tiempo==0) {
    game=2;
  }
}   

void tecladoInteraction(){
 for(int i=0; i<10;i++){
   
  pollo = loadImage("pollito.png");
 image(pollo,x1,270);
 
  if(keyPressed ==true){
   if(key==CODED){
     
    if(key =='a' || key =='A'||keyCode ==LEFT){
       
    x1= x1-vel;
       
    }
    
    if(key =='d' || key =='D'||keyCode ==RIGHT){
      
    x1= x1+vel;
      
    }
   }
    distancia= dist(key,key,posX[i],posY[i]);
    if(distancia<10){
  
    estado[i]=0;
    
  }
  }
 }
}
