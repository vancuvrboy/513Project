; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)

; Number of features: 2
; Number of layers: 0
; Number of samples: 4

(declare-fun w1 () Real) ; Feature 'Input1'
(assert (or (and (>= w1 (- 100)) (<= w1 (- 0.1))) (and (>= w1 0.1) (<= w1 100))))
(declare-fun w2 () Real) ; Feature 'Input2'
(assert (or (and (>= w2 (- 100)) (<= w2 (- 0.1))) (and (>= w2 0.1) (<= w2 100))))
(declare-fun b () Real) ; Bias for output node
(assert (or (and (>= b (- 100)) (<= b (- 0.1))) (and (>= b 0.1) (<= b 100))))
(declare-fun slack_1 () Real)
(assert (>= slack_1 0.0))
(assert (< (- (+ b (* w1 0) (* w2 0)) slack_1) (- 0.001))) ; Constraint for sample 1 (Label: 0)
(declare-fun slack_2 () Real)
(assert (>= slack_2 0.0))
(assert (> (+ b (* w1 0) (* w2 1) slack_2) 0.001)) ; Constraint for sample 2 (Label: 1)
(declare-fun slack_3 () Real)
(assert (>= slack_3 0.0))
(assert (> (+ b (* w1 1) (* w2 0) slack_3) 0.001)) ; Constraint for sample 3 (Label: 1)
(declare-fun slack_4 () Real)
(assert (>= slack_4 0.0))
(assert (< (- (+ b (* w1 1) (* w2 1)) slack_4) (- 0.001))) ; Constraint for sample 4 (Label: 0)
(declare-fun total_slack () Real)
(assert (= total_slack (+ slack_1 slack_2 slack_3 slack_4)))
(minimize total_slack)
(check-sat)
(get-model)