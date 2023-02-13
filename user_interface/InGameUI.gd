extends Control

func update_weight(current_weight):
	$WeightLabel.text = tr("WEIGHT_INFO") + "%s" % current_weight
