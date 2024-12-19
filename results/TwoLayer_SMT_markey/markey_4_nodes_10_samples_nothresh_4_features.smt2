; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)

; SMT-LIBv2 file generated for cvc5 with multi-layer configuration
; Stepped threshold activation is disabled in hidden layers
; Number of features (input neurons): 4
; Number of layers: 1
; Number of nodes in layer 1: 4
; Number of samples: 10

(declare-fun w1_1_1 () Real) ; Weight for layer 1, node 1, input 1
(declare-fun w1_1_2 () Real) ; Weight for layer 1, node 1, input 2
(declare-fun w1_1_3 () Real) ; Weight for layer 1, node 1, input 3
(declare-fun w1_1_4 () Real) ; Weight for layer 1, node 1, input 4
(declare-fun b1_1 () Real) ; Bias for layer 1, node 1
(declare-fun w1_2_1 () Real) ; Weight for layer 1, node 2, input 1
(declare-fun w1_2_2 () Real) ; Weight for layer 1, node 2, input 2
(declare-fun w1_2_3 () Real) ; Weight for layer 1, node 2, input 3
(declare-fun w1_2_4 () Real) ; Weight for layer 1, node 2, input 4
(declare-fun b1_2 () Real) ; Bias for layer 1, node 2
(declare-fun w1_3_1 () Real) ; Weight for layer 1, node 3, input 1
(declare-fun w1_3_2 () Real) ; Weight for layer 1, node 3, input 2
(declare-fun w1_3_3 () Real) ; Weight for layer 1, node 3, input 3
(declare-fun w1_3_4 () Real) ; Weight for layer 1, node 3, input 4
(declare-fun b1_3 () Real) ; Bias for layer 1, node 3
(declare-fun w1_4_1 () Real) ; Weight for layer 1, node 4, input 1
(declare-fun w1_4_2 () Real) ; Weight for layer 1, node 4, input 2
(declare-fun w1_4_3 () Real) ; Weight for layer 1, node 4, input 3
(declare-fun w1_4_4 () Real) ; Weight for layer 1, node 4, input 4
(declare-fun b1_4 () Real) ; Bias for layer 1, node 4

(declare-fun node_out_1_1_s1 () Real) ; Intermediate output for layer 1, node 1, sample 1
(declare-fun node_out_1_1_s2 () Real) ; Intermediate output for layer 1, node 1, sample 2
(declare-fun node_out_1_1_s3 () Real) ; Intermediate output for layer 1, node 1, sample 3
(declare-fun node_out_1_1_s4 () Real) ; Intermediate output for layer 1, node 1, sample 4
(declare-fun node_out_1_1_s5 () Real) ; Intermediate output for layer 1, node 1, sample 5
(declare-fun node_out_1_1_s6 () Real) ; Intermediate output for layer 1, node 1, sample 6
(declare-fun node_out_1_1_s7 () Real) ; Intermediate output for layer 1, node 1, sample 7
(declare-fun node_out_1_1_s8 () Real) ; Intermediate output for layer 1, node 1, sample 8
(declare-fun node_out_1_1_s9 () Real) ; Intermediate output for layer 1, node 1, sample 9
(declare-fun node_out_1_1_s10 () Real) ; Intermediate output for layer 1, node 1, sample 10
(declare-fun node_out_1_2_s1 () Real) ; Intermediate output for layer 1, node 2, sample 1
(declare-fun node_out_1_2_s2 () Real) ; Intermediate output for layer 1, node 2, sample 2
(declare-fun node_out_1_2_s3 () Real) ; Intermediate output for layer 1, node 2, sample 3
(declare-fun node_out_1_2_s4 () Real) ; Intermediate output for layer 1, node 2, sample 4
(declare-fun node_out_1_2_s5 () Real) ; Intermediate output for layer 1, node 2, sample 5
(declare-fun node_out_1_2_s6 () Real) ; Intermediate output for layer 1, node 2, sample 6
(declare-fun node_out_1_2_s7 () Real) ; Intermediate output for layer 1, node 2, sample 7
(declare-fun node_out_1_2_s8 () Real) ; Intermediate output for layer 1, node 2, sample 8
(declare-fun node_out_1_2_s9 () Real) ; Intermediate output for layer 1, node 2, sample 9
(declare-fun node_out_1_2_s10 () Real) ; Intermediate output for layer 1, node 2, sample 10
(declare-fun node_out_1_3_s1 () Real) ; Intermediate output for layer 1, node 3, sample 1
(declare-fun node_out_1_3_s2 () Real) ; Intermediate output for layer 1, node 3, sample 2
(declare-fun node_out_1_3_s3 () Real) ; Intermediate output for layer 1, node 3, sample 3
(declare-fun node_out_1_3_s4 () Real) ; Intermediate output for layer 1, node 3, sample 4
(declare-fun node_out_1_3_s5 () Real) ; Intermediate output for layer 1, node 3, sample 5
(declare-fun node_out_1_3_s6 () Real) ; Intermediate output for layer 1, node 3, sample 6
(declare-fun node_out_1_3_s7 () Real) ; Intermediate output for layer 1, node 3, sample 7
(declare-fun node_out_1_3_s8 () Real) ; Intermediate output for layer 1, node 3, sample 8
(declare-fun node_out_1_3_s9 () Real) ; Intermediate output for layer 1, node 3, sample 9
(declare-fun node_out_1_3_s10 () Real) ; Intermediate output for layer 1, node 3, sample 10
(declare-fun node_out_1_4_s1 () Real) ; Intermediate output for layer 1, node 4, sample 1
(declare-fun node_out_1_4_s2 () Real) ; Intermediate output for layer 1, node 4, sample 2
(declare-fun node_out_1_4_s3 () Real) ; Intermediate output for layer 1, node 4, sample 3
(declare-fun node_out_1_4_s4 () Real) ; Intermediate output for layer 1, node 4, sample 4
(declare-fun node_out_1_4_s5 () Real) ; Intermediate output for layer 1, node 4, sample 5
(declare-fun node_out_1_4_s6 () Real) ; Intermediate output for layer 1, node 4, sample 6
(declare-fun node_out_1_4_s7 () Real) ; Intermediate output for layer 1, node 4, sample 7
(declare-fun node_out_1_4_s8 () Real) ; Intermediate output for layer 1, node 4, sample 8
(declare-fun node_out_1_4_s9 () Real) ; Intermediate output for layer 1, node 4, sample 9
(declare-fun node_out_1_4_s10 () Real) ; Intermediate output for layer 1, node 4, sample 10

(declare-fun w2_1_1 () Real) ; Weight for output node, input from hidden node 1
(declare-fun w2_1_2 () Real) ; Weight for output node, input from hidden node 2
(declare-fun w2_1_3 () Real) ; Weight for output node, input from hidden node 3
(declare-fun w2_1_4 () Real) ; Weight for output node, input from hidden node 4
(declare-fun b_out () Real) ; Bias for output node

; Constraint for sample 1 (Label: 0)
(assert (= node_out_1_1_s1 (+ (* w1_1_1 2.0) (* w1_1_2 2.33333333333333) (* w1_1_3 2.0) (* w1_1_4 2.33333333333333) b1_1)))
(assert (= node_out_1_2_s1 (+ (* w1_2_1 2.0) (* w1_2_2 2.33333333333333) (* w1_2_3 2.0) (* w1_2_4 2.33333333333333) b1_2)))
(assert (= node_out_1_3_s1 (+ (* w1_3_1 2.0) (* w1_3_2 2.33333333333333) (* w1_3_3 2.0) (* w1_3_4 2.33333333333333) b1_3)))
(assert (= node_out_1_4_s1 (+ (* w1_4_1 2.0) (* w1_4_2 2.33333333333333) (* w1_4_3 2.0) (* w1_4_4 2.33333333333333) b1_4)))

(assert (< (+ (* w2_1_1 node_out_1_1_s1) (* w2_1_2 node_out_1_2_s1) (* w2_1_3 node_out_1_3_s1) (* w2_1_4 node_out_1_4_s1) b_out) 0)) ; Label 0 requires output < 0

; Constraint for sample 2 (Label: 0)
(assert (= node_out_1_1_s2 (+ (* w1_1_1 1.66666666666666) (* w1_1_2 0.666666666666666) (* w1_1_3 1.66666666666666) (* w1_1_4 0.0) b1_1)))
(assert (= node_out_1_2_s2 (+ (* w1_2_1 1.66666666666666) (* w1_2_2 0.666666666666666) (* w1_2_3 1.66666666666666) (* w1_2_4 0.0) b1_2)))
(assert (= node_out_1_3_s2 (+ (* w1_3_1 1.66666666666666) (* w1_3_2 0.666666666666666) (* w1_3_3 1.66666666666666) (* w1_3_4 0.0) b1_3)))
(assert (= node_out_1_4_s2 (+ (* w1_4_1 1.66666666666666) (* w1_4_2 0.666666666666666) (* w1_4_3 1.66666666666666) (* w1_4_4 0.0) b1_4)))

(assert (< (+ (* w2_1_1 node_out_1_1_s2) (* w2_1_2 node_out_1_2_s2) (* w2_1_3 node_out_1_3_s2) (* w2_1_4 node_out_1_4_s2) b_out) 0)) ; Label 0 requires output < 0

; Constraint for sample 3 (Label: 0)
(assert (= node_out_1_1_s3 (+ (* w1_1_1 1.33333333333333) (* w1_1_2 1.66666666666666) (* w1_1_3 2.33333333333333) (* w1_1_4 0.666666666666666) b1_1)))
(assert (= node_out_1_2_s3 (+ (* w1_2_1 1.33333333333333) (* w1_2_2 1.66666666666666) (* w1_2_3 2.33333333333333) (* w1_2_4 0.666666666666666) b1_2)))
(assert (= node_out_1_3_s3 (+ (* w1_3_1 1.33333333333333) (* w1_3_2 1.66666666666666) (* w1_3_3 2.33333333333333) (* w1_3_4 0.666666666666666) b1_3)))
(assert (= node_out_1_4_s3 (+ (* w1_4_1 1.33333333333333) (* w1_4_2 1.66666666666666) (* w1_4_3 2.33333333333333) (* w1_4_4 0.666666666666666) b1_4)))

(assert (< (+ (* w2_1_1 node_out_1_1_s3) (* w2_1_2 node_out_1_2_s3) (* w2_1_3 node_out_1_3_s3) (* w2_1_4 node_out_1_4_s3) b_out) 0)) ; Label 0 requires output < 0

; Constraint for sample 4 (Label: 1)
(assert (= node_out_1_1_s4 (+ (* w1_1_1 2.0) (* w1_1_2 1.0) (* w1_1_3 0.333333333333333) (* w1_1_4 1.33333333333333) b1_1)))
(assert (= node_out_1_2_s4 (+ (* w1_2_1 2.0) (* w1_2_2 1.0) (* w1_2_3 0.333333333333333) (* w1_2_4 1.33333333333333) b1_2)))
(assert (= node_out_1_3_s4 (+ (* w1_3_1 2.0) (* w1_3_2 1.0) (* w1_3_3 0.333333333333333) (* w1_3_4 1.33333333333333) b1_3)))
(assert (= node_out_1_4_s4 (+ (* w1_4_1 2.0) (* w1_4_2 1.0) (* w1_4_3 0.333333333333333) (* w1_4_4 1.33333333333333) b1_4)))

(assert (> (+ (* w2_1_1 node_out_1_1_s4) (* w2_1_2 node_out_1_2_s4) (* w2_1_3 node_out_1_3_s4) (* w2_1_4 node_out_1_4_s4) b_out) 0)) ; Label 1 requires output > 0

; Constraint for sample 5 (Label: 0)
(assert (= node_out_1_1_s5 (+ (* w1_1_1 1.66666666666666) (* w1_1_2 2.0) (* w1_1_3 2.33333333333333) (* w1_1_4 2.33333333333333) b1_1)))
(assert (= node_out_1_2_s5 (+ (* w1_2_1 1.66666666666666) (* w1_2_2 2.0) (* w1_2_3 2.33333333333333) (* w1_2_4 2.33333333333333) b1_2)))
(assert (= node_out_1_3_s5 (+ (* w1_3_1 1.66666666666666) (* w1_3_2 2.0) (* w1_3_3 2.33333333333333) (* w1_3_4 2.33333333333333) b1_3)))
(assert (= node_out_1_4_s5 (+ (* w1_4_1 1.66666666666666) (* w1_4_2 2.0) (* w1_4_3 2.33333333333333) (* w1_4_4 2.33333333333333) b1_4)))

(assert (< (+ (* w2_1_1 node_out_1_1_s5) (* w2_1_2 node_out_1_2_s5) (* w2_1_3 node_out_1_3_s5) (* w2_1_4 node_out_1_4_s5) b_out) 0)) ; Label 0 requires output < 0

; Constraint for sample 6 (Label: 1)
(assert (= node_out_1_1_s6 (+ (* w1_1_1 1.0) (* w1_1_2 -0.666666666666666) (* w1_1_3 1.0) (* w1_1_4 0.666666666666666) b1_1)))
(assert (= node_out_1_2_s6 (+ (* w1_2_1 1.0) (* w1_2_2 -0.666666666666666) (* w1_2_3 1.0) (* w1_2_4 0.666666666666666) b1_2)))
(assert (= node_out_1_3_s6 (+ (* w1_3_1 1.0) (* w1_3_2 -0.666666666666666) (* w1_3_3 1.0) (* w1_3_4 0.666666666666666) b1_3)))
(assert (= node_out_1_4_s6 (+ (* w1_4_1 1.0) (* w1_4_2 -0.666666666666666) (* w1_4_3 1.0) (* w1_4_4 0.666666666666666) b1_4)))

(assert (> (+ (* w2_1_1 node_out_1_1_s6) (* w2_1_2 node_out_1_2_s6) (* w2_1_3 node_out_1_3_s6) (* w2_1_4 node_out_1_4_s6) b_out) 0)) ; Label 1 requires output > 0

; Constraint for sample 7 (Label: 0)
(assert (= node_out_1_1_s7 (+ (* w1_1_1 2.0) (* w1_1_2 2.33333333333333) (* w1_1_3 2.66666666666666) (* w1_1_4 4.0) b1_1)))
(assert (= node_out_1_2_s7 (+ (* w1_2_1 2.0) (* w1_2_2 2.33333333333333) (* w1_2_3 2.66666666666666) (* w1_2_4 4.0) b1_2)))
(assert (= node_out_1_3_s7 (+ (* w1_3_1 2.0) (* w1_3_2 2.33333333333333) (* w1_3_3 2.66666666666666) (* w1_3_4 4.0) b1_3)))
(assert (= node_out_1_4_s7 (+ (* w1_4_1 2.0) (* w1_4_2 2.33333333333333) (* w1_4_3 2.66666666666666) (* w1_4_4 4.0) b1_4)))

(assert (< (+ (* w2_1_1 node_out_1_1_s7) (* w2_1_2 node_out_1_2_s7) (* w2_1_3 node_out_1_3_s7) (* w2_1_4 node_out_1_4_s7) b_out) 0)) ; Label 0 requires output < 0

; Constraint for sample 8 (Label: 1)
(assert (= node_out_1_1_s8 (+ (* w1_1_1 0.0) (* w1_1_2 0.333333333333333) (* w1_1_3 0.666666666666666) (* w1_1_4 -0.666666666666666) b1_1)))
(assert (= node_out_1_2_s8 (+ (* w1_2_1 0.0) (* w1_2_2 0.333333333333333) (* w1_2_3 0.666666666666666) (* w1_2_4 -0.666666666666666) b1_2)))
(assert (= node_out_1_3_s8 (+ (* w1_3_1 0.0) (* w1_3_2 0.333333333333333) (* w1_3_3 0.666666666666666) (* w1_3_4 -0.666666666666666) b1_3)))
(assert (= node_out_1_4_s8 (+ (* w1_4_1 0.0) (* w1_4_2 0.333333333333333) (* w1_4_3 0.666666666666666) (* w1_4_4 -0.666666666666666) b1_4)))

(assert (> (+ (* w2_1_1 node_out_1_1_s8) (* w2_1_2 node_out_1_2_s8) (* w2_1_3 node_out_1_3_s8) (* w2_1_4 node_out_1_4_s8) b_out) 0)) ; Label 1 requires output > 0

; Constraint for sample 9 (Label: 1)
(assert (= node_out_1_1_s9 (+ (* w1_1_1 1.0) (* w1_1_2 1.0) (* w1_1_3 1.33333333333333) (* w1_1_4 1.66666666666666) b1_1)))
(assert (= node_out_1_2_s9 (+ (* w1_2_1 1.0) (* w1_2_2 1.0) (* w1_2_3 1.33333333333333) (* w1_2_4 1.66666666666666) b1_2)))
(assert (= node_out_1_3_s9 (+ (* w1_3_1 1.0) (* w1_3_2 1.0) (* w1_3_3 1.33333333333333) (* w1_3_4 1.66666666666666) b1_3)))
(assert (= node_out_1_4_s9 (+ (* w1_4_1 1.0) (* w1_4_2 1.0) (* w1_4_3 1.33333333333333) (* w1_4_4 1.66666666666666) b1_4)))

(assert (> (+ (* w2_1_1 node_out_1_1_s9) (* w2_1_2 node_out_1_2_s9) (* w2_1_3 node_out_1_3_s9) (* w2_1_4 node_out_1_4_s9) b_out) 0)) ; Label 1 requires output > 0

; Constraint for sample 10 (Label: 0)
(assert (= node_out_1_1_s10 (+ (* w1_1_1 1.33333333333333) (* w1_1_2 2.0) (* w1_1_3 2.33333333333333) (* w1_1_4 2.33333333333333) b1_1)))
(assert (= node_out_1_2_s10 (+ (* w1_2_1 1.33333333333333) (* w1_2_2 2.0) (* w1_2_3 2.33333333333333) (* w1_2_4 2.33333333333333) b1_2)))
(assert (= node_out_1_3_s10 (+ (* w1_3_1 1.33333333333333) (* w1_3_2 2.0) (* w1_3_3 2.33333333333333) (* w1_3_4 2.33333333333333) b1_3)))
(assert (= node_out_1_4_s10 (+ (* w1_4_1 1.33333333333333) (* w1_4_2 2.0) (* w1_4_3 2.33333333333333) (* w1_4_4 2.33333333333333) b1_4)))

(assert (< (+ (* w2_1_1 node_out_1_1_s10) (* w2_1_2 node_out_1_2_s10) (* w2_1_3 node_out_1_3_s10) (* w2_1_4 node_out_1_4_s10) b_out) 0)) ; Label 0 requires output < 0

(check-sat)
(get-model)