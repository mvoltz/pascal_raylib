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
        if IsCursorOnScreen then DrawText('Cursor is on the screen', 10, 20, 10, BLACK)
      else
        DrawText('Cursor is off the screen', 10, 20, 10, BLACK);
        DrawText('Hold SPACE to toggle cursor visibility', 10, 10, 10, BLACK);
        if (IsKeyDown(KEY_SPACE)) then HideCursor;
      EndDrawing();
        
    end;
  CloseWindow();
end.
