; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)

; SMT-LIBv2 file generated for cvc5 with multi-layer configuration
; Stepped threshold activation is enabled in hidden layers
; Number of features (input neurons): 2
; Number of layers: 1
; Number of nodes in layer 1: 4
; Number of samples: 4

(declare-fun w1_1_1 () Real) ; Weight for layer 1, node 1, input 1
(assert (or (and (> w1_1_1 0.1) (< w1_1_1 100)) (and (> w1_1_1 -100) (< w1_1_1 -0.1))))
(declare-fun w1_1_2 () Real) ; Weight for layer 1, node 1, input 2
(assert (or (and (> w1_1_2 0.1) (< w1_1_2 100)) (and (> w1_1_2 -100) (< w1_1_2 -0.1))))
(declare-fun b1_1 () Real) ; Bias for layer 1, node 1
(declare-fun z1_1_s1 () Bool) ; Binary activation for layer 1, node 1, sample 1
(declare-fun z1_1_s2 () Bool) ; Binary activation for layer 1, node 1, sample 2
(declare-fun z1_1_s3 () Bool) ; Binary activation for layer 1, node 1, sample 3
(declare-fun z1_1_s4 () Bool) ; Binary activation for layer 1, node 1, sample 4
(declare-fun w1_2_1 () Real) ; Weight for layer 1, node 2, input 1
(assert (or (and (> w1_2_1 0.1) (< w1_2_1 100)) (and (> w1_2_1 -100) (< w1_2_1 -0.1))))
(declare-fun w1_2_2 () Real) ; Weight for layer 1, node 2, input 2
(assert (or (and (> w1_2_2 0.1) (< w1_2_2 100)) (and (> w1_2_2 -100) (< w1_2_2 -0.1))))
(declare-fun b1_2 () Real) ; Bias for layer 1, node 2
(declare-fun z1_2_s1 () Bool) ; Binary activation for layer 1, node 2, sample 1
(declare-fun z1_2_s2 () Bool) ; Binary activation for layer 1, node 2, sample 2
(declare-fun z1_2_s3 () Bool) ; Binary activation for layer 1, node 2, sample 3
(declare-fun z1_2_s4 () Bool) ; Binary activation for layer 1, node 2, sample 4
(declare-fun w1_3_1 () Real) ; Weight for layer 1, node 3, input 1
(assert (or (and (> w1_3_1 0.1) (< w1_3_1 100)) (and (> w1_3_1 -100) (< w1_3_1 -0.1))))
(declare-fun w1_3_2 () Real) ; Weight for layer 1, node 3, input 2
(assert (or (and (> w1_3_2 0.1) (< w1_3_2 100)) (and (> w1_3_2 -100) (< w1_3_2 -0.1))))
(declare-fun b1_3 () Real) ; Bias for layer 1, node 3
(declare-fun z1_3_s1 () Bool) ; Binary activation for layer 1, node 3, sample 1
(declare-fun z1_3_s2 () Bool) ; Binary activation for layer 1, node 3, sample 2
(declare-fun z1_3_s3 () Bool) ; Binary activation for layer 1, node 3, sample 3
(declare-fun z1_3_s4 () Bool) ; Binary activation for layer 1, node 3, sample 4
(declare-fun w1_4_1 () Real) ; Weight for layer 1, node 4, input 1
(assert (or (and (> w1_4_1 0.1) (< w1_4_1 100)) (and (> w1_4_1 -100) (< w1_4_1 -0.1))))
(declare-fun w1_4_2 () Real) ; Weight for layer 1, node 4, input 2
(assert (or (and (> w1_4_2 0.1) (< w1_4_2 100)) (and (> w1_4_2 -100) (< w1_4_2 -0.1))))
(declare-fun b1_4 () Real) ; Bias for layer 1, node 4
(declare-fun z1_4_s1 () Bool) ; Binary activation for layer 1, node 4, sample 1
(declare-fun z1_4_s2 () Bool) ; Binary activation for layer 1, node 4, sample 2
(declare-fun z1_4_s3 () Bool) ; Binary activation for layer 1, node 4, sample 3
(declare-fun z1_4_s4 () Bool) ; Binary activation for layer 1, node 4, sample 4

(declare-fun node_out_1_1_s1 () Real) ; Intermediate output for layer 1, node 1, sample 1
(declare-fun node_out_1_1_s2 () Real) ; Intermediate output for layer 1, node 1, sample 2
(declare-fun node_out_1_1_s3 () Real) ; Intermediate output for layer 1, node 1, sample 3
(declare-fun node_out_1_1_s4 () Real) ; Intermediate output for layer 1, node 1, sample 4
(declare-fun node_out_1_2_s1 () Real) ; Intermediate output for layer 1, node 2, sample 1
(declare-fun node_out_1_2_s2 () Real) ; Intermediate output for layer 1, node 2, sample 2
(declare-fun node_out_1_2_s3 () Real) ; Intermediate output for layer 1, node 2, sample 3
(declare-fun node_out_1_2_s4 () Real) ; Intermediate output for layer 1, node 2, sample 4
(declare-fun node_out_1_3_s1 () Real) ; Intermediate output for layer 1, node 3, sample 1
(declare-fun node_out_1_3_s2 () Real) ; Intermediate output for layer 1, node 3, sample 2
(declare-fun node_out_1_3_s3 () Real) ; Intermediate output for layer 1, node 3, sample 3
(declare-fun node_out_1_3_s4 () Real) ; Intermediate output for layer 1, node 3, sample 4
(declare-fun node_out_1_4_s1 () Real) ; Intermediate output for layer 1, node 4, sample 1
(declare-fun node_out_1_4_s2 () Real) ; Intermediate output for layer 1, node 4, sample 2
(declare-fun node_out_1_4_s3 () Real) ; Intermediate output for layer 1, node 4, sample 3
(declare-fun node_out_1_4_s4 () Real) ; Intermediate output for layer 1, node 4, sample 4

(declare-fun w2_1_1 () Real) ; Weight for output node, input from hidden node 1
(assert (or (and (> w2_1_1 0.1) (< w2_1_1 100)) (and (> w2_1_1 -100) (< w2_1_1 -0.1))))
(declare-fun w2_1_2 () Real) ; Weight for output node, input from hidden node 2
(assert (or (and (> w2_1_2 0.1) (< w2_1_2 100)) (and (> w2_1_2 -100) (< w2_1_2 -0.1))))
(declare-fun w2_1_3 () Real) ; Weight for output node, input from hidden node 3
(assert (or (and (> w2_1_3 0.1) (< w2_1_3 100)) (and (> w2_1_3 -100) (< w2_1_3 -0.1))))
(declare-fun w2_1_4 () Real) ; Weight for output node, input from hidden node 4
(assert (or (and (> w2_1_4 0.1) (< w2_1_4 100)) (and (> w2_1_4 -100) (< w2_1_4 -0.1))))
(declare-fun b_out () Real) ; Bias for output node

; Constraint for sample 1 (Label: 0)
(assert (= node_out_1_1_s1 (+ (* w1_1_1 0) (* w1_1_2 0) b1_1)))
(assert (or (and (>= node_out_1_1_s1 0) (= z1_1_s1 true)) (and (< node_out_1_1_s1 0) (= z1_1_s1 false))))
(assert (= node_out_1_2_s1 (+ (* w1_2_1 0) (* w1_2_2 0) b1_2)))
(assert (or (and (>= node_out_1_2_s1 0) (= z1_2_s1 true)) (and (< node_out_1_2_s1 0) (= z1_2_s1 false))))
(assert (= node_out_1_3_s1 (+ (* w1_3_1 0) (* w1_3_2 0) b1_3)))
(assert (or (and (>= node_out_1_3_s1 0) (= z1_3_s1 true)) (and (< node_out_1_3_s1 0) (= z1_3_s1 false))))
(assert (= node_out_1_4_s1 (+ (* w1_4_1 0) (* w1_4_2 0) b1_4)))
(assert (or (and (>= node_out_1_4_s1 0) (= z1_4_s1 true)) (and (< node_out_1_4_s1 0) (= z1_4_s1 false))))
(assert (< (+ (* w2_1_1 (ite z1_1_s1 1.0 0.0)) (* w2_1_2 (ite z1_2_s1 1.0 0.0)) (* w2_1_3 (ite z1_3_s1 1.0 0.0)) (* w2_1_4 (ite z1_4_s1 1.0 0.0)) b_out) 0)) ; Label 0 requires output < 0

; Constraint for sample 2 (Label: 1)
(assert (= node_out_1_1_s2 (+ (* w1_1_1 0) (* w1_1_2 1) b1_1)))
(assert (or (and (>= node_out_1_1_s2 0) (= z1_1_s2 true)) (and (< node_out_1_1_s2 0) (= z1_1_s2 false))))
(assert (= node_out_1_2_s2 (+ (* w1_2_1 0) (* w1_2_2 1) b1_2)))
(assert (or (and (>= node_out_1_2_s2 0) (= z1_2_s2 true)) (and (< node_out_1_2_s2 0) (= z1_2_s2 false))))
(assert (= node_out_1_3_s2 (+ (* w1_3_1 0) (* w1_3_2 1) b1_3)))
(assert (or (and (>= node_out_1_3_s2 0) (= z1_3_s2 true)) (and (< node_out_1_3_s2 0) (= z1_3_s2 false))))
(assert (= node_out_1_4_s2 (+ (* w1_4_1 0) (* w1_4_2 1) b1_4)))
(assert (or (and (>= node_out_1_4_s2 0) (= z1_4_s2 true)) (and (< node_out_1_4_s2 0) (= z1_4_s2 false))))
(assert (> (+ (* w2_1_1 (ite z1_1_s2 1.0 0.0)) (* w2_1_2 (ite z1_2_s2 1.0 0.0)) (* w2_1_3 (ite z1_3_s2 1.0 0.0)) (* w2_1_4 (ite z1_4_s2 1.0 0.0)) b_out) 0)) ; Label 1 requires output > 0

; Constraint for sample 3 (Label: 1)
(assert (= node_out_1_1_s3 (+ (* w1_1_1 1) (* w1_1_2 0) b1_1)))
(assert (or (and (>= node_out_1_1_s3 0) (= z1_1_s3 true)) (and (< node_out_1_1_s3 0) (= z1_1_s3 false))))
(assert (= node_out_1_2_s3 (+ (* w1_2_1 1) (* w1_2_2 0) b1_2)))
(assert (or (and (>= node_out_1_2_s3 0) (= z1_2_s3 true)) (and (< node_out_1_2_s3 0) (= z1_2_s3 false))))
(assert (= node_out_1_3_s3 (+ (* w1_3_1 1) (* w1_3_2 0) b1_3)))
(assert (or (and (>= node_out_1_3_s3 0) (= z1_3_s3 true)) (and (< node_out_1_3_s3 0) (= z1_3_s3 false))))
(assert (= node_out_1_4_s3 (+ (* w1_4_1 1) (* w1_4_2 0) b1_4)))
(assert (or (and (>= node_out_1_4_s3 0) (= z1_4_s3 true)) (and (< node_out_1_4_s3 0) (= z1_4_s3 false))))
(assert (> (+ (* w2_1_1 (ite z1_1_s3 1.0 0.0)) (* w2_1_2 (ite z1_2_s3 1.0 0.0)) (* w2_1_3 (ite z1_3_s3 1.0 0.0)) (* w2_1_4 (ite z1_4_s3 1.0 0.0)) b_out) 0)) ; Label 1 requires output > 0

; Constraint for sample 4 (Label: 0)
(assert (= node_out_1_1_s4 (+ (* w1_1_1 1) (* w1_1_2 1) b1_1)))
(assert (or (and (>= node_out_1_1_s4 0) (= z1_1_s4 true)) (and (< node_out_1_1_s4 0) (= z1_1_s4 false))))
(assert (= node_out_1_2_s4 (+ (* w1_2_1 1) (* w1_2_2 1) b1_2)))
(assert (or (and (>= node_out_1_2_s4 0) (= z1_2_s4 true)) (and (< node_out_1_2_s4 0) (= z1_2_s4 false))))
(assert (= node_out_1_3_s4 (+ (* w1_3_1 1) (* w1_3_2 1) b1_3)))
(assert (or (and (>= node_out_1_3_s4 0) (= z1_3_s4 true)) (and (< node_out_1_3_s4 0) (= z1_3_s4 false))))
(assert (= node_out_1_4_s4 (+ (* w1_4_1 1) (* w1_4_2 1) b1_4)))
(assert (or (and (>= node_out_1_4_s4 0) (= z1_4_s4 true)) (and (< node_out_1_4_s4 0) (= z1_4_s4 false))))
(assert (< (+ (* w2_1_1 (ite z1_1_s4 1.0 0.0)) (* w2_1_2 (ite z1_2_s4 1.0 0.0)) (* w2_1_3 (ite z1_3_s4 1.0 0.0)) (* w2_1_4 (ite z1_4_s4 1.0 0.0)) b_out) 0)) ; Label 0 requires output < 0

(check-sat)
(get-model)