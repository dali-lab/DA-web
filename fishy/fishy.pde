TailedFish fish_1;
TailedFish fish_2;
JellyFish jelly_1;
Turtle turtle_1;
CatFish cat_1;
Collection collection;
JavaScript javascript;

color white = #FFFFFF;
color c = #fd9525;
color red_c = #f56768;
color blue = #cbeef4;
color whisker_green = #56f19f;

int[] rainXpos = new int[90];
int[] rainYpos = new int[90];


// remove constant height of 800

interface JavaScript { void p_get_width();}
void bindJavascript(JavaScript js) { javascript = js;}



void setup() {

	size(1000,800);

	collection = new Collection();

	//normal fish scale
	float scale_x = 200;
	float scale_y = 167;
	//jelly fish scale
	float jelly_scale_x = 430;
	float jelly_scale_y = 265;
	//turtle scale
	float turtle_scale_x = scale_x;
	float turtle_scale_y = scale_y;
	//cat fish scale
	float cat_scale_x = scale_x;
	float cat_scale_y = scale_y;

	//fish: x, y, width, height
	//if you add new fish...update the body count to match
	
	collection.fill_array(4);
	
	//change this baby
	String path = "http://localhost/wordpress/wp-content/themes/twentyfourteen/fishy/";
	
	fish_1 = new TailedFish(scale_x*.6, scale_y*.6, path + "fish_01_03.png", true, true);
	
	fish_2 = new TailedFish(scale_x, scale_y, path + "fish_01_03.png", true, true);

	jelly_1 = new JellyFish(jelly_scale_x*.4, jelly_scale_y*.4, 6, path + "fish_04.png");
	
   //turtle_1 = new Turtle(turtle_scale_x*.6, turtle_scale_y*.6, "fish_01_03.png");
	cat_1 = new CatFish(cat_scale_x, cat_scale_y, path + "cat_fish_02.png");

	for (int c = 0; c < rainXpos.length; c++)
	{
	rainXpos[c] = 0;
	rainYpos[c] = 0;
	}


	
	
}

void resize(){
	if(javascript != null){
		int x = int(javascript.p_get_width());
		size(x, 800);
	} else {
		printl("LOL. Saisi messed up lmao");
	}
	
}

void draw() {

	background(blue);
	//make_it_rain();
	

	if(javascript!=null && !bound){
		size(int(javascript.p_get_width()), 800); 
		bound = true;
	}
	//background(blue);


	

	fish_1.sketch_whole();
	fish_1.move();
	

	fish_2.sketch_whole();
	fish_2.move();



	jelly_1.sketch();
	jelly_1.move();



	// turtle_1.sketch();
	// turtle_1.move();

	cat_1.sketch();
	cat_1.move();



}


void make_it_rain(){
  fill(0);
  
  rainXpos[rainXpos.length-1] = int(random(1,width));
  rainYpos[rainYpos.length-1] = int(random(1,height));
   
  for (int c =0; c < rainXpos.length -1 ; c++)
  {
  rainXpos[c]=rainXpos[c+1];
  rainYpos[c]=rainYpos[c+1];
  }
   
  for (int c =0; c< rainXpos.length; c++)
  {
    stroke(155,155,155,c);
    noFill();
    ellipse(rainXpos[c],rainYpos[c],90-c,90-c);
  }

}

class Collection{
	int body_count;
	float created_body_count;
	float[] array;

	Collection(){

	}

	void fill_array(int x){
		body_count = x;
		array = new float[x];
		for(int i = 0; i < x; i+= 1){
			array[i] = -1;
		}
	}

}

class Body{
	float x, y, w, h;
	PImage img;
	float angle;
	float offset_x;
	float angle_offset;
	float offset_y;

	int numBubbles = 50;
	float bubble_count = 0;
	float bubble_pacer = 5000;
	Bubble[] bubbles;
	boolean start = true;

	Body(){
		x = 0;
		angle = random(0, TWO_PI);
		offset_x = .1 * random(5, 10+1);
		offset_y = .1 * random(5, 10+1);
		angle_offset = .15;
		place_body();
		generate_bubble_array();

		//.01 * random(5,15);		
	}

	void place_body(){

		float space = height/collection.body_count - 1;
		boolean quit = true;
		int a = 0;

		while (quit){

			a = (int) random(1,collection.body_count+1);
			a -= 1;
			if(collection.array[a] == -1){
				collection.array[a] = a * space;
				quit = false;
			}
		}

		// int buffer_y = 0+height/5;
		// if (collection.array[a] < buffer_y){
		// 	collection.array[a] = buffer_y;
		// }

		// x = random(0+width/4, width-width/4);
		x = random(0, width+1);
		y = collection.array[a];


		if(x >  width/2){
			offset_x *= -1;
		}
	}


	void generate_bubble_array(){

	    bubbles = new Bubble[numBubbles];
	    for (int i = 0; i < numBubbles; i++) {
	        bubbles[i] = new Bubble();
	    }

	}

	void blow_bubbles(){

		bubble_pacer+= 1;

		// if(bubble_pacer < 10000 && !start){
		// 	return;
		// }

		// if(bubble_pacer > 10000 && start){
		// 	start = false;
		// 	bubble_pacer = 1;
		// 	return;
		// }

		if(bubble_pacer > 100){
			bubble_count += 1;
			bubble_pacer = 0;
		}



		

		if(bubble_count > numBubbles){
			bubble_count = numBubbles;
		}

	    smooth();
	    boolean  destroy = false;
	    for (int i = 0; i < bubble_count; i++) {

	    	if(bubbles[i] == null){
	    		continue;
	    	}

	    	if(bubbles[i].isJuvenile()){

	    		if(offset_x < 0){
	    			bubbles[i].set_loc(x-10-w, y+(h/2));
	    		} else {
	    			bubbles[i].set_loc(x+10+w, y+(h/2));
	    			
	    		}
	    	}

	        bubbles[i].update();
	        bubbles[i].render();
	        if ( bubbles[i].loc.y < -50) {
	           if(bubbles[i].reset(bubbles[bubbles.length - 1])){
	           		destroy = true;
	           		bubble_count = 0;
	           		bubble_pacer = 5000;
	           		break;
	           }

	           bubbles[i] = null;
	        }
	    }

	    if (destroy){
	    	generate_bubble_array();
	    }
	}

}

class Eye {
	float x, y, w, h;
	color r;

	Eye(float start_x, float start_y, float breadth, float headth, color rangi){
		x = start_x;
		y = start_y;
		w = breadth;
		h = headth;
		r = rangi;
	}

	void sketch(){
		fill(r);
		ellipse(x, y, w, h);
	}
}

class Fish extends Body {

	Fish (float breadth, float headth, String filename){
		super();
		w = breadth;
		h = headth;
		img = loadImage(filename);
	}
	
	
	void sketch(){
		blow_bubbles();	

		if (offset_x < 0){
			pushMatrix();
			translate(x, y);
			scale(-1, 1);
			sketch_sub(0,0);
			popMatrix();

		} else {
			sketch_sub(x,y);
		}

	}

	void sketch_sub(float x, float y){
		image(img, x, y, w, h);	
		noStroke();
		
		float pupil_x = x + (w*.7);
		float pupil_y = y + (h*.3);
		Eye pupil = new Eye(pupil_x, pupil_y, h/12, h/12, white);
		pupil.sketch();

		Eye iris = new Eye(pupil_x, pupil_y, h/20, h/20, red_c);
		iris.sketch();		
	}

	void move(){
		if((x < -w) && offset_x < 0) {
			offset_x *= -1;
		}
		else if((x > (width+w)) && offset_x > 0){
			offset_x *= -1;
		}


		x+= offset_x;

		angle += angle_offset;
		//angle += .15;
		y += sin(angle) * .5;
	}


	float get_x(){
		return x;
	}

	float get_y(){
		return y;
	}

	float get_offset_x(){
		return offset_x;
	}

}


class TailedFish extends Fish {

	boolean draw_t = true;
	boolean draw_p = true;
	
	TailedFish(float c, float d, String f, boolean g, boolean i){
		super(c, d , f);
		draw_t = g;
		draw_p = i;
	}
	
	//
	void sketch_tail(){
		smooth();
		noStroke();
		
		fill(c);
		ellipse(x+(w/10), y+(w*.4), w/2, h/1.75);
	}

	// sides__
	void sketch_pectoral(){
		smooth();
		noStroke();
		fill(c);
		//arc(x*3, y*1.6, w/5, tail_h/3.5,PI/2,PI+(PI/2), CHORD);

		float fin_width = w/6;
		float fin_height = h/3.5;

		float a = x+w/2.5;
		float b = y+h/2-fin_height;
		pushMatrix();
		translate(a, b);
		rotate(radians(25));

		// tl, tr, bl, br
		rect(0, 0 , fin_width, fin_height, fin_width/.5, fin_width/5, fin_width/5, fin_width/.5);
		popMatrix();
	}
	
	
	void sketch_whole(){
		blow_bubbles();	

		if(super.get_offset_x() < 0){


			float old_x = x;
			float old_y = y;
			x = 0;
			y = 0;


			pushMatrix();
			translate(old_x, old_y);
			scale(-1,1);

			if (draw_p){
				sketch_tail();
			}
			popMatrix();

			x = old_x;
			y = old_y;


			
			sketch();

			old_x = x;
			old_y = y;
			x = 0;
			y = 0;

			pushMatrix();
			translate(x, y);
			scale(-1,1);			
			if(draw_t){
				sketch_pectoral();
			}
			popMatrix();

			x = old_x;
			y = old_y;	



		} else {

			if (draw_p){
				sketch_tail();
			}
			
			sketch();

			if(draw_t){
				sketch_pectoral();
			}

		}


	}

	void move(){
		super.move();
		x = super.get_x();
		y = super.get_y();
	}

	float get_x(){
		return x;
	}

	float get_y(){
		return y;
	}
	
}


class CatFish extends Body{
	
	CatFish ( float breadth, float headth, String filename){
		super();

		w = breadth;
		h = headth;
		img = loadImage(filename);

	}
	
	void sketch_tail(){
		smooth();
		noStroke();
		fill(c);
		ellipse(x+(w/10), y+(w*.4), w/2, h/1.75);
	}
	
	void sketch_ears(){
		smooth();
		stroke(whisker_green);
		triangle(x+(w*.7), y-(h/10), x+(w*.925), y+(h/2.5), x+(w/4)*2,y+(h/2.5));
		triangle(x+(w*.8), y-(h/30), x+(w*.9), y+(h/2.5), x+(w/3)*2,y+(h/2.5));
		noStroke();
	}


	void sketch_paw_top(){
		fill(c);
		ellipse(x+(w/1.35), y+(w*.5), w/8, h/8);		
	}

	void sketch_paw_bottom(){
		fill(c);
		ellipse(x+(w*.97), y+(w*.5), w/8, h/8);		
	}

	void sketch_nose(){
		fill(white);
		stroke(whisker_green);

		float a = x+(w*.97);
		float b = y+(w*.3);
		float c = w/8;
		float d = h/8;

		strokeWeight(2);

		line(a,b,a-c*2, b+d);
		line(a,b,a-c*1.75, b+d*.25);
		strokeWeight(1);
		line(a,b,a+c*1.25, b-d);
		line(a,b,a+c*1.25, b-d*.25);

		noStroke();
		ellipse(a, b, c, d);	
	}

	void sketch(){	

		blow_bubbles();	

		if(offset_x < 0){
			float old_x = x;
			float old_y = y;
			x = 0;
			y = 0;

			pushMatrix();
			translate(old_x, old_y);
			scale(-1,1);
			sketch_sub();
			popMatrix();

			x = old_x;
			y = old_y;

		} else {
			sketch_sub();
		}






	}

	void sketch_sub(){
		sketch_tail();
		sketch_paw_bottom();	
		sketch_ears();

		image(img, x, y, w, h);	
		noStroke();
		
		float pupil_x = x + (w*.8);
		float pupil_y = y + (h*.3);
		Eye pupil = new Eye(pupil_x, pupil_y, h/12, h/12, white);
		pupil.sketch();

		Eye iris = new Eye(pupil_x, pupil_y, h/20, h/20, red_c);
		iris.sketch();

		sketch_paw_top();
		sketch_nose();		
	}

	void move(){
		if((x < -w) && offset_x < 0) {
			offset_x *= -1;
		}
		else if((x > (width+w)) && offset_x > 0){
			offset_x *= -1;
		}

		x+= offset_x;

		angle += angle_offset;
		y += sin(angle) * .5;
	}


	float get_x(){
		return x;
	}

	float get_y(){
		return y;
	}

	
}

class JellyFish extends Body{

	int leg_limit;
	float[] leg_heights;
	float[] leg_angles;
	float[] leg_tickers;


	int ticker = 1;


	JellyFish ( float breadth, float headth, int leg_count, String filename){
		super();

		w = breadth;
		h = headth;
		img = loadImage(filename);
		leg_limit = leg_count + 1;
		leg_heights = new float[leg_limit];
		leg_angles = new float[leg_limit];
		leg_tickers = new float[leg_limit];


		for(int i = 0; i < leg_limit; i+=1) {
			leg_heights[i] = random(h/2.5,h/1.5);
			leg_angles[i] = random(0,90);
			leg_tickers[i] = 0;
		}
	}

	void sketch(){	

		blow_bubbles();	

		if(offset_x < 0){

			float old_x = x;
			float old_y = y;
			x = 0;
			y = 0;

			pushMatrix();
			translate(old_x, old_y);
			scale(-1,1);
			sketch_sub();
			popMatrix();

			x = old_x;
			y = old_y;


		} else {
			sketch_sub();
		}
		
		
	}

	void sketch_sub(){

		noStroke();
		float pupil_x = x + (w*.35);
		float pupil_y = y + (h*.82);
		float leg_distance = w/(leg_limit*2);
		float jelly_leg_y = pupil_y;
		float jelly_leg_x = x;


		fill(c);

		// legs
		for (int i = 0; i < leg_limit; i+=1){
			jelly_leg_x += leg_distance*1.5;
			

			float displacement = abs(sin(leg_angles[i]));
			float leg_angle = leg_angles[i];
			float leg_height = leg_heights[i];

			// if(displacement < .1 || displacement > .9){
			// 	leg_angles[i] += 45;
			// 	displacement = abs(sin(leg_angles[i]));
			// }

			if(i % 3 == 0){
				displacement = 1 - displacement;
			} 


			// pushMatrix();
			// translate(jelly_leg_x +(sin(angle) * 3), jelly_leg_y);
			// scale(1, .8);
			// rect(0, 0 , leg_distance, leg_height*displacement, 0, 0, leg_distance/2, leg_distance/2);
			// popMatrix();

			rect(jelly_leg_x +(sin(angle) * 3), jelly_leg_y , leg_distance, leg_height*displacement, 0, 0, leg_distance/2, leg_distance/2);
			leg_tickers[i] += 1;

			if(leg_tickers[i] % 60 == 0){
				leg_angles[i] += .15;
			}

			if(leg_angle > 20000 && leg_angle % 90 == 0){
				leg_angles[i] = 0;
			}
			
		}




		// body
		image(img, x, y, w, h);	

		//eyes
		for (int i = 0; i < 2; i+= 1) {
			Eye pupil = new Eye(pupil_x, pupil_y, h/12, h/12, white);
			pupil.sketch();
			Eye iris = new Eye(pupil_x, pupil_y, h/20, h/20, red_c);
			iris.sketch();
			pupil_x = x + (w*.7);
		}		
	}

	void move(){
		if((x < -w) && offset_x < 0) {
			offset_x *= -1;
		}
		else if((x > width+w) && offset_x > 0){
			offset_x *= -1;
		}

		x+= offset_x;

		angle += angle_offset;
		y += sin(angle) * .5;
	}

	float get_x(){
		return x;
	}

	float get_y(){
		return y;
	}

}


class Turtle extends Body{
	
	Turtle (float breadth, float headth, String filename){
		super();

		w = breadth;
		h = headth;
		img = loadImage(filename);

		if(x + w + w*.5 > width){
			x = width - w- w*.5;
		}
	}
	
	void draw_head(){
		

		float head_x = x+(w*.475);
		float head_y = y+(h/8);
		float head_w = w/2;
		float head_h = h/1.75;

		float pupil_x = x+(w*.375);
		float pupil_y = y - (h/14);




		fill(c);
		ellipse(head_x, head_y, head_w, head_h);

		for (int i = 0; i < 2; i+= 1) {
			Eye pupil = new Eye(pupil_x, pupil_y, h/12, h/12, white);
			pupil.sketch();
			Eye iris = new Eye(pupil_x, pupil_y, h/20, h/20, red_c);
			iris.sketch();
			pupil_x = x+(w*.57);
		}


	}


	void draw_limbs(){
		fill(c);
		arc(x+w/7, y+h/3, w/1.5, h/2, PI, 2*PI, CHORD);
		arc(x+w*6/7, y+h/3, w/1.5, h/2, PI, 2*PI, CHORD);
		ellipse(x+w/1.5, y+w/1.5, w/2.15, w/2);
		ellipse(x+w/3.5, y+w/1.5, w/2.15, w/2);

	}
	
	void sketch(){

		blow_bubbles();	
		if(offset_y > 0){

			float old_x = x;
			float old_y = y;
			x = 0;
			y = 0;

			pushMatrix();
			translate(old_x, old_y);
			scale(1,-1);
			sketch_sub();
			popMatrix();

			x = old_x;
			y = old_y;


		} else {
			sketch_sub();
		}

		
	}

	void sketch_sub(){
		noStroke();	
		draw_head();
		draw_limbs();	
		image(img, x, y, w, h);			
	}

	void move(){

		if((y < -h) && offset_y < 0) {
			offset_y *= -.75;
		}
		else if((y > (height+h)) && offset_y > 0){
			offset_y *= -.75;
		}


		y+= offset_y;

		angle += angle_offset;
		x += sin(angle) * .5;
	}


	float get_x(){
		return x;
	}

	float get_y(){
		return y;
	}

}

class Bubble
{
    PVector loc;
    float   speed;
    float   radius;
    boolean juvenile = true;
     
    Bubble()
    {
        speed = random(0.5, 2);
        radius = 5;
    }

    void set_loc(float x, float y ){
    	loc = new PVector(x,y);
    	juvenile = false;
    }
    
    boolean isJuvenile(){
    	return juvenile;
    }

    void update()
    {
        loc.y -= speed;
    }
     
    void render()
    {
        stroke(59, 173, 224);
        fill(59, 173, 224, 64);
        int i = 3;
        // for (int i = 1; i < 3; i++) {
        ellipse( loc.x, loc.y, i * radius * 2, i * radius * 2 );
        //}
    }
     
    boolean reset(Bubble bubble)
    {
    	return (this == bubble);
        // loc.x = random(width);
        // loc.y = height + 50;
        // speed = random(0.5, 2);
        // radius = random( 5, 10 );
    }
     
}