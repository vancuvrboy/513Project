; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)

; SMT-LIBv2 file generated for cvc5 with multi-layer configuration
; Number of features (input neurons): 2
; Number of layers: 1
; Number of nodes in layer 1: 4
; Number of samples: 4

(declare-fun w1_1_1 () Real)
(assert (or (and (>= w1_1_1 (- 100)) (<= w1_1_1 (- 0.1))) (and (>= w1_1_1 0.1) (<= w1_1_1 100))))
(declare-fun w1_1_2 () Real)
(assert (or (and (>= w1_1_2 (- 100)) (<= w1_1_2 (- 0.1))) (and (>= w1_1_2 0.1) (<= w1_1_2 100))))
(declare-fun b1_1 () Real)
(assert (or (and (>= b1_1 (- 100)) (<= b1_1 (- 0.1))) (and (>= b1_1 0.1) (<= b1_1 100))))
(declare-fun node_out_1_1 () Real)
(declare-fun clipped_relu_out_1_1 () Real)
(declare-fun w1_2_1 () Real)
(assert (or (and (>= w1_2_1 (- 100)) (<= w1_2_1 (- 0.1))) (and (>= w1_2_1 0.1) (<= w1_2_1 100))))
(declare-fun w1_2_2 () Real)
(assert (or (and (>= w1_2_2 (- 100)) (<= w1_2_2 (- 0.1))) (and (>= w1_2_2 0.1) (<= w1_2_2 100))))
(declare-fun b1_2 () Real)
(assert (or (and (>= b1_2 (- 100)) (<= b1_2 (- 0.1))) (and (>= b1_2 0.1) (<= b1_2 100))))
(declare-fun node_out_1_2 () Real)
(declare-fun clipped_relu_out_1_2 () Real)
(declare-fun w1_3_1 () Real)
(assert (or (and (>= w1_3_1 (- 100)) (<= w1_3_1 (- 0.1))) (and (>= w1_3_1 0.1) (<= w1_3_1 100))))
(declare-fun w1_3_2 () Real)
(assert (or (and (>= w1_3_2 (- 100)) (<= w1_3_2 (- 0.1))) (and (>= w1_3_2 0.1) (<= w1_3_2 100))))
(declare-fun b1_3 () Real)
(assert (or (and (>= b1_3 (- 100)) (<= b1_3 (- 0.1))) (and (>= b1_3 0.1) (<= b1_3 100))))
(declare-fun node_out_1_3 () Real)
(declare-fun clipped_relu_out_1_3 () Real)
(declare-fun w1_4_1 () Real)
(assert (or (and (>= w1_4_1 (- 100)) (<= w1_4_1 (- 0.1))) (and (>= w1_4_1 0.1) (<= w1_4_1 100))))
(declare-fun w1_4_2 () Real)
(assert (or (and (>= w1_4_2 (- 100)) (<= w1_4_2 (- 0.1))) (and (>= w1_4_2 0.1) (<= w1_4_2 100))))
(declare-fun b1_4 () Real)
(assert (or (and (>= b1_4 (- 100)) (<= b1_4 (- 0.1))) (and (>= b1_4 0.1) (<= b1_4 100))))
(declare-fun node_out_1_4 () Real)
(declare-fun clipped_relu_out_1_4 () Real)
(declare-fun w2_1_1 () Real)
(assert (or (and (>= w2_1_1 (- 100)) (<= w2_1_1 (- 0.1))) (and (>= w2_1_1 0.1) (<= w2_1_1 100))))
(declare-fun w2_1_2 () Real)
(assert (or (and (>= w2_1_2 (- 100)) (<= w2_1_2 (- 0.1))) (and (>= w2_1_2 0.1) (<= w2_1_2 100))))
(declare-fun w2_1_3 () Real)
(assert (or (and (>= w2_1_3 (- 100)) (<= w2_1_3 (- 0.1))) (and (>= w2_1_3 0.1) (<= w2_1_3 100))))
(declare-fun w2_1_4 () Real)
(assert (or (and (>= w2_1_4 (- 100)) (<= w2_1_4 (- 0.1))) (and (>= w2_1_4 0.1) (<= w2_1_4 100))))
(declare-fun b_out () Real)
(assert (or (and (>= b_out (- 100)) (<= b_out (- 0.1))) (and (>= b_out 0.1) (<= b_out 100))))
; Constraint for sample 1 (Label: 0)
(assert (= node_out_1_1 (+ (* w1_1_1 0) (* w1_1_2 0) b1_1)))
(assert (= clipped_relu_out_1_1 (ite (> node_out_1_1 1) 1 (ite (<= node_out_1_1 -1) -1 node_out_1_1))))
(assert (= node_out_1_2 (+ (* w1_2_1 0) (* w1_2_2 0) b1_2)))
(assert (= clipped_relu_out_1_2 (ite (> node_out_1_2 1) 1 (ite (<= node_out_1_2 -1) -1 node_out_1_2))))
(assert (= node_out_1_3 (+ (* w1_3_1 0) (* w1_3_2 0) b1_3)))
(assert (= clipped_relu_out_1_3 (ite (> node_out_1_3 1) 1 (ite (<= node_out_1_3 -1) -1 node_out_1_3))))
(assert (= node_out_1_4 (+ (* w1_4_1 0) (* w1_4_2 0) b1_4)))
(assert (= clipped_relu_out_1_4 (ite (> node_out_1_4 1) 1 (ite (<= node_out_1_4 -1) -1 node_out_1_4))))
(declare-fun slack_1 () Real)
(assert (>= slack_1 0.0))
(assert (< (- (+ (* w2_1_1 clipped_relu_out_1_1) (* w2_1_2 clipped_relu_out_1_2) (* w2_1_3 clipped_relu_out_1_3) (* w2_1_4 clipped_relu_out_1_4) b_out) slack_1) (- 0.001)))
; Constraint for sample 2 (Label: 1)
(assert (= node_out_1_1 (+ (* w1_1_1 0) (* w1_1_2 1) b1_1)))
(assert (= clipped_relu_out_1_1 (ite (> node_out_1_1 1) 1 (ite (<= node_out_1_1 -1) -1 node_out_1_1))))
(assert (= node_out_1_2 (+ (* w1_2_1 0) (* w1_2_2 1) b1_2)))
(assert (= clipped_relu_out_1_2 (ite (> node_out_1_2 1) 1 (ite (<= node_out_1_2 -1) -1 node_out_1_2))))
(assert (= node_out_1_3 (+ (* w1_3_1 0) (* w1_3_2 1) b1_3)))
(assert (= clipped_relu_out_1_3 (ite (> node_out_1_3 1) 1 (ite (<= node_out_1_3 -1) -1 node_out_1_3))))
(assert (= node_out_1_4 (+ (* w1_4_1 0) (* w1_4_2 1) b1_4)))
(assert (= clipped_relu_out_1_4 (ite (> node_out_1_4 1) 1 (ite (<= node_out_1_4 -1) -1 node_out_1_4))))
(declare-fun slack_2 () Real)
(assert (>= slack_2 0.0))
(assert (> (+ (+ (* w2_1_1 clipped_relu_out_1_1) (* w2_1_2 clipped_relu_out_1_2) (* w2_1_3 clipped_relu_out_1_3) (* w2_1_4 clipped_relu_out_1_4) b_out) slack_2) 0.001))
; Constraint for sample 3 (Label: 1)
(assert (= node_out_1_1 (+ (* w1_1_1 1) (* w1_1_2 0) b1_1)))
(assert (= clipped_relu_out_1_1 (ite (> node_out_1_1 1) 1 (ite (<= node_out_1_1 -1) -1 node_out_1_1))))
(assert (= node_out_1_2 (+ (* w1_2_1 1) (* w1_2_2 0) b1_2)))
(assert (= clipped_relu_out_1_2 (ite (> node_out_1_2 1) 1 (ite (<= node_out_1_2 -1) -1 node_out_1_2))))
(assert (= node_out_1_3 (+ (* w1_3_1 1) (* w1_3_2 0) b1_3)))
(assert (= clipped_relu_out_1_3 (ite (> node_out_1_3 1) 1 (ite (<= node_out_1_3 -1) -1 node_out_1_3))))
(assert (= node_out_1_4 (+ (* w1_4_1 1) (* w1_4_2 0) b1_4)))
(assert (= clipped_relu_out_1_4 (ite (> node_out_1_4 1) 1 (ite (<= node_out_1_4 -1) -1 node_out_1_4))))
(declare-fun slack_3 () Real)
(assert (>= slack_3 0.0))
(assert (> (+ (+ (* w2_1_1 clipped_relu_out_1_1) (* w2_1_2 clipped_relu_out_1_2) (* w2_1_3 clipped_relu_out_1_3) (* w2_1_4 clipped_relu_out_1_4) b_out) slack_3) 0.001))
; Constraint for sample 4 (Label: 0)
(assert (= node_out_1_1 (+ (* w1_1_1 1) (* w1_1_2 1) b1_1)))
(assert (= clipped_relu_out_1_1 (ite (> node_out_1_1 1) 1 (ite (<= node_out_1_1 -1) -1 node_out_1_1))))
(assert (= node_out_1_2 (+ (* w1_2_1 1) (* w1_2_2 1) b1_2)))
(assert (= clipped_relu_out_1_2 (ite (> node_out_1_2 1) 1 (ite (<= node_out_1_2 -1) -1 node_out_1_2))))
(assert (= node_out_1_3 (+ (* w1_3_1 1) (* w1_3_2 1) b1_3)))
(assert (= clipped_relu_out_1_3 (ite (> node_out_1_3 1) 1 (ite (<= node_out_1_3 -1) -1 node_out_1_3))))
(assert (= node_out_1_4 (+ (* w1_4_1 1) (* w1_4_2 1) b1_4)))
(assert (= clipped_relu_out_1_4 (ite (> node_out_1_4 1) 1 (ite (<= node_out_1_4 -1) -1 node_out_1_4))))
(declare-fun slack_4 () Real)
(assert (>= slack_4 0.0))
(assert (< (- (+ (* w2_1_1 clipped_relu_out_1_1) (* w2_1_2 clipped_relu_out_1_2) (* w2_1_3 clipped_relu_out_1_3) (* w2_1_4 clipped_relu_out_1_4) b_out) slack_4) (- 0.001)))
(declare-fun total_slack () Real)
(assert (= total_slack (+ slack_1 slack_2 slack_3 slack_4)))
(minimize total_slack)
(check-sat)
(get-model)