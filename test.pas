program move_a_rock;

{$MODE objfpc}

uses cmem, ray_header, math;

const
    screenW = 800;
    screenH = 450;

var
    rock : TTexture2D;
    rockPosition : TVector2;

begin
    InitWindow(screenW, screenH, 'Move a rock.');
    rock := LoadTexture('rock.png');
    rockPosition := Vector2Create(screenW / 2, screenH / 2);
    SetTargetFPS(60);

    while not WindowShouldClose() do
        begin

            if (IsKeyDown(KEY_RIGHT)) then rockPosition.x += 4;
            if (IsKeyDown(KEY_LEFT)) then rockPosition.x -= 4;
            if (IsKeyDown(KEY_UP)) then rockPosition.y -= 4;
            if (IsKeyDown(KEY_DOWN)) then rockPosition.y += 4;

            BeginDrawing();
                ClearBackground(RAYWHITE);
                DrawText('Move the ball with arrow keys', 10, 10, 20, DARKGRAY);
                DrawTextureV(rock, rockPosition, BLACK);
            EndDrawing();
        end;
    CloseWindow();
end.
