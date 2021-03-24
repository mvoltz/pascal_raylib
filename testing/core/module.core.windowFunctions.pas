{
TESTING WINDOW CORE FUNCTIONS:
  InitWindow
  WindowShouldClose
  CloseWindow
  IsWindowReady
  IsWindowFullScreen
  IsWindowHidden
  IsWindowMinimized
  IsWindowMaximized
  IsWindowFocused
  IsWindowResized
  ToggleFullScreen
}


program module_core_testing;

{$MODE objfpc}

uses cmem, ray_header, math, sysutils;

const
  screenW = 800;
  screenH = 450;

begin
  InitWindow(screenW, screenH, 'Testing Core Module');
  SetTargetFPS(60);

  while not WindowShouldClose() do
    begin
      BeginDrawing();
        ClearBackground(RAYWHITE);
        If IsWindowReady then DrawText('IsWindowReady: returned True', 10, 10, 10, BLACK);
        If IsWindowFullScreen then DrawText('IsWindowFullscreen: Window is fullscreen', 10, 20, 10, BLACK)
      else
        DrawText('IsWindowFullscreen: Window is NOT fullscreen', 10, 20, 10, BLACK);
        If IsWindowHidden then DrawText('IsWindowHidden: Window is hidden', 10, 30, 10, BLACK)
      else
        DrawText('IsWindowHidden: Window is NOT hidden', 10, 30, 10, BLACK);
        If IsWindowMinimized then DrawText('IsWindowMinimized: Window is Minimized', 10, 40, 10, BLACK)
      else
        DrawText('IsWindowMinimized: Window is NOT Minimized', 10, 40, 10, BLACK);
        If IsWindowMaximized then DrawText('IsWindowMaximized: Window is Maximized', 10, 50, 10, BLACK)
      else
        DrawText('IsWindowMaximized: Window is NOT Maximized', 10, 50, 10, BLACK);
        If IsWindowFocused then DrawText('IsWindowFocused: Window has Focus', 10, 60, 10, BLACK)
      else
        DrawText('IsWindowFocused: Window has lost Focus', 10, 60, 10, BLACK);
        If IsWindowResized then DrawText('IsWindowResized: Window has been Resized', 10, 70, 10, BLACK)
      else
        DrawText('IsWindowResized: Window has not been Resized', 10, 70, 10, BLACK);
{ TODO:
  void SetWindowState(unsigned int flags);   // Set window configuration state using flags
  void ClearWindowState(unsigned int flags);         // Clear window configuration state flags
  void ToggleFullscreen(void);                       // Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
  void MaximizeWindow(void);                         // Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
  void MinimizeWindow(void);                         // Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
  void RestoreWindow(void);                          // Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
  void SetWindowIcon(Image image);                   // Set icon for window (only PLATFORM_DESKTOP)
  void SetWindowTitle(const char *title);            // Set title for window (only PLATFORM_DESKTOP)
  void SetWindowPosition(int x, int y);              // Set window position on screen (only PLATFORM_DESKTOP)
  void SetWindowMonitor(int monitor);                // Set monitor for the current window (fullscreen mode)
  void SetWindowMinSize(int width, int height);      // Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
  void SetWindowSize(int width, int height);         // Set window dimensions
  void *GetWindowHandle(void);                       // Get native window handle
  int GetScreenWidth(void);                          // Get current screen width
  int GetScreenHeight(void);                         // Get current screen height
  int GetMonitorCount(void);                         // Get number of connected monitors
  Vector2 GetMonitorPosition(int monitor);           // Get specified monitor position
  int GetMonitorWidth(int monitor);                  // Get specified monitor width
  int GetMonitorHeight(int monitor);                 // Get specified monitor height
  int GetMonitorPhysicalWidth(int monitor);          // Get specified monitor physical width in millimetres
  int GetMonitorPhysicalHeight(int monitor);         // Get specified monitor physical height in millimetres
  int GetMonitorRefreshRate(int monitor);            // Get specified monitor refresh rate
  Vector2 GetWindowPosition(void);                   // Get window position XY on monitor
  Vector2 GetWindowScaleDPI(void);                   // Get window scale DPI factor
  const char *GetMonitorName(int monitor);           // Get the human-readable, UTF-8 encoded name of the primary monitor
  void SetClipboardText(const char *text);           // Set clipboard text content
  const char *GetClipboardText(void);                // Get clipboard text content
}

      EndDrawing();
        
    end;
  CloseWindow();
end.
