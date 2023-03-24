
## Gamestop stock vs Tesla
Determining the price of a stock is complex; it depends on the number of outstanding shares, the size of the company's future profits, and much more.  An essential factor is the company's profit and growth of profits; if the company's profit is increasing, the stock price should increase.  If you suspect the company's profit increases, you should buy the stock as the stock should increase, But what happens if you think the stock price will decrease. 

Short selling is how you make money if the stock decreases. An investor borrows a stock, sells the stock, and then repurchases it to return it to the lender.  Typically stocks fall faster than they rise, so you can make a profit more quickly. Usually, experienced investors such as hedge funds partake in short selling. One problem is if the stock price increases, the investor can lose money.

Sometimes short sellers get it wrong; for example, Tesla.  A few years ago, many short sellers targeted Tesla. Then Tesla started becoming profitable, and profits were increasing; thus, the company stock went up. This was based on the companies performance, so the stock should continue to rise, and the short seller should sell the stock.  Recently shorted stocks can increase for reasons that are not based on fundamentals; this is less sustainable. 

Individual investors using the forum on the Reddit online community named WallStreetBets, started buying into shares of GameStop, a video and computer-game retailer losing money. The influx of demand caused GameStop shares to soar.  All this produced billions of dollars in losses for hedge funds who had sold the stock short. [ 1] GameStop's share price should fall eventually, so the Hedge funds should hold on to the short positions. As a data scientist working for a hedge fund, you will extract the profit data for Tesla and GameStop and build a dashboard to compare the price of the stock vs the profit for the hedge fund.

## Define a Function that Makes a Graph:
- Question 1: Use yfinance to Extract Stock Data.
- Question 2: Use Webscraping to Extract Tesla Revenue Data.
- Question 3: Use yfinance to Extract Stock Data.
- Question 4: Use Webscraping to Extract GME Revenue Data.
- Question 5: Plot Tesla Stock Graph.
- Question 6: Plot GameStop Stock Graph.

## 🔧 Requeriments
- !pip install yfinance
- !pip install pandas
- !pip install requests
- !pip install bs4
- !pip install plotly

## Libraries:
- import yfinance as yf
- import pandas as pd
- import requests
- from bs4 import BeautifulSoup
- import plotly.graph_objects as go
- from plotly.subplots import make_subplots

> Development in jupyter notebooks.

## Tesla Plot:
![Tesla_plot](https://user-images.githubusercontent.com/65089744/227575736-7b933014-ff38-4497-8c58-4e35f382da87.png)

## GameStop Plot:
![Game_stop_Plot](https://user-images.githubusercontent.com/65089744/227575829-5344b5ef-a663-4f59-a490-4d1c77680cb3.png)


