function y = mp3player_plotwavR(~)
 
 
% mState: 0 == stop vs. 1 == play vs. 2 == pause
mState = 0;
 
% get the screen size
screenRect = get(0,'Screensize');  % 取得位置大小訊息
screenWidth = screenRect(3);       % 寬
screenHeight = screenRect(4);      % 高
 
figWidth = 600;
figHeight = 400;
 
figX = (screenWidth - figWidth)/2;
figY = (screenHeight-figHeight)/2;
 
% create a figure
hFigure = figure(1);
set(hFigure, 'position',[figX figY figWidth figHeight], 'color','white','toolbar','none', 'menubar','none', 'numbertitle','off', 'name',' 多媒體專案mp3撥放器 ');
 
% create an axes
hAxes_BKG = axes('parent',hFigure);
set(hAxes_BKG, 'units','pixels', 'position',[1 1 figWidth figHeight], 'xtick',[], 'ytick',[], 'xcolor','w', 'ycolor','w', 'Tag','hAxes_BKG');
imgMatrix_BKG = ones(400,600,3);
imshow(imgMatrix_BKG,'parent',hAxes_BKG);
 
% create an axes for plot wave
hAxes_Wave = axes('parent',hFigure);
set(hAxes_Wave, 'units','pixels', 'position',[50 150 441 200], 'Tag','hAxes_Wave', 'xtick',[], 'ytick',[], 'box','on', 'Tag','hAxes_Wave');
axis([1 441 1 200]);
axis off;
 
 
 
% 3 buttons
% create three pushbuttons
hPushbutton_Stop = uicontrol('Style','Pushbutton', 'String','停止', 'Position',[71 51 100 30], 'Tag','hPushbutton_mState');
hPushbutton_Play = uicontrol('Style','Pushbutton', 'String','播放', 'Position',[221 51 100 30], 'Tag','hPushbutton_mState');
hPushbutton_Pause = uicontrol('Style','Pushbutton', 'String','暫停', 'Position',[371 51 100 30], 'Tag','hPushbutton_mState');
 
 
% prepare mp3 filename
mp3FileName = 'Imagine Dragons - Demons.mp3'; % 要播放的歌曲
 
% read the mp3, and prepare mp3p object
[mp3Y mp3Fs] = audioread(mp3FileName);
mp3p = audioplayer(mp3Y,mp3Fs);
 
 
 
% set timer function for mp3p ---
set(mp3p, 'TimerPeriod',0.1, 'TimerFcn',{@PlayerTimerFcn,hFigure});
 
 
 
 
% get this mp3player's info
totalSample = get(mp3p,'TotalSample');
totalSeconds = floor(totalSample/mp3Fs); % 總秒數，向下取整
songMM = floor(totalSeconds/60); % 總分鐘數，向下取整
songSS = rem(totalSeconds,60); % 顯示的秒數，向下取整

 
 
 
 
% 新增加一個滑條
hSlider = uicontrol('Style','Slider','Min',0,'Max',totalSeconds,'Value',0,'SliderStep',[1/totalSeconds 0.05],'Position',[50 120 441 10], 'Tag','hSlider');
 
 
 
 
% ============ Binding Mechanism ===========
set(hPushbutton_Stop, 'Callback',{@hPushbutton_StopFcn,hFigure});
set(hPushbutton_Play, 'Callback',{@hPushbutton_PlayFcn,hFigure});
set(hPushbutton_Pause, 'Callback',{@hPushbutton_PauseFcn,hFigure});
 
set(hSlider,'Callback',{@hSlider_Callback,hFigure});
 
 
% function 1 --> hPushbutton_StopFcn
 function hPushbutton_StopFcn(hObject, eventData, hFig)
 
 % 1 首先是獲取當前的播放狀態，需要藉助 hPushbutton_mState
 % get the handle of the pushbutton mState
%  hPushbtn_mState = findobj(hFig, 'Tag','hPushbutton_mState');
%  mState_mp3pCell = get(hPushbtn_mState,'UserData');
%  if iscell(mState_mp3pCell)
%  mState_mp3p = mState_mp3pCell{1};
%  else
%  mState_mp3p = mState_mp3pCell;
%  end
 
 % 2 其次是獲取mp3p這個變量，需要藉助 hPushbutton_mp3p
 % get the handle of hPushbutton_mp3p
%  hPushbtn_mp3p = findobj(hFig, 'Tag','hPushbutton_mp3p');
%  tmpMp3p = get(hPushbtn_mp3p, 'UserData');
 
 % 3 根據具體變量的值來判斷當前的播放狀態：0 == stop vs. 1 == play vs. 2 == pause
 if mState == 1
 stop(mp3p);
 mState = 0;
%  set(hPushbtn_mState, 'UserData',mState_mp3p);
%  % set hSlider's value as 1
 hSlider_w = findobj(hFig, 'Tag','hSlider');
 set(hSlider_w,'value',1);
 else
 if mState == 2
 stop(mp3p);
 mState = 0;
%  set(hPushbtn_mState, 'UserData',mState_mp3p);
 % set hSlider's value as 1
 hSlider_w = findobj(hFig, 'Tag','hSlider');
 set(hSlider_w,'value',1);
 else
 fprintf('pass stop\n');
 end
 end
 
 end
 
 
 
% function 2 --> hPushbutton_PlayFcn
 function hPushbutton_PlayFcn(hObject, eventData, hFig)
 
 % get the handle of the pushbutton mState
%  hPushbtn_mState = findobj(hFig, 'Tag','hPushbutton_mState');
%  mState_mp3pCell = get(hPushbtn_mState,'UserData');
%  if iscell(mState_mp3pCell)
%  mState_mp3p = mState_mp3pCell{1};
%  else
%  mState_mp3p = mState_mp3pCell;
%  end
% 
%  % get the handle of hPushbutton_mp3p
%  hPushbtn_mp3p = findobj(hFig, 'Tag','hPushbutton_mp3p');
%  tmpMp3pCell = get(hPushbtn_mp3p, 'UserData');
%  if iscell(tmpMp3pCell)
%  tmpMp3p = tmpMp3pCell{1};
%  else
%  tmpMp3p = tmpMp3pCell;
%  end
 
 
 if mState == 1
 fprintf('pass play\n');
 else
 if mState == 2
 resume(mp3p);
 mState = 1;
%  set(hPushbtn_mState, 'UserData',mState_mp3p);
 else
 play(mp3p);
 mState = 1;
%  set(hPushbtn_mState, 'UserData',mState_mp3p);
 end
 
 end
 end
 
 
 
% function 3 --> hPushbutton_PauseFcn
 function hPushbutton_PauseFcn(hObject, eventData, hFig)
 % get the handle of the pushbutton mState
%  hPushbtn_mState = findobj(hFig, 'Tag','hPushbutton_mState');
%  mState_mp3pCell = get(hPushbtn_mState,'UserData');
%  if iscell(mState_mp3pCell)
%  mState_mp3p = mState_mp3pCell{1};
%  else
%  mState_mp3p = mState_mp3pCell;
%  end
% 
%  % get the handle of hPushbutton_mp3p
%  hPushbtn_mp3p = findobj(hFig, 'Tag','hPushbutton_mp3p');
%  tmpMp3p = get(hPushbtn_mp3p, 'UserData');
 
 if mState == 1
 pause(mp3p);
 mState = 2;
%  set(hPushbtn_mState, 'UserData',mState_mp3p);
 else
 if mState == 2
 fprintf('pass pause1\n');
 else
 fprintf('pass pause2\n');
 end
 
 end
 
 
 end
 
 
 
 
% function 4 --> PlayerTimerFcn
 function PlayerTimerFcn(hObject, eventData, hFig)
 
 % 獲取mp3p的句柄
%  hSlider_w = findobj(hFig, 'Tag','hSlider');
%  hPushbutton_mp3p_w = findobj(hFig, 'Tag','hPushbutton_mp3p');
%  mp3p_w = get(hPushbutton_mp3p_w, 'UserData'); % 這個函數的第一個參數hObject本身就是mp3p對象，因為這個函數就是從屬於mp3p的
 
 
 
 % find the handle of the hAxes_Wave, and fix it
 hAxes_w = findobj(hFig, 'Tag','hAxes_Wave');
 
 % 將當前窗口hFig的坐標軸設置為hAxes_w
 set(hFig,'CurrentAxes',hAxes_w);
 
 % get the handle of the slider
 hSlider_w = findobj(hFig, 'Tag','hSlider');
 sliderValue = get(hSlider_w,'value');
 sliderV = sliderValue * 44100;
 
 % get the handle of the pushbutton mState
%  hPushbtn_mState = findobj(hFig, 'Tag','hPushbutton_mState');
%  mState_mp3pCell = get(hPushbtn_mState,'UserData');
%  if iscell(mState_mp3pCell)
%  mState_mp3p = mState_mp3pCell{1};
%  else
%  mState_mp3p = mState_mp3pCell;
%  end
 
 % get the y of mp3player
%  hPushbtn_mp3Y = findobj(hFig, 'Tag','hPushbutton_mp3Y');
%  mp3Y_Cell = get(hPushbtn_mp3Y,'UserData');
 
%  if iscell(mp3Y_Cell)
%  mp3Yy = mp3Y_Cell{1};
%  else
%  mp3Yy = mp3Y_Cell;
%  end
 
 mTotalSamples = length(mp3Y);
 mTotalSeconds = round(mTotalSamples/44100);
 
 mCurrentSample = get(hObject,'CurrentSample');
 
 % fprintf('%d\n',mCurrentSample);
 % 計算當前時間數值
 mCurrentSecond = round(mCurrentSample/mTotalSamples * mTotalSeconds);
 
 if mCurrentSecond < mTotalSeconds - 1
 
 % set the value of slider
 if mCurrentSample > sliderV & mCurrentSample < sliderV+44100
 set(hSlider_w, 'Value',mCurrentSecond);
 end
 
 mSampleRate = get(hObject,'SampleRate');
 
 tmpX = mSampleRate/100;
 axes_X = 1:tmpX;
 a = length(axes_X);
 
 mp3Y1y = mp3Y(mCurrentSample:100:mCurrentSample+44099,1);
 
%  fc = 150;
%  wn = (2/4410) * fc;
%  b = fir1(640,wn,'low',kaiser(641,3));
%  mp3Y1y = filter(b,1,mp3Y1y);
 
%  b = length(mp3Y1y);
 % fprintf('%d, %d\n',a, b);
 
 plot(axes_X, mp3Y1y, '-r');
 
 axis([1 441 -1 1]);
 axis off;
 %  set(hAxes_w,'box','on');
 %  hold off;
 
 else
%  mp3p_w = hPushbutton_mp3p_w.UserData;
 stop(mp3p);
 
 end
 
 
 
 
 
 
 
 
 end
 
 
 
 
% function 5 --> hSlider_Callback
 function hSlider_Callback(hObject, eventData, hFig)
 
 % 1 獲取mp3p的句柄
 %  hSlider_w = findobj(hFig, 'Tag','hSlider');
 
%  hPushbutton_mp3p_w = findobj(hFig, 'Tag','hPushbutton_mp3p');
%  mp3p_w = get(hPushbutton_mp3p_w,'UserData');
 
 % get the y of mp3player
%  hPushbtn_mp3Y = findobj(hFig, 'Tag','hPushbutton_mp3Y');
%  mp3Y_Cell = get(hPushbtn_mp3Y,'UserData');
% 
%  if iscell(mp3Y_Cell)
%  mp3Yy = mp3Y_Cell{1};
%  else
%  mp3Yy = mp3Y_Cell;
%  end
 
 % 2 calculate totalsamples and totalseconds
 mTotalSamples = get(mp3p,'TotalSample');
 mTotalSeconds = round(mTotalSamples/44100);
 
 %  mCurrentSample = get(mp3p_w,'CurrentSample');
 %  mCurrentSecond = round(mCurrentSample/44100);
 %  mCurrentSecond = mCurrentSample/mTotalSamples * mTotalSeconds;
 
 % 3 獲取hSlider的當前值，併計算當前採樣點
 sliderCurrentSecondCell = get(hObject,'value');
 
 if iscell(sliderCurrentSecondCell)
 sliderCurrentSecond = sliderCurrentSecondCell{1};
 else
 sliderCurrentSecond = sliderCurrentSecondCell;
 end
 
 mCurrentSample = round(sliderCurrentSecond * 44100);
 %  fprintf('sliderCurrentSecond = %d, mCurrentSample = %d', sliderCurrentSecond, mCurrentSample);
 %  if mCurrentSecond > sliderCurrentSecond & mCurrentSample < sliderCurrentSecond + 1
 %  set(hSlider_w,'Value',sliderCurrentSecond);
 %  end
 
 %  mp3p_w = hPushbutton_mp3p_w.UserData;
 % set(mp3p_w,'CurrentSample',mCurrentSample);
 pause(mp3p);
 %  set(hSlider_w,'Value',sliderCurrentSecond);
 play(mp3p,mCurrentSample);
 %  get(mp3p_w,'CurrentSample');
 %  sliderSeconds = mCurrentSample/mTotalSamples * mTotalSeconds;
 %  set(hObject,'value',);
 
 
 end
 
 
 
 
 
 
 
 
 
 
 
y = hFigure;
 
end
