-- seeker (nc01-drone)
-- @tehn
--
-- E1 volume
-- E2 brightness
-- E3 density
-- K2 evolve
-- K3 change worlds

rate = 1.0
loop_start = 1.0
loop_end = 10.0

function init()
	file = _path.code .. "nc01-drone/lib/bc.wav"
  file2 = _path.code .. "nc01-drone/lib/dd.wav"
  file3 = _path.code .. "nc01-drone/lib/eb.wav"

  softcut.buffer_read_mono(file,0,0,-1,1,1)
  softcut.buffer_read_mono(file2,0,0,-1,2,2)
  softcut.buffer_read_mono(file3,0,0,-1,3,3)

  softcut.enable(1,1)
  softcut.buffer(1,1)
  softcut.level(1,1)
  softcut.loop(1,1)
  softcut.loop_start(1,2)
  softcut.loop_end(1,10)
  softcut.position(1,5)
  softcut.rate(1,1.0)
  softcut.play(1,1)

  softcut.enable(2,1)
  softcut.buffer(2,1)
  softcut.level(2,1)
  softcut.loop(2,1)
  softcut.loop_start(2,20)
  softcut.loop_end(2,30)
  softcut.position(2,2)
  softcut.rate(2,0.4)
  softcut.play(2,1)

  softcut.enable(3,1)
  softcut.buffer(3,1)
  softcut.level(3,1)
  softcut.loop(3,1)
  softcut.loop_start(3,1)
  softcut.loop_end(3,10)
  softcut.position(3,1)
  softcut.rate(3,1)
  softcut.play(3,1)

  print("approaching...")
end

function enc(n,d)
  if n==1 then
    rate = util.clamp(rate+d/100,-4,4)
    softcut.rate(2,rate)
  elseif n==2 then
    loop_start = util.clamp(loop_start+d/100,1,loop_end)
    softcut.loop_start(2,loop_start)
  elseif n==3 then
    loop_end = util.clamp(loop_end+d/100,loop_start,2)
    softcut.loop_end(2,loop_end)
  end
  redraw()
end

function key(n,z)
  if n==3 and z==1 then
    randomize_all()
  end
  if n==2 and z==1 then
    randomize_all()
  end
end

function randomize_all()
  for i=1,6 do
    softcut.level(i,math.random()*0.5+0.2)
    softcut.pan(i,0.5-math.random())
    softcut.rate(i,2^(math.random(10)/2-4))
  end
end

function redraw()
  screen.clear()
  screen.move(64,50)
  screen.aa(1)
  screen.font_face(4)
  screen.font_size(50)
  screen.text_center("oootini")
  screen.update()
end
