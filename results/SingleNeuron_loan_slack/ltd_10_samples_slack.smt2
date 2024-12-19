; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)

; SMT-LIBv2 file generated for cvc5 with multi-layer configuration
; Number of features (input neurons): 11
; Number of layers: 0
; Number of samples: 10

(declare-fun w1 () Real) ; Feature 'no_of_dependents'
(assert (or (and (>= w1 (- 100)) (<= w1 (- 0.1))) (and (>= w1 0.1) (<= w1 100))))
(declare-fun w2 () Real) ; Feature 'education'
(assert (or (and (>= w2 (- 100)) (<= w2 (- 0.1))) (and (>= w2 0.1) (<= w2 100))))
(declare-fun w3 () Real) ; Feature 'self_employed'
(assert (or (and (>= w3 (- 100)) (<= w3 (- 0.1))) (and (>= w3 0.1) (<= w3 100))))
(declare-fun w4 () Real) ; Feature 'income_annum'
(assert (or (and (>= w4 (- 100)) (<= w4 (- 0.1))) (and (>= w4 0.1) (<= w4 100))))
(declare-fun w5 () Real) ; Feature 'loan_amount'
(assert (or (and (>= w5 (- 100)) (<= w5 (- 0.1))) (and (>= w5 0.1) (<= w5 100))))
(declare-fun w6 () Real) ; Feature 'loan_term'
(assert (or (and (>= w6 (- 100)) (<= w6 (- 0.1))) (and (>= w6 0.1) (<= w6 100))))
(declare-fun w7 () Real) ; Feature 'cibil_score'
(assert (or (and (>= w7 (- 100)) (<= w7 (- 0.1))) (and (>= w7 0.1) (<= w7 100))))
(declare-fun w8 () Real) ; Feature 'residential_assets_value'
(assert (or (and (>= w8 (- 100)) (<= w8 (- 0.1))) (and (>= w8 0.1) (<= w8 100))))
(declare-fun w9 () Real) ; Feature 'commercial_assets_value'
(assert (or (and (>= w9 (- 100)) (<= w9 (- 0.1))) (and (>= w9 0.1) (<= w9 100))))
(declare-fun w10 () Real) ; Feature 'luxury_assets_value'
(assert (or (and (>= w10 (- 100)) (<= w10 (- 0.1))) (and (>= w10 0.1) (<= w10 100))))
(declare-fun w11 () Real) ; Feature 'bank_asset_value'
(assert (or (and (>= w11 (- 100)) (<= w11 (- 0.1))) (and (>= w11 0.1) (<= w11 100))))
(declare-fun b () Real) ; Bias for output node
(assert (or (and (>= b (- 100)) (<= b (- 0.1))) (and (>= b 0.1) (<= b 100))))
(declare-fun slack_1 () Real)
(assert (>= slack_1 0.0))
(assert (< (- (+ b (* w1 1.0) (* w2 1.0) (* w3 0.0) (* w4 0.793814432989691) (* w5 0.755102040816326) (* w6 0.222222222222222) (* w7 0.446666666666667) (* w8 0.202054794520548) (* w9 0.716494845360825) (* w10 0.401028277634961) (* w11 0.591836734693878)) slack_1) (- 0.001))) ; Constraint for sample 1 (Label: 0)
(declare-fun slack_2 () Real)
(assert (>= slack_2 0.0))
(assert (< (- (+ b (* w1 0.0) (* w2 1.0) (* w3 1.0) (* w4 0.969072164948453) (* w5 0.85969387755102) (* w6 0.555555555555556) (* w7 0.683333333333333) (* w8 0.818493150684932) (* w9 0.530927835051546) (* w10 0.97172236503856) (* w11 0.530612244897959)) slack_2) (- 0.001))) ; Constraint for sample 2 (Label: 0)
(declare-fun slack_3 () Real)
(assert (>= slack_3 0.0))
(assert (< (- (+ b (* w1 0.2) (* w2 0.0) (* w3 0.0) (* w4 0.0618556701030928) (* w5 0.0663265306122449) (* w6 0.333333333333333) (* w7 0.636666666666667) (* w8 0.0787671232876712) (* w9 0.0567010309278351) (* w10 0.0668380462724936) (* w11 0.0476190476190476)) slack_3) (- 0.001))) ; Constraint for sample 3 (Label: 0)
(declare-fun slack_4 () Real)
(assert (>= slack_4 0.0))
(assert (< (- (+ b (* w1 0.4) (* w2 0.0) (* w3 1.0) (* w4 0.484536082474227) (* w5 0.326530612244898) (* w6 0.888888888888889) (* w7 0.756666666666667) (* w8 0.284246575342466) (* w9 0.170103092783505) (* w10 0.416452442159383) (* w11 0.489795918367347)) slack_4) (- 0.001))) ; Constraint for sample 4 (Label: 0)
(declare-fun slack_5 () Real)
(assert (>= slack_5 0.0))
(assert (> (+ b (* w1 1.0) (* w2 0.0) (* w3 1.0) (* w4 0.288659793814433) (* w5 0.275510204081633) (* w6 0.555555555555556) (* w7 0.235) (* w8 0.294520547945205) (* w9 0.128865979381443) (* w10 0.179948586118252) (* w11 0.136054421768707) slack_5) 0.001)) ; Constraint for sample 5 (Label: 1)
(declare-fun slack_6 () Real)
(assert (>= slack_6 0.0))
(assert (< (- (+ b (* w1 0.8) (* w2 1.0) (* w3 0.0) (* w4 0.0103092783505155) (* w5 0.0178571428571429) (* w6 0.444444444444444) (* w7 0.865) (* w8 0.0273972602739726) (* w9 0.0154639175257732) (* w10 0.0154241645244216) (* w11 0.0136054421768708)) slack_6) (- 0.001))) ; Constraint for sample 6 (Label: 0)
(declare-fun slack_7 () Real)
(assert (>= slack_7 0.0))
(assert (< (- (+ b (* w1 0.2) (* w2 1.0) (* w3 1.0) (* w4 0.0103092783505155) (* w5 0.0076530612244898) (* w6 0.333333333333333) (* w7 0.86) (* w8 0.023972602739726) (* w9 0.0154639175257732) (* w10 0.0205655526992288) (* w11 0.0136054421768708)) slack_7) (- 0.001))) ; Constraint for sample 7 (Label: 0)
(declare-fun slack_8 () Real)
(assert (>= slack_8 0.0))
(assert (< (- (+ b (* w1 1.0) (* w2 0.0) (* w3 0.0) (* w4 0.876288659793814) (* w5 0.834183673469388) (* w6 0.111111111111111) (* w7 0.63) (* w8 0.773972602739726) (* w9 0.762886597938144) (* w10 0.74293059125964) (* w11 0.292517006802721)) slack_8) (- 0.001))) ; Constraint for sample 8 (Label: 0)
(declare-fun slack_9 () Real)
(assert (>= slack_9 0.0))
(assert (> (+ b (* w1 0.2) (* w2 1.0) (* w3 0.0) (* w4 0.938144329896907) (* w5 0.729591836734694) (* w6 0.222222222222222) (* w7 0.376666666666667) (* w8 0.383561643835616) (* w9 0.0824742268041237) (* w10 0.498714652956298) (* w11 0.748299319727891) slack_9) 0.001)) ; Constraint for sample 9 (Label: 1)
(declare-fun slack_10 () Real)
(assert (>= slack_10 0.0))
(assert (< (- (+ b (* w1 0.6) (* w2 0.0) (* w3 1.0) (* w4 0.958762886597938) (* w5 0.517857142857143) (* w6 0.0) (* w7 0.718333333333333) (* w8 0.462328767123288) (* w9 0.195876288659794) (* w10 0.524421593830334) (* w11 0.625850340136054)) slack_10) (- 0.001))) ; Constraint for sample 10 (Label: 0)
(declare-fun total_slack () Real)
(assert (= total_slack (+ slack_1 slack_2 slack_3 slack_4 slack_5 slack_6 slack_7 slack_8 slack_9 slack_10)))
(minimize total_slack)
(check-sat)
(get-model)