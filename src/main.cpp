#include "includes.h" 

int x = 0;
int y = 0;

void frame() {
    BeginDrawing();
    ClearBackground(RAYWHITE);
    DrawText("It worked!", x, y, 20, BLACK);

    if (IsKeyDown(KEY_RIGHT)) {
      x += 1;
    } else if (IsKeyDown(KEY_LEFT)) {
      x -= 1;
    }

    if (IsKeyDown(KEY_UP)) {
      y -= 1; 
    } else if (IsKeyDown(KEY_DOWN)) {
      y += 1;
    }

    EndDrawing();
}

void main_loop() {
  while (!WindowShouldClose()) {
    frame();
  }


}

int main(int argc, const char **argv) {
    InitWindow(800, 600, "Hello World");
    SetTargetFPS(60);

    #if defined(PLATFORM_WEB)
      emscripten_set_main_loop(&frame, 0, 1);
    #else
      main_loop();
    #endif

    CloseWindow();

    return 0;
}
