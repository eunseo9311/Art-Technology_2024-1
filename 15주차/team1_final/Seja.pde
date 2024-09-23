class Seja extends HumanSide {
  public Seja(int x, int y) {
    super(x, y);
    body = loadImage("seja_body.png");
    leg = loadImage("seja_leg.png");
    head = loadImage("seja_head.png");
    armRight = loadImage("seja_arm_right.png");
    armLeft = loadImage("seja_arm_left.png");
    footRight = loadImage("dad_foot.png");
    footLeft = loadImage("dad_foot.png");
    headY = -183;

    legX = legX + 10;
    legY = legY + 10;
  }

  @Override
    public void draw() {
    super.draw();
  }
}
