{
TESTING CORE CURSOR FUNCTIONS:
}


program module_core_cursorTest;

{$MODE objfpc}

uses cmem, ray_header, math, sysutils;

const
  screenW = 800;
  screenH = 450;

begin
  InitWindow(screenW, screenH, 'Core module cursor test');
  SetTargetFPS(60);

  while not WindowShouldClose() do
    begin
      BeginDrawing();
        ClearBackground(RAYWHITE);
        ShowCursor;
        DrawText('Hold SPACE to toggle cursor visibility', 10, 10, 10, BLACK);
        if (IsKeyDown(KEY_SPACE)) then HideCursor;
        if IsCursorOnScreen then DrawText('Cursor is on the screen', 10, 20, 10, BLACK)
      else
        DrawText('Cursor is off the screen', 10, 20, 10, BLACK);
        DrawText('Down arrow to disable the cursor', 10, 30, 10, BLACK);
        DraWText('Up arrow to enable the cursor', 10, 40, 10, BLACK);
        if (IsKeyReleased(KEY_DOWN)) then DisableCursor; //todo: figure out what's going on here
        if (IsKeyPressed(KEY_UP)) then EnableCursor;     // and here
      EndDrawing();
        
    end;
  CloseWindow();
end.
