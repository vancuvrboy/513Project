Unsupported constructs detected:
; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)
; SMT-LIBv2 file generated for cvc5 with multi-layer configuration
; ReLU activation is disabled in hidden layers
; Number of features (input neurons): 4
; Number of layers: 1
; Number of nodes in layer 1: 4
; Number of samples: 2
; Slack variables are enabled.
; Constraint for sample 1 (Label: 0)
;(declare-fun slack_1 () Real)
;(assert (>= slack_1 0.0))
; Constraint for sample 2 (Label: 0)
;(declare-fun slack_2 () Real)
;(assert (>= slack_2 0.0))
(check-sat)
(get-model)
Restricted license - for non-production use only - expires 2026-11-23
Evaluating constraint: (gurobi_vars['slack_1'] >= 0.0)
Evaluating constraint: (gurobi_vars['slack_2'] >= 0.0)
Evaluating constraint: (gurobi_vars['node_out_1_1'] == ((gurobi_vars['w1_1_1'] * 2.0) + (gurobi_vars['w1_1_2'] * 2.33333333333333) + (gurobi_vars['w1_1_3'] * 2.0) + (gurobi_vars['w1_1_4'] * 2.33333333333333) + gurobi_vars['b1_1']))
Evaluating constraint: (gurobi_vars['node_out_1_2'] == ((gurobi_vars['w1_2_1'] * 2.0) + (gurobi_vars['w1_2_2'] * 2.33333333333333) + (gurobi_vars['w1_2_3'] * 2.0) + (gurobi_vars['w1_2_4'] * 2.33333333333333) + gurobi_vars['b1_2']))
Evaluating constraint: (gurobi_vars['node_out_1_3'] == ((gurobi_vars['w1_3_1'] * 2.0) + (gurobi_vars['w1_3_2'] * 2.33333333333333) + (gurobi_vars['w1_3_3'] * 2.0) + (gurobi_vars['w1_3_4'] * 2.33333333333333) + gurobi_vars['b1_3']))
Evaluating constraint: (gurobi_vars['node_out_1_4'] == ((gurobi_vars['w1_4_1'] * 2.0) + (gurobi_vars['w1_4_2'] * 2.33333333333333) + (gurobi_vars['w1_4_3'] * 2.0) + (gurobi_vars['w1_4_4'] * 2.33333333333333) + gurobi_vars['b1_4']))
Could not translate constraint: ['<', ['-', ['+', ['*', 'w2_1_1', 'node_out_1_1'], ['*', 'w2_1_2', 'node_out_1_2'], ['*', 'w2_1_3', 'node_out_1_3'], ['*', 'w2_1_4', 'node_out_1_4'], 'b_out'], 'slack_1'], '0.0']. Error: Non-linear term detected: multiplication of variables ["gurobi_vars['w2_1_1']", "gurobi_vars['node_out_1_1']"]
Evaluating constraint: (gurobi_vars['node_out_1_1'] == ((gurobi_vars['w1_1_1'] * 1.66666666666666) + (gurobi_vars['w1_1_2'] * 0.666666666666666) + (gurobi_vars['w1_1_3'] * 1.66666666666666) + (gurobi_vars['w1_1_4'] * 0.0) + gurobi_vars['b1_1']))
Evaluating constraint: (gurobi_vars['node_out_1_2'] == ((gurobi_vars['w1_2_1'] * 1.66666666666666) + (gurobi_vars['w1_2_2'] * 0.666666666666666) + (gurobi_vars['w1_2_3'] * 1.66666666666666) + (gurobi_vars['w1_2_4'] * 0.0) + gurobi_vars['b1_2']))
Evaluating constraint: (gurobi_vars['node_out_1_3'] == ((gurobi_vars['w1_3_1'] * 1.66666666666666) + (gurobi_vars['w1_3_2'] * 0.666666666666666) + (gurobi_vars['w1_3_3'] * 1.66666666666666) + (gurobi_vars['w1_3_4'] * 0.0) + gurobi_vars['b1_3']))
Evaluating constraint: (gurobi_vars['node_out_1_4'] == ((gurobi_vars['w1_4_1'] * 1.66666666666666) + (gurobi_vars['w1_4_2'] * 0.666666666666666) + (gurobi_vars['w1_4_3'] * 1.66666666666666) + (gurobi_vars['w1_4_4'] * 0.0) + gurobi_vars['b1_4']))
Could not translate constraint: ['<', ['-', ['+', ['*', 'w2_1_1', 'node_out_1_1'], ['*', 'w2_1_2', 'node_out_1_2'], ['*', 'w2_1_3', 'node_out_1_3'], ['*', 'w2_1_4', 'node_out_1_4'], 'b_out'], 'slack_2'], '0.0']. Error: Non-linear term detected: multiplication of variables ["gurobi_vars['w2_1_1']", "gurobi_vars['node_out_1_1']"]
Evaluating constraint: (gurobi_vars['total_slack'] == (gurobi_vars['slack_1'] + gurobi_vars['slack_2']))
Translation successful. Model saved as 'output.lp'.
