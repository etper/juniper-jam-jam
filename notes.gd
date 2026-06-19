## Theme: Spin To Win
#
## MVP
#
#**Wheel Rush MVP (minimum dev time possible)**
#
#Core gameplay:
#
#1. Player presses **SPIN**.
	#
#2. Wheel spins for 2–3 seconds.
	#
#3. Reward is granted.
	#
#4. Player spends coins on upgrades.
	#
#5. Repeat.
	#
#
#Rewards:
#
#- 50 Coins (40%)
	#
#- 100 Coins (30%)
	#
#- 250 Coins (15%)
	#
#- 500 Coins (10%)
	#
#- 1000 Coins (4%)
	#
#- JACKPOT 5000 Coins (1%)
	#
#
#Upgrades:
#
#- Coin Value +10% per level
	#
#- Jackpot Chance +0.1% per level
	#
#- Auto Spin (spins every few seconds)
	#
#
#That's enough for an MVP.
#
#Simple progression:
#
#- Start: 0 coins
	#
#- First upgrade: 100 coins
	#
#- Upgrades become 1.5× more expensive each purchase
	#
#
#Session goals:
#
#- Buy first upgrade
	#
#- Reach 10k coins
	#
#- Hit first jackpot
	#
#- Unlock auto-spin
	#
#
#UI:
#
#```
#+----------------+
#|     WHEEL      |
#|      🎡        |
#+----------------+
#
#Reward: 250 Coins
#
#Coins: 1,250
#
#[ SPIN ]
#
#Upgrades
#Coin Value Lv3   [Buy]
#Jackpot Lv1      [Buy]
#Auto Spin        [Buy]
#```
#
#No inventory.  
#No characters.  
#No animations beyond wheel rotation.  
#No save system initially.
#
#If you want one extra mechanic that adds a lot of retention for almost no work:
#
#**Win Streak**
#
#- Every spin increases multiplier by +1%.
	#
#- Jackpot or bad reward resets streak.
	#
#- Display:
	#
	#- Streak: x1.34
		#
#
#Adds excitement with only a few lines of code.
