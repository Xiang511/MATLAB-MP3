# MATLAB-MP3
![GitHub last commit](https://img.shields.io/github/last-commit/Xiang511/MATLAB-MP3?style=for-the-badge)
![Github Created At](https://img.shields.io/github/created-at/XIang511/MATLAB-MP3?style=for-the-badge&color=green)
![GitHub License](https://img.shields.io/github/license/Xiang511/MATLAB-MP3?style=for-the-badge)

使用MATLAB-GUI設計一個音樂播放器

### Features
- 透過按鍵實現暫停，播放等功能。
- 附有可視化拉條直覺的控制歌曲播放
- 運用課程學到的gui設計和檔案讀取

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

## Demo

![image](https://github.com/Xiang511/MATLAB-MP3/assets/120042360/ce194001-1977-43db-971c-fdd3b5da0055)

[點擊前往](https://www.youtube.com/watch?v=BgU0paNg_Xk)





