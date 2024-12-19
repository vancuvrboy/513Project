; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)

; SMT-LIBv2 file generated for cvc5 with multi-layer configuration
; Number of features (input neurons): 11
; Number of layers: 0
; Number of samples: 10

(declare-fun w1 () Real) ; Weight for feature 'no_of_dependents'
(assert (and (>= w1 -100.0) (<= w1 100.0)))
(declare-fun w2 () Real) ; Weight for feature 'education'
(assert (and (>= w2 -100.0) (<= w2 100.0)))
(declare-fun w3 () Real) ; Weight for feature 'self_employed'
(assert (and (>= w3 -100.0) (<= w3 100.0)))
(declare-fun w4 () Real) ; Weight for feature 'income_annum'
(assert (and (>= w4 -100.0) (<= w4 100.0)))
(declare-fun w5 () Real) ; Weight for feature 'loan_amount'
(assert (and (>= w5 -100.0) (<= w5 100.0)))
(declare-fun w6 () Real) ; Weight for feature 'loan_term'
(assert (and (>= w6 -100.0) (<= w6 100.0)))
(declare-fun w7 () Real) ; Weight for feature 'cibil_score'
(assert (and (>= w7 -100.0) (<= w7 100.0)))
(declare-fun w8 () Real) ; Weight for feature 'residential_assets_value'
(assert (and (>= w8 -100.0) (<= w8 100.0)))
(declare-fun w9 () Real) ; Weight for feature 'commercial_assets_value'
(assert (and (>= w9 -100.0) (<= w9 100.0)))
(declare-fun w10 () Real) ; Weight for feature 'luxury_assets_value'
(assert (and (>= w10 -100.0) (<= w10 100.0)))
(declare-fun w11 () Real) ; Weight for feature 'bank_asset_value'
(assert (and (>= w11 -100.0) (<= w11 100.0)))
(declare-fun b () Real) ; Bias for output node
(assert (< (+ (* w1 1.0) (* w2 1.0) (* w3 0.0) (* w4 0.793814432989691) (* w5 0.755102040816326) (* w6 0.222222222222222) (* w7 0.446666666666667) (* w8 0.202054794520548) (* w9 0.716494845360825) (* w10 0.401028277634961) (* w11 0.591836734693878) b) 0.0)) ; Constraint for sample 1 (Label: 0)
(assert (< (+ (* w1 0.0) (* w2 1.0) (* w3 1.0) (* w4 0.969072164948453) (* w5 0.85969387755102) (* w6 0.555555555555556) (* w7 0.683333333333333) (* w8 0.818493150684932) (* w9 0.530927835051546) (* w10 0.97172236503856) (* w11 0.530612244897959) b) 0.0)) ; Constraint for sample 2 (Label: 0)
(assert (< (+ (* w1 0.2) (* w2 0.0) (* w3 0.0) (* w4 0.0618556701030928) (* w5 0.0663265306122449) (* w6 0.333333333333333) (* w7 0.636666666666667) (* w8 0.0787671232876712) (* w9 0.0567010309278351) (* w10 0.0668380462724936) (* w11 0.0476190476190476) b) 0.0)) ; Constraint for sample 3 (Label: 0)
(assert (< (+ (* w1 0.4) (* w2 0.0) (* w3 1.0) (* w4 0.484536082474227) (* w5 0.326530612244898) (* w6 0.888888888888889) (* w7 0.756666666666667) (* w8 0.284246575342466) (* w9 0.170103092783505) (* w10 0.416452442159383) (* w11 0.489795918367347) b) 0.0)) ; Constraint for sample 4 (Label: 0)
(assert (> (+ (* w1 1.0) (* w2 0.0) (* w3 1.0) (* w4 0.288659793814433) (* w5 0.275510204081633) (* w6 0.555555555555556) (* w7 0.235) (* w8 0.294520547945205) (* w9 0.128865979381443) (* w10 0.179948586118252) (* w11 0.136054421768707) b) 0.0)) ; Constraint for sample 5 (Label: 1)
(assert (< (+ (* w1 0.8) (* w2 1.0) (* w3 0.0) (* w4 0.0103092783505155) (* w5 0.0178571428571429) (* w6 0.444444444444444) (* w7 0.865) (* w8 0.0273972602739726) (* w9 0.0154639175257732) (* w10 0.0154241645244216) (* w11 0.0136054421768708) b) 0.0)) ; Constraint for sample 6 (Label: 0)
(assert (< (+ (* w1 0.2) (* w2 1.0) (* w3 1.0) (* w4 0.0103092783505155) (* w5 0.0076530612244898) (* w6 0.333333333333333) (* w7 0.86) (* w8 0.023972602739726) (* w9 0.0154639175257732) (* w10 0.0205655526992288) (* w11 0.0136054421768708) b) 0.0)) ; Constraint for sample 7 (Label: 0)
(assert (< (+ (* w1 1.0) (* w2 0.0) (* w3 0.0) (* w4 0.876288659793814) (* w5 0.834183673469388) (* w6 0.111111111111111) (* w7 0.63) (* w8 0.773972602739726) (* w9 0.762886597938144) (* w10 0.74293059125964) (* w11 0.292517006802721) b) 0.0)) ; Constraint for sample 8 (Label: 0)
(assert (> (+ (* w1 0.2) (* w2 1.0) (* w3 0.0) (* w4 0.938144329896907) (* w5 0.729591836734694) (* w6 0.222222222222222) (* w7 0.376666666666667) (* w8 0.383561643835616) (* w9 0.0824742268041237) (* w10 0.498714652956298) (* w11 0.748299319727891) b) 0.0)) ; Constraint for sample 9 (Label: 1)
(assert (< (+ (* w1 0.6) (* w2 0.0) (* w3 1.0) (* w4 0.958762886597938) (* w5 0.517857142857143) (* w6 0.0) (* w7 0.718333333333333) (* w8 0.462328767123288) (* w9 0.195876288659794) (* w10 0.524421593830334) (* w11 0.625850340136054) b) 0.0)) ; Constraint for sample 10 (Label: 0)
(check-sat)
(get-model)