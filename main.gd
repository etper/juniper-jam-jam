extends Node2D

var coins := 0

var coin_value_level := 0
var jackpot_level := 0
var auto_spin := false

var coin_value_mult := 1.0

var spinning := false

var coin_upgrade_cost := 100
var jackpot_upgrade_cost := 100
var auto_spin_cost := 500

func roll_reward() -> int:
	var jackpot_bonus = jackpot_level * 0.1

	var roll = randf() * 100.0

	if roll < 1.0 + jackpot_bonus:
		return 5000
	elif roll < 5:
		return 1000
	elif roll < 15:
		return 500
	elif roll < 30:
		return 250
	elif roll < 60:
		return 100
	else:
		return 50

func _on_spin_pressed():
	if spinning:
		return

	spinning = true

	var reward = roll_reward()

	var target_angle := 0

	match reward:
		50:
			target_angle = 0
		100:
			target_angle = 60
		250:
			target_angle = 120
		500:
			target_angle = 180
		1000:
			target_angle = 240
		5000:
			target_angle = 300

	var tween = create_tween()

	tween.set_trans(Tween.TRANS_QUART)
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(
		$Wheel,
		"rotation",
		$Wheel.rotation + TAU * 6 + deg_to_rad(target_angle),
		2.5
	)

	await tween.finished

	reward *= coin_value_mult

	coins += reward

	$RewardLabel.text = "Reward: %d Coins" % reward

	update_ui()

	spinning = false

func update_ui():
	$CoinsLabel.text = "Coins: %d" % coins

func _on_coin_value_pressed():
	if coins < coin_upgrade_cost:
		return

	coins -= coin_upgrade_cost

	coin_value_level += 1
	coin_value_mult = 1.0 + coin_value_level * 0.1

	coin_upgrade_cost = int(coin_upgrade_cost * 1.5)

	update_ui()

func _on_jackpot_pressed():
	if coins < jackpot_upgrade_cost:
		return

	coins -= jackpot_upgrade_cost

	jackpot_level += 1

	jackpot_upgrade_cost = int(jackpot_upgrade_cost * 1.5)

	update_ui()

func _on_auto_spin_pressed():
	if auto_spin:
		return

	if coins < auto_spin_cost:
		return

	coins -= auto_spin_cost

	auto_spin = true
	$Timer.start()

	update_ui()
