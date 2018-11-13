程式使用:
	make指令:
	要產生fork型server時輸入:
		make fork
	要產生select型server時輸入:
		make select
	產生的執行檔檔名為
		hw1_server_fork	與	hw1_server_select
	執行sudo ./hw1_server_fork後	(或hw1_server_select)
	開啟firefox瀏覽器 網址輸入localhost
	畫面印出index.html內嵌入的rem.jpg
程式內容:
rem.jpg:範例圖片
index.html:只顯示圖片的網頁
fork與select共通函式printpic(int fd):
	接收http通訊並進行處理，載入index.html，將圖片檔傳向client
	程式內有使用到開頭的extensions判斷檔案格式，寫網頁時更有擴充性
hw1_server_fork:
	與課本架構相同
	開socket(port 80)
	bind
	listen
	將SIGCHLD行為導向至sig_chld
	迴圈內容:
		accept client得到fd
		透過fork將fd丟到child process執行printpic
		child結束後執行exit(0)以防止zombie process

hw1_server_select:
	與課本架構相似
	開socket(port 80)
	bind
	listen
	初始化FD_SET以使用select
	迴圈內容:
		利用select抓出有反應的fd
		若為readable，確認set還有空間後加入
		再對每個要求圖片檔的fd執行printpic

參考資料:
hw1_server_fork參考課本範例中的tcpcliserv/tcpserv09.c
hw1_server_select參考課本範例中的tcpcliserv/tcpservselect01.c
HTTP通訊參考了https://fred-zone.blogspot.com/2007/09/http-web-server.html