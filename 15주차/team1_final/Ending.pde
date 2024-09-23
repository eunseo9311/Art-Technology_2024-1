import processing.video.*;

class Ending {
    PImage[] creditsImages = new PImage[4];
    PFont font;
    int currentGroupIndex = 0;
    int startTime;
    Movie video;
    boolean creditsStarted = false;
    
    public Ending() {
        pushStyle();
        font = createFont("Pretendard-Bold.ttf", 26);
        textFont(font);
        textAlign(CENTER);
        textSize(26);

        // Load and play the video
        video = new Movie(EighthScene.this, "video.mp4");

        // Load the credits images
        creditsImages[0] = loadImage("ending_text1.png");
        creditsImages[1] = loadImage("ending_text2.png");
        creditsImages[2] = loadImage("ending_text3.png");
        creditsImages[3] = loadImage("ending_text4.png");

        popStyle();
    }

    void startCredits() {
        startTime = millis();
        creditsStarted = true;
    }

    void draw() {
        if (video.available()) {
            video.read();
        }

        // Display the video as background
        image(video, 0, 0, width, height);

        if (!creditsStarted) {
            return;
        }

        // Calculate elapsed time
        int elapsedTime = millis() - startTime;

        // Calculate which group to show based on elapsed time
        int groupDuration = 5000;  // 5 seconds in milliseconds
        int totalGroups = creditsImages.length;

        // Update currentGroupIndex based on elapsed time and group duration
        currentGroupIndex = (elapsedTime / groupDuration);

        // If all groups have been shown, do not show any more credits
        if (currentGroupIndex < totalGroups) {
            // Fade effect
            float alphaDuration = groupDuration / 4.0;  // Fade duration is 1.25 seconds
            float alpha = map(elapsedTime % groupDuration, 0, alphaDuration, 0, 255);
            if (elapsedTime % groupDuration > groupDuration - alphaDuration) {
                alpha = map(elapsedTime % groupDuration, groupDuration - alphaDuration, groupDuration, 255, 0);
            }
            pushStyle();
            tint(255, alpha);

            // Display the current group of credits
            image(creditsImages[currentGroupIndex], width/2 - creditsImages[currentGroupIndex].width/2, height/2 - creditsImages[currentGroupIndex].height/2);
            popStyle();  
      }
    }

    // Handle movie event
    void movieEvent(Movie m) {
        m.read();
    }
}
