program animation_test;

{$MODE objfpc}

uses cmem, ray_header, ray_rlgl, ray_math;

const
	screenWidth = 800;
	screenHeight = 450;

var
  cam: TCamera;
  model : TModel;
  texture : TTexture2D;
  position : TVector3;
  animsCount, animFrameCounter : Integer;
  anims : PModelAnimation;
  i : Integer;
begin

	InitWindow(screenWidth, screenHeight, 'Animation Test');	

	cam.position := Vector3Create(15.0, 15.0, 15.0);
	cam.target := Vector3Zero();
	cam.up := Vector3Create(0.0, 1.0, 0.0);
	cam.fovy := 45.0;
	cam._type := CAMERA_PERSPECTIVE;

	model := LoadModel('/home/mark/gits/Ray4Laz/binary/resources/guy/guy.iqm');
	texture := LoadTexture('/home/mark/gits/Ray4Laz/binary/resources/guy/guytex.png');
	SetMaterialTexture(@model.materials[0], MAP_DIFFUSE, texture);

	position := Vector3Zero();

	// Load Animation Data
	animsCount := 0;
	anims := LoadModelAnimations('/home/mark/gits/Ray4Laz/binary/resources/guy/guy.iqm', @animsCount);
	animFrameCounter := 0;

	WriteLn('animsCount: ', animsCount);

	SetCameraMode(cam, CAMERA_FREE);

	SetTargetFPS(60);

	while not WindowShouldClose() do
	begin
		// Test that we are receiving the Struct data back correctly (YES)
		//mousePos := GetMousePosition();
		//WriteLn('Mouse Pos: ', FloatToStr(mousePos.x), ', ', FloatToStr(mousePos.y));

		UpdateCamera(@cam);

		if IsKeyDown(KEY_SPACE) then
		begin
			inc(animFrameCounter);
			UpdateModelAnimation(model, anims[0], animFrameCounter);
			if animFrameCounter >= anims[0].frameCount then
				animFrameCounter := 0;
		end;

		BeginDrawing();
			ClearBackground(RAYWHITE);
			BeginMode3d(cam);
		
				DrawModelEx(model, position, Vector3Create(1.0, 0.0, 0.0), -90.0, Vector3Create(1.0, 1.0, 1.0), WHITE);
				for i := 0 to model.boneCount - 1 do
				begin
				  DrawCube(anims[0].framePoses[animFrameCounter][i].translation, 0.2, 0.2, 0.2, RED);
				end;
				DrawGrid(10, 1.0);
		
		
			EndMode3D();
			DrawFPS(10, 10);
		EndDrawing();
	end;
	UnloadTexture(texture);
	for i := 0 to animsCount - 1 do
		UnloadModelAnimation(anims[i]);
	
        Free(anims);

	UnloadModel(model);


	CloseWindow();
end.
