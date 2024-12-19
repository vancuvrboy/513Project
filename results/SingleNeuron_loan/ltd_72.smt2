; SMT-LIBv2 configurations
(set-logic QF_NRA)
(set-option :produce-models true)
(set-option :produce-unsat-cores true)

; SMT-LIBv2 file generated for cvc5 with multi-layer configuration
; Number of features (input neurons): 11
; Number of layers: 0
; Number of samples: 72

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
(assert (> (+ (* w1 0.2) (* w2 1.0) (* w3 1.0) (* w4 0.77319587628866) (* w5 0.642857142857143) (* w6 0.555555555555556) (* w7 0.415) (* w8 0.623287671232877) (* w9 0.54639175257732) (* w10 0.519280205655527) (* w11 0.476190476190476) b) 0.0)) ; Constraint for sample 11 (Label: 1)
(assert (< (+ (* w1 1.0) (* w2 1.0) (* w3 0.0) (* w4 0.309278350515464) (* w5 0.247448979591837) (* w6 0.666666666666667) (* w7 0.516666666666667) (* w8 0.102739726027397) (* w9 0.195876288659794) (* w10 0.213367609254499) (* w11 0.238095238095238) b) 0.0)) ; Constraint for sample 12 (Label: 0)
(assert (< (+ (* w1 1.0) (* w2 1.0) (* w3 0.0) (* w4 0.0412371134020619) (* w5 0.0433673469387755) (* w6 1.0) (* w7 0.851666666666667) (* w8 0.0136986301369863) (* w9 0.0206185567010309) (* w10 0.0411311053984576) (* w11 0.0408163265306122) b) 0.0)) ; Constraint for sample 13 (Label: 0)
(assert (> (+ (* w1 0.0) (* w2 1.0) (* w3 0.0) (* w4 0.329896907216495) (* w5 0.267857142857143) (* w6 0.222222222222222) (* w7 0.231666666666667) (* w8 0.184931506849315) (* w9 0.0721649484536082) (* w10 0.290488431876607) (* w11 0.129251700680272) b) 0.0)) ; Constraint for sample 14 (Label: 1)
(assert (< (+ (* w1 0.0) (* w2 1.0) (* w3 1.0) (* w4 0.793814432989691) (* w5 0.604591836734694) (* w6 1.0) (* w7 0.713333333333333) (* w8 0.64041095890411) (* w9 0.804123711340206) (* w10 0.552699228791774) (* w11 0.503401360544218) b) 0.0)) ; Constraint for sample 15 (Label: 0)
(assert (> (+ (* w1 0.6) (* w2 0.0) (* w3 0.0) (* w4 0.360824742268041) (* w5 0.221938775510204) (* w6 0.222222222222222) (* w7 0.305) (* w8 0.321917808219178) (* w9 0.0206185567010309) (* w10 0.246786632390745) (* w11 0.244897959183673) b) 0.0)) ; Constraint for sample 16 (Label: 1)
(assert (< (+ (* w1 0.6) (* w2 1.0) (* w3 1.0) (* w4 0.536082474226804) (* w5 0.357142857142857) (* w6 0.111111111111111) (* w7 0.491666666666667) (* w8 0.143835616438356) (* w9 0.144329896907216) (* w10 0.488431876606684) (* w11 0.333333333333333) b) 0.0)) ; Constraint for sample 17 (Label: 0)
(assert (< (+ (* w1 0.0) (* w2 1.0) (* w3 1.0) (* w4 0.958762886597938) (* w5 0.808673469387755) (* w6 0.0) (* w7 0.333333333333333) (* w8 0.287671232876712) (* w9 0.5) (* w10 0.622107969151671) (* w11 0.380952380952381) b) 0.0)) ; Constraint for sample 18 (Label: 0)
(assert (< (+ (* w1 0.4) (* w2 0.0) (* w3 1.0) (* w4 0.948453608247423) (* w5 0.75765306122449) (* w6 0.777777777777778) (* w7 0.441666666666667) (* w8 0.0445205479452055) (* w9 0.201030927835052) (* w10 0.717223650385604) (* w11 0.612244897959184) b) 0.0)) ; Constraint for sample 19 (Label: 0)
(assert (< (+ (* w1 0.8) (* w2 1.0) (* w3 1.0) (* w4 0.309278350515464) (* w5 0.318877551020408) (* w6 0.333333333333333) (* w7 0.563333333333333) (* w8 0.150684931506849) (* w9 0.134020618556701) (* w10 0.197943444730077) (* w11 0.258503401360544) b) 0.0)) ; Constraint for sample 20 (Label: 0)
(assert (> (+ (* w1 0.0) (* w2 1.0) (* w3 0.0) (* w4 0.701030927835051) (* w5 0.459183673469388) (* w6 0.222222222222222) (* w7 0.401666666666667) (* w8 0.219178082191781) (* w9 0.329896907216495) (* w10 0.526992287917738) (* w11 0.564625850340136) b) 0.0)) ; Constraint for sample 21 (Label: 1)
(assert (> (+ (* w1 1.0) (* w2 1.0) (* w3 0.0) (* w4 0.690721649484536) (* w5 0.482142857142857) (* w6 0.555555555555556) (* w7 0.18) (* w8 0.345890410958904) (* w9 0.257731958762887) (* w10 0.632390745501285) (* w11 0.612244897959184) b) 0.0)) ; Constraint for sample 22 (Label: 1)
(assert (< (+ (* w1 0.4) (* w2 1.0) (* w3 1.0) (* w4 0.876288659793814) (* w5 0.474489795918367) (* w6 0.0) (* w7 0.423333333333333) (* w8 0.136986301369863) (* w9 0.0979381443298969) (* w10 0.455012853470437) (* w11 0.782312925170068) b) 0.0)) ; Constraint for sample 23 (Label: 0)
(assert (< (+ (* w1 0.0) (* w2 1.0) (* w3 0.0) (* w4 0.56701030927835) (* w5 0.535714285714286) (* w6 0.111111111111111) (* w7 0.661666666666667) (* w8 0.106164383561644) (* w9 0.350515463917526) (* w10 0.506426735218509) (* w11 0.374149659863946) b) 0.0)) ; Constraint for sample 24 (Label: 0)
(assert (< (+ (* w1 0.0) (* w2 0.0) (* w3 1.0) (* w4 0.402061855670103) (* w5 0.275510204081633) (* w6 0.777777777777778) (* w7 0.808333333333333) (* w8 0.236301369863014) (* w9 0.27319587628866) (* w10 0.210796915167095) (* w11 0.326530612244898) b) 0.0)) ; Constraint for sample 25 (Label: 0)
(assert (< (+ (* w1 0.6) (* w2 1.0) (* w3 0.0) (* w4 0.319587628865979) (* w5 0.326530612244898) (* w6 0.0) (* w7 0.423333333333333) (* w8 0.208904109589041) (* w9 0.128865979381443) (* w10 0.16452442159383) (* w11 0.258503401360544) b) 0.0)) ; Constraint for sample 26 (Label: 0)
(assert (< (+ (* w1 1.0) (* w2 1.0) (* w3 0.0) (* w4 0.639175257731959) (* w5 0.459183673469388) (* w6 0.333333333333333) (* w7 0.661666666666667) (* w8 0.345890410958904) (* w9 0.185567010309278) (* w10 0.570694087403599) (* w11 0.244897959183673) b) 0.0)) ; Constraint for sample 27 (Label: 0)
(assert (< (+ (* w1 0.8) (* w2 1.0) (* w3 0.0) (* w4 0.907216494845361) (* w5 0.732142857142857) (* w6 0.777777777777778) (* w7 0.483333333333333) (* w8 0.160958904109589) (* w9 0.804123711340206) (* w10 0.74293059125964) (* w11 0.836734693877551) b) 0.0)) ; Constraint for sample 28 (Label: 0)
(assert (> (+ (* w1 0.6) (* w2 1.0) (* w3 1.0) (* w4 0.484536082474227) (* w5 0.316326530612245) (* w6 0.333333333333333) (* w7 0.181666666666667) (* w8 0.0719178082191781) (* w9 0.128865979381443) (* w10 0.488431876606684) (* w11 0.319727891156463) b) 0.0)) ; Constraint for sample 29 (Label: 1)
(assert (> (+ (* w1 1.0) (* w2 1.0) (* w3 1.0) (* w4 0.639175257731959) (* w5 0.510204081632653) (* w6 0.777777777777778) (* w7 0.0800000000000001) (* w8 0.345890410958904) (* w9 0.561855670103093) (* w10 0.516709511568124) (* w11 0.469387755102041) b) 0.0)) ; Constraint for sample 30 (Label: 1)
(assert (< (+ (* w1 0.6) (* w2 0.0) (* w3 0.0) (* w4 0.371134020618557) (* w5 0.293367346938775) (* w6 0.111111111111111) (* w7 0.656666666666667) (* w8 0.00342465753424658) (* w9 0.0257731958762887) (* w10 0.205655526992288) (* w11 0.346938775510204) b) 0.0)) ; Constraint for sample 31 (Label: 0)
(assert (< (+ (* w1 0.6) (* w2 0.0) (* w3 1.0) (* w4 0.577319587628866) (* w5 0.441326530612245) (* w6 0.222222222222222) (* w7 0.7) (* w8 0.171232876712329) (* w9 0.216494845360825) (* w10 0.475578406169666) (* w11 0.448979591836735) b) 0.0)) ; Constraint for sample 32 (Label: 0)
(assert (< (+ (* w1 0.6) (* w2 1.0) (* w3 1.0) (* w4 0.907216494845361) (* w5 0.795918367346939) (* w6 0.444444444444444) (* w7 0.916666666666667) (* w8 0.75) (* w9 0.639175257731959) (* w10 0.858611825192802) (* w11 0.54421768707483) b) 0.0)) ; Constraint for sample 33 (Label: 0)
(assert (< (+ (* w1 0.8) (* w2 0.0) (* w3 1.0) (* w4 0.278350515463918) (* w5 0.142857142857143) (* w6 0.888888888888889) (* w7 0.535) (* w8 0.0102739726027397) (* w9 0.15979381443299) (* w10 0.210796915167095) (* w11 0.238095238095238) b) 0.0)) ; Constraint for sample 34 (Label: 0)
(assert (< (+ (* w1 1.0) (* w2 1.0) (* w3 1.0) (* w4 0.412371134020619) (* w5 0.278061224489796) (* w6 0.0) (* w7 0.763333333333333) (* w8 0.184931506849315) (* w9 0.335051546391753) (* w10 0.239074550128535) (* w11 0.258503401360544) b) 0.0)) ; Constraint for sample 35 (Label: 0)
(assert (> (+ (* w1 0.6) (* w2 0.0) (* w3 0.0) (* w4 0.463917525773196) (* w5 0.267857142857143) (* w6 0.333333333333333) (* w7 0.378333333333333) (* w8 0.458904109589041) (* w9 0.15979381443299) (* w10 0.341902313624679) (* w11 0.326530612244898) b) 0.0)) ; Constraint for sample 36 (Label: 1)
(assert (< (+ (* w1 0.4) (* w2 1.0) (* w3 1.0) (* w4 0.628865979381443) (* w5 0.454081632653061) (* w6 0.222222222222222) (* w7 0.618333333333333) (* w8 0.273972602739726) (* w9 0.422680412371134) (* w10 0.331619537275064) (* w11 0.36734693877551) b) 0.0)) ; Constraint for sample 37 (Label: 0)
(assert (< (+ (* w1 0.8) (* w2 0.0) (* w3 1.0) (* w4 0.927835051546392) (* w5 0.466836734693878) (* w6 0.0) (* w7 0.981666666666667) (* w8 0.924657534246575) (* w9 0.216494845360825) (* w10 0.848329048843188) (* w11 0.659863945578231) b) 0.0)) ; Constraint for sample 38 (Label: 0)
(assert (< (+ (* w1 0.4) (* w2 0.0) (* w3 0.0) (* w4 0.206185567010309) (* w5 0.114795918367347) (* w6 0.222222222222222) (* w7 0.701666666666667) (* w8 0.0650684931506849) (* w9 0.00515463917525773) (* w10 0.169665809768638) (* w11 0.149659863945578) b) 0.0)) ; Constraint for sample 39 (Label: 0)
(assert (< (+ (* w1 0.2) (* w2 0.0) (* w3 0.0) (* w4 0.257731958762887) (* w5 0.198979591836735) (* w6 0.777777777777778) (* w7 0.651666666666667) (* w8 0.0719178082191781) (* w9 0.185567010309278) (* w10 0.200514138817481) (* w11 0.142857142857143) b) 0.0)) ; Constraint for sample 40 (Label: 0)
(assert (> (+ (* w1 0.0) (* w2 1.0) (* w3 0.0) (* w4 0.371134020618557) (* w5 0.369897959183673) (* w6 0.444444444444444) (* w7 0.15) (* w8 0.205479452054794) (* w9 0.293814432989691) (* w10 0.236503856041131) (* w11 0.312925170068027) b) 0.0)) ; Constraint for sample 41 (Label: 1)
(assert (< (+ (* w1 0.0) (* w2 0.0) (* w3 0.0) (* w4 0.515463917525773) (* w5 0.303571428571429) (* w6 0.777777777777778) (* w7 0.805) (* w8 0.174657534246575) (* w9 0.103092783505155) (* w10 0.285347043701799) (* w11 0.346938775510204) b) 0.0)) ; Constraint for sample 42 (Label: 0)
(assert (< (+ (* w1 0.6) (* w2 0.0) (* w3 0.0) (* w4 0.144329896907216) (* w5 0.0816326530612245) (* w6 0.444444444444444) (* w7 0.906666666666667) (* w8 0.157534246575342) (* w9 0.11340206185567) (* w10 0.125964010282776) (* w11 0.108843537414966) b) 0.0)) ; Constraint for sample 43 (Label: 0)
(assert (> (+ (* w1 0.4) (* w2 0.0) (* w3 1.0) (* w4 0.257731958762887) (* w5 0.23469387755102) (* w6 0.444444444444444) (* w7 0.223333333333333) (* w8 0.0958904109589041) (* w9 0.077319587628866) (* w10 0.200514138817481) (* w11 0.122448979591837) b) 0.0)) ; Constraint for sample 44 (Label: 1)
(assert (> (+ (* w1 0.0) (* w2 1.0) (* w3 1.0) (* w4 0.278350515463918) (* w5 0.186224489795918) (* w6 0.333333333333333) (* w7 0.0333333333333333) (* w8 0.277397260273973) (* w9 0.288659793814433) (* w10 0.239074550128535) (* w11 0.210884353741497) b) 0.0)) ; Constraint for sample 45 (Label: 1)
(assert (> (+ (* w1 0.6) (* w2 1.0) (* w3 0.0) (* w4 0.0103092783505155) (* w5 0.00510204081632653) (* w6 0.0) (* w7 0.295) (* w8 0.0273972602739726) (* w9 0.0103092783505155) (* w10 0.012853470437018) (* w11 0.0272108843537415) b) 0.0)) ; Constraint for sample 46 (Label: 1)
(assert (< (+ (* w1 0.8) (* w2 0.0) (* w3 1.0) (* w4 0.865979381443299) (* w5 0.586734693877551) (* w6 0.555555555555556) (* w7 0.808333333333333) (* w8 0.647260273972603) (* w9 0.195876288659794) (* w10 0.596401028277635) (* w11 0.306122448979592) b) 0.0)) ; Constraint for sample 47 (Label: 0)
(assert (> (+ (* w1 0.0) (* w2 0.0) (* w3 0.0) (* w4 0.381443298969072) (* w5 0.362244897959184) (* w6 0.333333333333333) (* w7 0.408333333333333) (* w8 0.205479452054794) (* w9 0.154639175257732) (* w10 0.25706940874036) (* w11 0.231292517006803) b) 0.0)) ; Constraint for sample 48 (Label: 1)
(assert (> (+ (* w1 0.8) (* w2 1.0) (* w3 1.0) (* w4 0.381443298969072) (* w5 0.308673469387755) (* w6 0.555555555555556) (* w7 0.288333333333333) (* w8 0.222602739726027) (* w9 0.242268041237113) (* w10 0.329048843187661) (* w11 0.258503401360544) b) 0.0)) ; Constraint for sample 49 (Label: 1)
(assert (< (+ (* w1 0.0) (* w2 0.0) (* w3 0.0) (* w4 0.948453608247423) (* w5 0.834183673469388) (* w6 0.111111111111111) (* w7 0.526666666666667) (* w8 0.530821917808219) (* w9 0.257731958762887) (* w10 0.637532133676093) (* w11 0.530612244897959) b) 0.0)) ; Constraint for sample 50 (Label: 0)
(assert (< (+ (* w1 1.0) (* w2 1.0) (* w3 0.0) (* w4 0.309278350515464) (* w5 0.181122448979592) (* w6 0.0) (* w7 0.896666666666667) (* w8 0.0787671232876712) (* w9 0.149484536082474) (* w10 0.254498714652956) (* w11 0.244897959183673) b) 0.0)) ; Constraint for sample 51 (Label: 0)
(assert (< (+ (* w1 0.6) (* w2 0.0) (* w3 0.0) (* w4 0.298969072164948) (* w5 0.272959183673469) (* w6 0.0) (* w7 0.405) (* w8 0.205479452054794) (* w9 0.11340206185567) (* w10 0.223650385604113) (* w11 0.163265306122449) b) 0.0)) ; Constraint for sample 52 (Label: 0)
(assert (< (+ (* w1 0.0) (* w2 1.0) (* w3 0.0) (* w4 0.793814432989691) (* w5 0.660714285714286) (* w6 0.888888888888889) (* w7 0.908333333333333) (* w8 0.48972602739726) (* w9 0.757731958762887) (* w10 0.696658097686375) (* w11 0.428571428571429) b) 0.0)) ; Constraint for sample 53 (Label: 0)
(assert (< (+ (* w1 0.2) (* w2 0.0) (* w3 0.0) (* w4 0.309278350515464) (* w5 0.186224489795918) (* w6 0.111111111111111) (* w7 0.486666666666667) (* w8 0.106164383561644) (* w9 0.0721649484536082) (* w10 0.200514138817481) (* w11 0.319727891156463) b) 0.0)) ; Constraint for sample 54 (Label: 0)
(assert (< (+ (* w1 1.0) (* w2 1.0) (* w3 1.0) (* w4 0.515463917525773) (* w5 0.454081632653061) (* w6 0.333333333333333) (* w7 0.848333333333333) (* w8 0.0856164383561644) (* w9 0.355670103092783) (* w10 0.352185089974293) (* w11 0.374149659863946) b) 0.0)) ; Constraint for sample 55 (Label: 0)
(assert (< (+ (* w1 0.0) (* w2 0.0) (* w3 1.0) (* w4 0.494845360824742) (* w5 0.5) (* w6 0.222222222222222) (* w7 0.746666666666667) (* w8 0.287671232876712) (* w9 0.438144329896907) (* w10 0.282776349614396) (* w11 0.204081632653061) b) 0.0)) ; Constraint for sample 56 (Label: 0)
(assert (< (+ (* w1 0.4) (* w2 0.0) (* w3 0.0) (* w4 0.45360824742268) (* w5 0.438775510204082) (* w6 1.0) (* w7 0.495) (* w8 0.393835616438356) (* w9 0.314432989690722) (* w10 0.354755784061697) (* w11 0.27891156462585) b) 0.0)) ; Constraint for sample 57 (Label: 0)
(assert (< (+ (* w1 0.2) (* w2 1.0) (* w3 0.0) (* w4 0.268041237113402) (* w5 0.165816326530612) (* w6 0.888888888888889) (* w7 0.493333333333333) (* w8 0.273972602739726) (* w9 0.0206185567010309) (* w10 0.179948586118252) (* w11 0.102040816326531) b) 0.0)) ; Constraint for sample 58 (Label: 0)
(assert (< (+ (* w1 0.0) (* w2 0.0) (* w3 0.0) (* w4 0.298969072164948) (* w5 0.229591836734694) (* w6 0.222222222222222) (* w7 0.605) (* w8 0.0479452054794521) (* w9 0.0721649484536082) (* w10 0.200514138817481) (* w11 0.258503401360544) b) 0.0)) ; Constraint for sample 59 (Label: 0)
(assert (< (+ (* w1 0.8) (* w2 1.0) (* w3 1.0) (* w4 0.216494845360825) (* w5 0.188775510204082) (* w6 0.777777777777778) (* w7 0.481666666666667) (* w8 0.208904109589041) (* w9 0.22680412371134) (* w10 0.154241645244216) (* w11 0.156462585034014) b) 0.0)) ; Constraint for sample 60 (Label: 0)
(assert (> (+ (* w1 0.8) (* w2 0.0) (* w3 0.0) (* w4 0.34020618556701) (* w5 0.219387755102041) (* w6 0.111111111111111) (* w7 0.283333333333333) (* w8 0.0479452054794521) (* w9 0.11340206185567) (* w10 0.308483290488432) (* w11 0.136054421768707) b) 0.0)) ; Constraint for sample 61 (Label: 1)
(assert (> (+ (* w1 0.4) (* w2 1.0) (* w3 0.0) (* w4 0.804123711340206) (* w5 0.502551020408163) (* w6 0.0) (* w7 0.336666666666667) (* w8 0.143835616438356) (* w9 0.11340206185567) (* w10 0.804627249357326) (* w11 0.673469387755102) b) 0.0)) ; Constraint for sample 62 (Label: 1)
(assert (> (+ (* w1 0.2) (* w2 1.0) (* w3 1.0) (* w4 0.0103092783505155) (* w5 0.0178571428571429) (* w6 0.444444444444444) (* w7 0.218333333333333) (* w8 0.0171232876712329) (* w9 0.0257731958762887) (* w10 0.0154241645244216) (* w11 0.00680272108843537) b) 0.0)) ; Constraint for sample 63 (Label: 1)
(assert (< (+ (* w1 0.2) (* w2 1.0) (* w3 0.0) (* w4 0.0309278350515464) (* w5 0.0357142857142857) (* w6 0.0) (* w7 0.633333333333333) (* w8 0.0273972602739726) (* w9 0.0412371134020619) (* w10 0.0282776349614396) (* w11 0.0476190476190476) b) 0.0)) ; Constraint for sample 64 (Label: 0)
(assert (> (+ (* w1 0.4) (* w2 1.0) (* w3 1.0) (* w4 0.154639175257732) (* w5 0.122448979591837) (* w6 0.888888888888889) (* w7 0.035) (* w8 0.0719178082191781) (* w9 0.144329896907216) (* w10 0.123393316195373) (* w11 0.102040816326531) b) 0.0)) ; Constraint for sample 65 (Label: 1)
(assert (> (+ (* w1 0.8) (* w2 0.0) (* w3 0.0) (* w4 0.34020618556701) (* w5 0.288265306122449) (* w6 0.444444444444444) (* w7 0.0583333333333334) (* w8 0.219178082191781) (* w9 0.268041237113402) (* w10 0.25706940874036) (* w11 0.156462585034014) b) 0.0)) ; Constraint for sample 66 (Label: 1)
(assert (< (+ (* w1 0.2) (* w2 0.0) (* w3 0.0) (* w4 0.164948453608247) (* w5 0.142857142857143) (* w6 0.777777777777778) (* w7 0.84) (* w8 0.0308219178082192) (* w9 0.128865979381443) (* w10 0.120822622107969) (* w11 0.0680272108843537) b) 0.0)) ; Constraint for sample 67 (Label: 0)
(assert (> (+ (* w1 1.0) (* w2 0.0) (* w3 1.0) (* w4 0.525773195876289) (* w5 0.456632653061224) (* w6 0.777777777777778) (* w7 0.41) (* w8 0.503424657534247) (* w9 0.407216494845361) (* w10 0.336760925449871) (* w11 0.272108843537415) b) 0.0)) ; Constraint for sample 68 (Label: 1)
(assert (< (+ (* w1 0.8) (* w2 1.0) (* w3 0.0) (* w4 0.742268041237113) (* w5 0.459183673469388) (* w6 0.444444444444444) (* w7 0.501666666666667) (* w8 0.565068493150685) (* w9 0.649484536082474) (* w10 0.732647814910026) (* w11 0.414965986394558) b) 0.0)) ; Constraint for sample 69 (Label: 0)
(assert (> (+ (* w1 0.6) (* w2 1.0) (* w3 1.0) (* w4 0.164948453608247) (* w5 0.155612244897959) (* w6 1.0) (* w7 0.226666666666667) (* w8 0.0547945205479452) (* w9 0.149484536082474) (* w10 0.105398457583548) (* w11 0.0884353741496599) b) 0.0)) ; Constraint for sample 70 (Label: 1)
(assert (< (+ (* w1 1.0) (* w2 0.0) (* w3 1.0) (* w4 0.721649484536082) (* w5 0.535714285714286) (* w6 0.0) (* w7 0.835) (* w8 0.342465753424657) (* w9 0.0876288659793814) (* w10 0.516709511568124) (* w11 0.489795918367347) b) 0.0)) ; Constraint for sample 71 (Label: 0)
(assert (< (+ (* w1 0.4) (* w2 0.0) (* w3 0.0) (* w4 0.443298969072165) (* w5 0.224489795918367) (* w6 0.888888888888889) (* w7 0.488333333333333) (* w8 0.0) (* w9 0.0309278350515464) (* w10 0.311053984575835) (* w11 0.170068027210884) b) 0.0)) ; Constraint for sample 72 (Label: 0)
(check-sat)
(get-model)