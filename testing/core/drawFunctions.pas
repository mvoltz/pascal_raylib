{
TESTING CORE CURSOR FUNCTIONS:
}


program drawFunctions;

{$MODE objfpc}

uses cmem, ray_header, math, sysutils;

const
  screenW = 800;
  screenH = 450;

var
  circlePos : TVector2;
  rectW : Integer;
  rectH : Integer;

begin
  InitWindow(screenW, screenH, 'Draw things test');
  SetTargetFPS(60);
  circlePos := Vector2Create( screenW / 2, screenH / 2 );
  rectW := 30;
  rectH := 60;

  while not WindowShouldClose() do
    begin
      BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawCircleV(circlePos, 100, RED);
        DrawRectangle( 400, 225, rectW, rectH, BLACK);
      EndDrawing();
        
    end;
  CloseWindow();
end.
