; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)

; SMT-LIBv2 file generated for cvc5 with multi-layer configuration
; Stepped threshold activation is enabled in hidden layers
; Number of features (input neurons): 4
; Number of layers: 1
; Number of nodes in layer 1: 2
; Number of samples: 10

(declare-fun w1_1_1 () Real) ; Weight for layer 1, node 1, input 1
(assert (or (and (> w1_1_1 0.1) (< w1_1_1 100)) (and (> w1_1_1 (- 100.0)) (< w1_1_1 (- 0.1)))))
(declare-fun w1_1_2 () Real) ; Weight for layer 1, node 1, input 2
(assert (or (and (> w1_1_2 0.1) (< w1_1_2 100)) (and (> w1_1_2 (- 100.0)) (< w1_1_2 (- 0.1)))))
(declare-fun w1_1_3 () Real) ; Weight for layer 1, node 1, input 3
(assert (or (and (> w1_1_3 0.1) (< w1_1_3 100)) (and (> w1_1_3 (- 100.0)) (< w1_1_3 (- 0.1)))))
(declare-fun w1_1_4 () Real) ; Weight for layer 1, node 1, input 4
(assert (or (and (> w1_1_4 0.1) (< w1_1_4 100)) (and (> w1_1_4 (- 100.0)) (< w1_1_4 (- 0.1)))))
(declare-fun b1_1 () Real) ; Bias for layer 1, node 1
(assert (or (and (> b1_1 0.1) (< b1_1 100)) (and (> b1_1 (- 100.0)) (< b1_1 (- 0.1)))))
(declare-fun z1_1_s1 () Bool) ; Binary activation for layer 1, node 1, sample 1
(declare-fun z1_1_s2 () Bool) ; Binary activation for layer 1, node 1, sample 2
(declare-fun z1_1_s3 () Bool) ; Binary activation for layer 1, node 1, sample 3
(declare-fun z1_1_s4 () Bool) ; Binary activation for layer 1, node 1, sample 4
(declare-fun z1_1_s5 () Bool) ; Binary activation for layer 1, node 1, sample 5
(declare-fun z1_1_s6 () Bool) ; Binary activation for layer 1, node 1, sample 6
(declare-fun z1_1_s7 () Bool) ; Binary activation for layer 1, node 1, sample 7
(declare-fun z1_1_s8 () Bool) ; Binary activation for layer 1, node 1, sample 8
(declare-fun z1_1_s9 () Bool) ; Binary activation for layer 1, node 1, sample 9
(declare-fun z1_1_s10 () Bool) ; Binary activation for layer 1, node 1, sample 10
(declare-fun w1_2_1 () Real) ; Weight for layer 1, node 2, input 1
(assert (or (and (> w1_2_1 0.1) (< w1_2_1 100)) (and (> w1_2_1 (- 100.0)) (< w1_2_1 (- 0.1)))))
(declare-fun w1_2_2 () Real) ; Weight for layer 1, node 2, input 2
(assert (or (and (> w1_2_2 0.1) (< w1_2_2 100)) (and (> w1_2_2 (- 100.0)) (< w1_2_2 (- 0.1)))))
(declare-fun w1_2_3 () Real) ; Weight for layer 1, node 2, input 3
(assert (or (and (> w1_2_3 0.1) (< w1_2_3 100)) (and (> w1_2_3 (- 100.0)) (< w1_2_3 (- 0.1)))))
(declare-fun w1_2_4 () Real) ; Weight for layer 1, node 2, input 4
(assert (or (and (> w1_2_4 0.1) (< w1_2_4 100)) (and (> w1_2_4 (- 100.0)) (< w1_2_4 (- 0.1)))))
(declare-fun b1_2 () Real) ; Bias for layer 1, node 2
(assert (or (and (> b1_2 0.1) (< b1_2 100)) (and (> b1_2 (- 100.0)) (< b1_2 (- 0.1)))))
(declare-fun z1_2_s1 () Bool) ; Binary activation for layer 1, node 2, sample 1
(declare-fun z1_2_s2 () Bool) ; Binary activation for layer 1, node 2, sample 2
(declare-fun z1_2_s3 () Bool) ; Binary activation for layer 1, node 2, sample 3
(declare-fun z1_2_s4 () Bool) ; Binary activation for layer 1, node 2, sample 4
(declare-fun z1_2_s5 () Bool) ; Binary activation for layer 1, node 2, sample 5
(declare-fun z1_2_s6 () Bool) ; Binary activation for layer 1, node 2, sample 6
(declare-fun z1_2_s7 () Bool) ; Binary activation for layer 1, node 2, sample 7
(declare-fun z1_2_s8 () Bool) ; Binary activation for layer 1, node 2, sample 8
(declare-fun z1_2_s9 () Bool) ; Binary activation for layer 1, node 2, sample 9
(declare-fun z1_2_s10 () Bool) ; Binary activation for layer 1, node 2, sample 10

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

(declare-fun w2_1_1 () Real) ; Weight for output node, input from hidden node 1
(assert (or (and (> w2_1_1 0.1) (< w2_1_1 100)) (and (> w2_1_1 (- 100.0)) (< w2_1_1 (- 0.1)))))
(declare-fun w2_1_2 () Real) ; Weight for output node, input from hidden node 2
(assert (or (and (> w2_1_2 0.1) (< w2_1_2 100)) (and (> w2_1_2 (- 100.0)) (< w2_1_2 (- 0.1)))))
(declare-fun b_out () Real) ; Bias for output node
(assert (or (and (> b_out 0.1) (< b_out 100)) (and (> b_out (- 100.0)) (< b_out (- 0.1)))))

; Constraint for sample 1 (Label: 0)
(assert (= node_out_1_1_s1 (+ (* w1_1_1 2.0) (* w1_1_2 2.33333333333333) (* w1_1_3 2.0) (* w1_1_4 2.33333333333333) b1_1)))
(assert (or (and (>= node_out_1_1_s1 0) (= z1_1_s1 true)) (and (< node_out_1_1_s1 0) (= z1_1_s1 false))))
(assert (= node_out_1_2_s1 (+ (* w1_2_1 2.0) (* w1_2_2 2.33333333333333) (* w1_2_3 2.0) (* w1_2_4 2.33333333333333) b1_2)))
(assert (or (and (>= node_out_1_2_s1 0) (= z1_2_s1 true)) (and (< node_out_1_2_s1 0) (= z1_2_s1 false))))
(declare-fun err_s1 () Real) ; Error for sample 1
(declare-fun output_s1 () Real) ; Output for sample 1
(assert (= output_s1 (+ (* w2_1_1 (ite z1_1_s1 1.0 0.0)) (* w2_1_2 (ite z1_2_s1 1.0 0.0)) b_out)))
(assert (= err_s1 (ite (> output_s1 (- 1.0)) (+ 1.0 output_s1) 0.0)))
; Constraint for sample 2 (Label: 0)
(assert (= node_out_1_1_s2 (+ (* w1_1_1 1.66666666666666) (* w1_1_2 0.666666666666666) (* w1_1_3 1.66666666666666) (* w1_1_4 0.0) b1_1)))
(assert (or (and (>= node_out_1_1_s2 0) (= z1_1_s2 true)) (and (< node_out_1_1_s2 0) (= z1_1_s2 false))))
(assert (= node_out_1_2_s2 (+ (* w1_2_1 1.66666666666666) (* w1_2_2 0.666666666666666) (* w1_2_3 1.66666666666666) (* w1_2_4 0.0) b1_2)))
(assert (or (and (>= node_out_1_2_s2 0) (= z1_2_s2 true)) (and (< node_out_1_2_s2 0) (= z1_2_s2 false))))
(declare-fun err_s2 () Real) ; Error for sample 2
(declare-fun output_s2 () Real) ; Output for sample 2
(assert (= output_s2 (+ (* w2_1_1 (ite z1_1_s2 1.0 0.0)) (* w2_1_2 (ite z1_2_s2 1.0 0.0)) b_out)))
(assert (= err_s2 (ite (> output_s2 (- 1.0)) (+ 1.0 output_s2) 0.0)))
; Constraint for sample 3 (Label: 0)
(assert (= node_out_1_1_s3 (+ (* w1_1_1 1.33333333333333) (* w1_1_2 1.66666666666666) (* w1_1_3 2.33333333333333) (* w1_1_4 0.666666666666666) b1_1)))
(assert (or (and (>= node_out_1_1_s3 0) (= z1_1_s3 true)) (and (< node_out_1_1_s3 0) (= z1_1_s3 false))))
(assert (= node_out_1_2_s3 (+ (* w1_2_1 1.33333333333333) (* w1_2_2 1.66666666666666) (* w1_2_3 2.33333333333333) (* w1_2_4 0.666666666666666) b1_2)))
(assert (or (and (>= node_out_1_2_s3 0) (= z1_2_s3 true)) (and (< node_out_1_2_s3 0) (= z1_2_s3 false))))
(declare-fun err_s3 () Real) ; Error for sample 3
(declare-fun output_s3 () Real) ; Output for sample 3
(assert (= output_s3 (+ (* w2_1_1 (ite z1_1_s3 1.0 0.0)) (* w2_1_2 (ite z1_2_s3 1.0 0.0)) b_out)))
(assert (= err_s3 (ite (> output_s3 (- 1.0)) (+ 1.0 output_s3) 0.0)))
; Constraint for sample 4 (Label: 1)
(assert (= node_out_1_1_s4 (+ (* w1_1_1 2.0) (* w1_1_2 1.0) (* w1_1_3 0.333333333333333) (* w1_1_4 1.33333333333333) b1_1)))
(assert (or (and (>= node_out_1_1_s4 0) (= z1_1_s4 true)) (and (< node_out_1_1_s4 0) (= z1_1_s4 false))))
(assert (= node_out_1_2_s4 (+ (* w1_2_1 2.0) (* w1_2_2 1.0) (* w1_2_3 0.333333333333333) (* w1_2_4 1.33333333333333) b1_2)))
(assert (or (and (>= node_out_1_2_s4 0) (= z1_2_s4 true)) (and (< node_out_1_2_s4 0) (= z1_2_s4 false))))
(declare-fun err_s4 () Real) ; Error for sample 4
(declare-fun output_s4 () Real) ; Output for sample 4
(assert (= output_s4 (+ (* w2_1_1 (ite z1_1_s4 1.0 0.0)) (* w2_1_2 (ite z1_2_s4 1.0 0.0)) b_out)))
(assert (= err_s4 (ite (< output_s4 1.0) (- 1.0 output_s4) 0.0)))
; Constraint for sample 5 (Label: 0)
(assert (= node_out_1_1_s5 (+ (* w1_1_1 1.66666666666666) (* w1_1_2 2.0) (* w1_1_3 2.33333333333333) (* w1_1_4 2.33333333333333) b1_1)))
(assert (or (and (>= node_out_1_1_s5 0) (= z1_1_s5 true)) (and (< node_out_1_1_s5 0) (= z1_1_s5 false))))
(assert (= node_out_1_2_s5 (+ (* w1_2_1 1.66666666666666) (* w1_2_2 2.0) (* w1_2_3 2.33333333333333) (* w1_2_4 2.33333333333333) b1_2)))
(assert (or (and (>= node_out_1_2_s5 0) (= z1_2_s5 true)) (and (< node_out_1_2_s5 0) (= z1_2_s5 false))))
(declare-fun err_s5 () Real) ; Error for sample 5
(declare-fun output_s5 () Real) ; Output for sample 5
(assert (= output_s5 (+ (* w2_1_1 (ite z1_1_s5 1.0 0.0)) (* w2_1_2 (ite z1_2_s5 1.0 0.0)) b_out)))
(assert (= err_s5 (ite (> output_s5 (- 1.0)) (+ 1.0 output_s5) 0.0)))
; Constraint for sample 6 (Label: 1)
(assert (= node_out_1_1_s6 (+ (* w1_1_1 1.0) (* w1_1_2 (- 0.666666666666666)) (* w1_1_3 1.0) (* w1_1_4 0.666666666666666) b1_1)))
(assert (or (and (>= node_out_1_1_s6 0) (= z1_1_s6 true)) (and (< node_out_1_1_s6 0) (= z1_1_s6 false))))
(assert (= node_out_1_2_s6 (+ (* w1_2_1 1.0) (* w1_2_2 (- 0.666666666666666)) (* w1_2_3 1.0) (* w1_2_4 0.666666666666666) b1_2)))
(assert (or (and (>= node_out_1_2_s6 0) (= z1_2_s6 true)) (and (< node_out_1_2_s6 0) (= z1_2_s6 false))))
(declare-fun err_s6 () Real) ; Error for sample 6
(declare-fun output_s6 () Real) ; Output for sample 6
(assert (= output_s6 (+ (* w2_1_1 (ite z1_1_s6 1.0 0.0)) (* w2_1_2 (ite z1_2_s6 1.0 0.0)) b_out)))
(assert (= err_s6 (ite (< output_s6 1.0) (- 1.0 output_s6) 0.0)))
; Constraint for sample 7 (Label: 0)
(assert (= node_out_1_1_s7 (+ (* w1_1_1 2.0) (* w1_1_2 2.33333333333333) (* w1_1_3 2.66666666666666) (* w1_1_4 4.0) b1_1)))
(assert (or (and (>= node_out_1_1_s7 0) (= z1_1_s7 true)) (and (< node_out_1_1_s7 0) (= z1_1_s7 false))))
(assert (= node_out_1_2_s7 (+ (* w1_2_1 2.0) (* w1_2_2 2.33333333333333) (* w1_2_3 2.66666666666666) (* w1_2_4 4.0) b1_2)))
(assert (or (and (>= node_out_1_2_s7 0) (= z1_2_s7 true)) (and (< node_out_1_2_s7 0) (= z1_2_s7 false))))
(declare-fun err_s7 () Real) ; Error for sample 7
(declare-fun output_s7 () Real) ; Output for sample 7
(assert (= output_s7 (+ (* w2_1_1 (ite z1_1_s7 1.0 0.0)) (* w2_1_2 (ite z1_2_s7 1.0 0.0)) b_out)))
(assert (= err_s7 (ite (> output_s7 (- 1.0)) (+ 1.0 output_s7) 0.0)))
; Constraint for sample 8 (Label: 1)
(assert (= node_out_1_1_s8 (+ (* w1_1_1 0.0) (* w1_1_2 0.333333333333333) (* w1_1_3 0.666666666666666) (* w1_1_4 (- 0.666666666666666)) b1_1)))
(assert (or (and (>= node_out_1_1_s8 0) (= z1_1_s8 true)) (and (< node_out_1_1_s8 0) (= z1_1_s8 false))))
(assert (= node_out_1_2_s8 (+ (* w1_2_1 0.0) (* w1_2_2 0.333333333333333) (* w1_2_3 0.666666666666666) (* w1_2_4 (- 0.666666666666666)) b1_2)))
(assert (or (and (>= node_out_1_2_s8 0) (= z1_2_s8 true)) (and (< node_out_1_2_s8 0) (= z1_2_s8 false))))
(declare-fun err_s8 () Real) ; Error for sample 8
(declare-fun output_s8 () Real) ; Output for sample 8
(assert (= output_s8 (+ (* w2_1_1 (ite z1_1_s8 1.0 0.0)) (* w2_1_2 (ite z1_2_s8 1.0 0.0)) b_out)))
(assert (= err_s8 (ite (< output_s8 1.0) (- 1.0 output_s8) 0.0)))
; Constraint for sample 9 (Label: 1)
(assert (= node_out_1_1_s9 (+ (* w1_1_1 1.0) (* w1_1_2 1.0) (* w1_1_3 1.33333333333333) (* w1_1_4 1.66666666666666) b1_1)))
(assert (or (and (>= node_out_1_1_s9 0) (= z1_1_s9 true)) (and (< node_out_1_1_s9 0) (= z1_1_s9 false))))
(assert (= node_out_1_2_s9 (+ (* w1_2_1 1.0) (* w1_2_2 1.0) (* w1_2_3 1.33333333333333) (* w1_2_4 1.66666666666666) b1_2)))
(assert (or (and (>= node_out_1_2_s9 0) (= z1_2_s9 true)) (and (< node_out_1_2_s9 0) (= z1_2_s9 false))))
(declare-fun err_s9 () Real) ; Error for sample 9
(declare-fun output_s9 () Real) ; Output for sample 9
(assert (= output_s9 (+ (* w2_1_1 (ite z1_1_s9 1.0 0.0)) (* w2_1_2 (ite z1_2_s9 1.0 0.0)) b_out)))
(assert (= err_s9 (ite (< output_s9 1.0) (- 1.0 output_s9) 0.0)))
; Constraint for sample 10 (Label: 0)
(assert (= node_out_1_1_s10 (+ (* w1_1_1 1.33333333333333) (* w1_1_2 2.0) (* w1_1_3 2.33333333333333) (* w1_1_4 2.33333333333333) b1_1)))
(assert (or (and (>= node_out_1_1_s10 0) (= z1_1_s10 true)) (and (< node_out_1_1_s10 0) (= z1_1_s10 false))))
(assert (= node_out_1_2_s10 (+ (* w1_2_1 1.33333333333333) (* w1_2_2 2.0) (* w1_2_3 2.33333333333333) (* w1_2_4 2.33333333333333) b1_2)))
(assert (or (and (>= node_out_1_2_s10 0) (= z1_2_s10 true)) (and (< node_out_1_2_s10 0) (= z1_2_s10 false))))
(declare-fun err_s10 () Real) ; Error for sample 10
(declare-fun output_s10 () Real) ; Output for sample 10
(assert (= output_s10 (+ (* w2_1_1 (ite z1_1_s10 1.0 0.0)) (* w2_1_2 (ite z1_2_s10 1.0 0.0)) b_out)))
(assert (= err_s10 (ite (> output_s10 (- 1.0)) (+ 1.0 output_s10) 0.0)))
(minimize ( + err_s1 err_s2 err_s3 err_s4 err_s5 err_s6 err_s7 err_s8 err_s9 err_s10))
(check-sat)
(get-model)