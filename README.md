# MATLAB-MP3
![GitHub last commit](https://img.shields.io/github/last-commit/Xiang511/MATLAB-MP3?style=for-the-badge)
![Github Created At](https://img.shields.io/github/created-at/XIang511/MATLAB-MP3?style=for-the-badge&color=green)
![GitHub License](https://img.shields.io/github/license/Xiang511/MATLAB-MP3?style=for-the-badge)

使用MATLAB-GUI設計一個音樂播放器

### Features
- 透過按鍵實現暫停，播放等功能。
- 附有可視化拉條直覺的控制歌曲播放
- 運用課程學到的GUI設計和檔案讀取

### Process introduction
1. 建立一個控制窗口，並設立按鈕。
2. 讀取音樂文件
3. 設立指標數字mState決定按鈕在不同階段時須做出的動作
4. 在執行的時候判斷執行的狀態：stop vs. play vs. pause。
5. 利用audioplayer的timerfcn實現CurrentSample的變化帶動Slider緩慢移動。

## Usage
```
MATLAB-R2021 : 開啟資料夾並切換至對應的工作區再執行Script程式碼
```
```MATLAB
mp3FileName = 'Imagine Dragons - Demons.mp3'; % 修改要播放的歌曲
```

## Demo

```
https://www.youtube.com/watch?v=BgU0paNg_Xk
```

## Contributors
<table>
  <tr align="left">
  <td align="center">
  <a href="https://github.com/Xiang511" style="display:inline-block;width:110px"><img src="https://avatars.githubusercontent.com/u/120042360?v=4" width="88px;"alt="Xiang511"/><br/><sub><b>Xiang511</b></sub></a><br/>
  </td> 
    
  <td align="center">
    <a href="https://github.com/a0979551728"  style="display:inline-block;width:110px"><img src="https://avatars.githubusercontent.com/u/149994291?v=4" width="88px;" alt="a0979551728"/><br/><sub><b>a0979551728</b></sub></a><br/>
  </td>
    
  <td align="center">
    <a href="https://github.com/Shahatis" style="display:inline-block;width:110px"><img src="https://avatars.githubusercontent.com/u/165771548?v=4" width="88px;" alt="Shahatis"/><br/><sub><b>Shahatis</b></sub></a><br/>
  </td>
  
   <td align="center">
    <a href="https://github.com/Ericthegoatskr" style="display:inline-block;width:110px"><img src="https://avatars.githubusercontent.com/u/166353015?v=4" width="88px;" alt="Ericthegoatskr"/><br/><sub><b>Ericthegoatskr</b></sub></a><br/>
  </td>


  </tr>
</table>




