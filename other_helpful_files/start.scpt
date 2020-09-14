-- To run:
-- $ osascript start.scpt

tell application "iTerm2"
 
  activate current session
  create tab with default profile in current window
 
  tell current session in current window
    -- set name to (q as string)
    write text ("rails-dashboard bin/rails server" as string)
 
    tell split horizontally with default profile
      -- set name to (q as string)
      write text ("cd client && yarn run dashboard" as string)
    end tell
  end tell
 
end tell